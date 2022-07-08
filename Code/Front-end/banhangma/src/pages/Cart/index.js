import { React, useEffect, useState } from 'react';
import { useNavigate } from 'react-router-dom';
import { useForm } from 'react-hook-form';
import * as cartsService from '~/services/cartsService';
import * as orderService from '~/services/orderService';
import CurrencyFormat from 'react-currency-format';
import styles from './Cart.module.scss';
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome';
import { faPlus, faMinus, faTrash } from '@fortawesome/fontawesome-free-solid';
import classNames from 'classnames/bind';
import { cartAdd } from '~/Models/cartAdd';
import { cartDelete } from '~/Models/cartDelete';
import { orderAdd } from '~/Models/orderAdd';
import * as authService from '~/services/authService';
import config from '~/config';
import province from '~/assets/provinces.json';
import districts from '~/assets/districts.json';
import wards from '~/assets/wards.json';
const cx = classNames.bind(styles);
function Cart() {
    const [cartlist, setcartlist] = useState([]);
    const [user, setUser] = useState({});
    const [total, settotal] = useState(0);
    const [ship, setship] = useState(0);
    const [leght, setleght] = useState(0);
    const navigate = useNavigate();
    const {
        register,
        handleSubmit,
        formState: { errors },
        reset,
    } = useForm();

    useEffect(() => {
        const currentUser = localStorage.getItem('currentUser');
        if (!currentUser) {
            navigate(config.routes.home);
        }
    }, []);

    useEffect(() => {
        const fetchCart = async () => {
            try {
                const userid = localStorage.getItem('userID');
                const response = await cartsService.GetCart(userid);
                const data = response.data;
                setcartlist(data);
                setleght(data.length);
                const result = data.reduce((total, data) => (total = total + data.quantity * data.priceProduct), 0);
                settotal(result);
            } catch (error) {
                console.log(error);
            }
        };
        fetchCart();
    }, []);

    useEffect(() => {
        const fetchUser = async () => {
            try {
                const userid = localStorage.getItem('userID');
                const response = await authService.gettoken(userid);
                setUser(response.data);
            } catch (error) {
                console.log(error);
            }
        };
        fetchUser();
    }, []);

    useEffect(() => {
        const fetchShip = async () => {
            try {
                const userid = localStorage.getItem('userID');
                const response = await cartsService.GetShip(userid);
                setship(response.data);
            } catch (error) {
                console.log(error);
            }
        };
        fetchShip();
    }, []);

    useEffect(() => {
        reset(user);
    }, [user]);

    const onHandleSubmit = (data) => {
        const order = new orderAdd();
        order.Userid = localStorage.getItem('userID');
        order.Address = data.address;
        order.Mobile = data.mobile;
        order.Email = data.email;
        order.ReceiverName = data.fullname;
        order.ProvinceId = data.provinceId;
        order.DistrictId = data.districtId;
        order.WardId = data.wardId;
        const fetchAddOrder = async () => {
            try {
                const response = await orderService.OrderAdd(order);
                if (response.data > 0) {
                    navigate(config.routes.orderSuccess);
                }
            } catch (error) {
                console.log(error);
            }
        };
        fetchAddOrder();
    };

    const increment = (id) => {
        var product = cartlist.filter((c) => c.id == id);
        const cart = new cartAdd();
        cart.ProductId = product[0].productId;
        cart.Userid = localStorage.getItem('userID');
        cart.SizeId = product[0].sizeId;
        cart.Quantity = 1;
        cart.Colorid = product[0].colorid;
        cart.isAdd = true;
        const fetchAddCart = async () => {
            try {
                const response = await cartsService.CartAdd(cart);
                const data = response.data;
                setcartlist(data);
                const result = data.reduce((total, data) => (total = total + data.quantity * data.priceProduct), 0);
                settotal(result);
            } catch (error) {
                console.log(error);
            }
        };
        fetchAddCart();
    };

    const decrement = (id) => {
        var product = cartlist.filter((c) => c.id == id);
        const cart = new cartAdd();
        cart.ProductId = product[0].productId;
        cart.Userid = localStorage.getItem('userID');
        cart.SizeId = product[0].sizeId;
        cart.Quantity = 1;
        cart.Colorid = product[0].colorid;
        cart.isAdd = false;
        const fetchAddCart = async () => {
            try {
                const response = await cartsService.CartAdd(cart);
                const data = response.data;
                setcartlist(data);
                const result = data.reduce((total, data) => (total = total + data.quantity * data.priceProduct), 0);
                settotal(result);
            } catch (error) {
                console.log(error);
            }
        };
        fetchAddCart();
    };
    const deleteProduct = (id) => {
        var product = cartlist.filter((c) => c.id == id);
        const cart = new cartDelete();
        cart.ProductId = product[0].productId;
        cart.Userid = localStorage.getItem('userID');
        cart.SizeId = product[0].sizeId;
        cart.Colorid = product[0].colorid;
        const fetchDeleteCart = async () => {
            try {
                const response = await cartsService.CartDelete(cart);
                const data = response.data;
                setcartlist(data);
                setleght(data.length);
                const result = data.reduce((total, data) => (total = total + data.quantity * data.priceProduct), 0);
                settotal(result);
            } catch (error) {
                console.log(error);
            }
        };
        fetchDeleteCart();
    };

    const handleChange = (event) => {
        console.log(event.target.value);
    };
    return (
        <div className=" container-fluid my-5 ">
            <section className="h-100 gradient-custom">
                <div className="container">
                    <div className="row d-flex justify-content-center my-4">
                        <div className="col-md-8">
                            <div className="card mb-4">
                                <div className="card-header py-3">
                                    <h5 className="mb-0">Giỏ hàng - {leght} sản phẩm</h5>
                                </div>
                                <div className="card-body">
                                    {cartlist.map((item, index) => (
                                        <div key={index}>
                                            <div className="row">
                                                <div className="col-lg-3 col-md-12 mb-4 mb-lg-0">
                                                    <div
                                                        className={cx(
                                                            'bg-image',
                                                            'hover-overlay',
                                                            'hover-zoom',
                                                            'ripple',
                                                            'rounded',
                                                        )}
                                                        data-mdb-ripple-color="light"
                                                    >
                                                        {' '}
                                                        <a href={'/san-pham/' + item.productId}>
                                                            <img
                                                                src={require('src/assets/images/products/' +
                                                                    item.images.split(',')[0])}
                                                                className="w-100"
                                                                alt={item.nameProduct}
                                                            />
                                                        </a>
                                                    </div>
                                                </div>

                                                <div className="col-lg-5 col-md-6 mb-4 mb-lg-0">
                                                    <a href={'/san-pham/' + item.productId}>
                                                        <p>
                                                            <strong>{item.nameProduct}</strong>
                                                        </p>
                                                    </a>
                                                    <p>Màu: {item.nameColor}</p>
                                                    <p>Size: {item.nameSize}</p>
                                                    <button
                                                        type="button"
                                                        className="btn btn-danger btn-sm me-1 mb-2"
                                                        data-mdb-toggle="tooltip"
                                                        title="Remove item"
                                                        onClick={() => {
                                                            deleteProduct(item.id);
                                                        }}
                                                    >
                                                        <FontAwesomeIcon icon={faTrash} width="10px" />
                                                    </button>
                                                </div>

                                                <div className="col-lg-4 col-md-6 mb-4 mb-lg-0">
                                                    <div className={cx('d-flex', 'mb-4')}>
                                                        <button
                                                            className="btn btn-primary px-3 me-2"
                                                            onClick={() => {
                                                                decrement(item.id);
                                                            }}
                                                        >
                                                            <FontAwesomeIcon icon={faMinus} width="10px" />
                                                        </button>

                                                        <div className={cx('form-outline')}>
                                                            <input
                                                                id="form1"
                                                                min="0"
                                                                name="quantity"
                                                                value={item.quantity}
                                                                onChange={handleChange}
                                                                type="number"
                                                                className={cx('form-control')}
                                                            />
                                                            <label className={cx('form-label')} htmlFor="form1">
                                                                Số lượng
                                                            </label>
                                                            <div className={cx('form-notch')}>
                                                                <div
                                                                    className={cx('form-notch-leading')}
                                                                    // style="width: 9px;"
                                                                ></div>
                                                                <div
                                                                    className={cx('form-notch-middle')}
                                                                    // style="width: 55.2px;"
                                                                ></div>
                                                                <div className={cx('form-notch-trailing')}></div>
                                                            </div>
                                                        </div>

                                                        <button
                                                            className="btn btn-primary px-3 ms-2"
                                                            onClick={() => {
                                                                increment(item.id);
                                                            }}
                                                        >
                                                            <FontAwesomeIcon icon={faPlus} width="10px" />
                                                        </button>
                                                    </div>

                                                    <p className="text-start text-md-center">
                                                        <strong>
                                                            {' '}
                                                            <CurrencyFormat
                                                                value={item.priceProduct * item.quantity}
                                                                displayType={'text'}
                                                                thousandSeparator={true}
                                                                suffix={' vnđ'}
                                                            />
                                                        </strong>
                                                    </p>
                                                </div>
                                            </div>

                                            <hr className="my-4" />
                                        </div>
                                    ))}
                                </div>
                            </div>
                        </div>
                        <div className="col-md-4">
                            <div className="card mb-4">
                                <div className="card-header py-3">
                                    <h5 className="mb-0">Tổng tiền</h5>
                                </div>
                                <div className="card-body">
                                    <ul className="list-group list-group-flush">
                                        <li className="list-group-item d-flex justify-content-between align-items-center border-0 px-0 pb-0">
                                            Tiền hàng
                                            <span>
                                                <CurrencyFormat
                                                    value={total}
                                                    displayType={'text'}
                                                    thousandSeparator={true}
                                                    suffix={' vnđ'}
                                                />
                                            </span>
                                        </li>
                                        <li className="list-group-item d-flex justify-content-between align-items-center px-0">
                                            Phí Ship
                                            <span>
                                                <CurrencyFormat
                                                    value={ship}
                                                    displayType={'text'}
                                                    thousandSeparator={true}
                                                    suffix={' vnđ'}
                                                />
                                            </span>
                                        </li>
                                        <li className="list-group-item d-flex justify-content-between align-items-center border-0 px-0 mb-3">
                                            <div>
                                                <strong>Tổng tiền</strong>
                                                <strong>
                                                    <p className="mb-0">(Đã bao gồm VAT)</p>
                                                </strong>
                                            </div>
                                            <span>
                                                <strong>
                                                    <CurrencyFormat
                                                        value={total + ship}
                                                        displayType={'text'}
                                                        thousandSeparator={true}
                                                        suffix={' vnđ'}
                                                    />
                                                </strong>
                                            </span>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            <div className="card mb-4">
                                <div className="card-header py-3">
                                    <h5 className="mb-0">Địa chỉ nhận hàng</h5>
                                </div>
                                <div className="card-body">
                                    {user && (
                                        <form action="" onSubmit={handleSubmit(onHandleSubmit)}>
                                            <div class="col-12">
                                                <label htmlFor="Fullname" className="form-label">
                                                    Họ và tên
                                                </label>
                                                <div className="input-group has-validation">
                                                    <input
                                                        name="fullname"
                                                        className="form-control"
                                                        placeholder="Họ và tên"
                                                        {...register('fullname', { required: true })}
                                                    />
                                                    {errors.fullname && errors.fullname.type === 'required' && (
                                                        <span className={cx('invalid-feedback')}>
                                                            Chưa nhập họ và tên!
                                                        </span>
                                                    )}
                                                </div>
                                            </div>

                                            <div class="col-12 mt-2">
                                                <label htmlFor="mobile" className="form-label">
                                                    Số điện thoại
                                                </label>
                                                <div className="input-group has-validation">
                                                    <input
                                                        name="mobile"
                                                        className="form-control"
                                                        placeholder="Số điện thoại"
                                                        {...register('mobile', { required: true })}
                                                    />
                                                    {errors.mobile && errors.mobile.type === 'required' && (
                                                        <span className={cx('invalid-feedback')}>
                                                            Chưa nhập số điện thoại!
                                                        </span>
                                                    )}
                                                </div>
                                            </div>

                                            <div class="col-12 mt-2">
                                                <label htmlFor="email" className="form-label">
                                                    Email
                                                </label>
                                                <div className="input-group has-validation">
                                                    <input
                                                        name="email"
                                                        className="form-control"
                                                        placeholder="Email"
                                                        {...register('email', { required: true })}
                                                    />
                                                    {errors.email && errors.email.type === 'required' && (
                                                        <span className={cx('invalid-feedback')}>Chưa nhập Email!</span>
                                                    )}
                                                </div>
                                            </div>

                                            <div class="col-12 mt-2">
                                                <label htmlFor="provinceId" className="form-label">
                                                    Tỉnh/ Thành phố
                                                </label>
                                                <div className="input-group has-validation">
                                                    <select
                                                        name="provinceId"
                                                        {...register('provinceId', { required: true })}
                                                        className="form-control"
                                                    >
                                                        {province.map((item, index) => (
                                                            <option value={item.code} key={index}>
                                                                {item.name}
                                                            </option>
                                                        ))}
                                                    </select>
                                                    {errors.provinceId && errors.provinceId.type === 'required' && (
                                                        <span className={cx('invalid-feedback')}>
                                                            Chưa chọn Tỉnh/ Thành phố !
                                                        </span>
                                                    )}
                                                </div>
                                            </div>

                                            <div class="col-12 mt-2">
                                                <label htmlFor="districtId" className="form-label">
                                                    Quận/ Huyện
                                                </label>
                                                <div className="input-group has-validation">
                                                    <select
                                                        name="districtId"
                                                        {...register('districtId', { required: true })}
                                                        className="form-control"
                                                    >
                                                        {districts.map((item, index) => (
                                                            <option value={item.code} key={index}>
                                                                {item.name}
                                                            </option>
                                                        ))}
                                                    </select>
                                                    {errors.districtId && errors.districtId.type === 'required' && (
                                                        <span className={cx('invalid-feedback')}>
                                                            Chưa chọn Quận/ Huyện !
                                                        </span>
                                                    )}
                                                </div>
                                            </div>

                                            <div class="col-12 mt-2">
                                                <label htmlFor="wardId" className="form-label">
                                                    Xã/ Phường
                                                </label>
                                                <div className="input-group has-validation">
                                                    <select
                                                        name="wardId"
                                                        {...register('wardId', { required: true })}
                                                        className="form-control"
                                                    >
                                                        {wards.map((item, index) => (
                                                            <option value={item.code} key={index}>
                                                                {item.name}
                                                            </option>
                                                        ))}
                                                    </select>
                                                    {errors.wardId && errors.wardId.type === 'required' && (
                                                        <span className={cx('invalid-feedback')}>
                                                            Chưa chọn Xã/ Phường !
                                                        </span>
                                                    )}
                                                </div>
                                            </div>

                                            <div class="col-12 mt-2">
                                                <label htmlFor="address" className="form-label">
                                                    Địa chỉ
                                                </label>
                                                <div className="input-group has-validation">
                                                    <input
                                                        name="address"
                                                        className="form-control"
                                                        placeholder="address"
                                                        {...register('address', { required: true })}
                                                    />
                                                    {errors.address && errors.address.type === 'required' && (
                                                        <span className={cx('invalid-feedback')}>
                                                            Chưa nhập địa chỉ !
                                                        </span>
                                                    )}
                                                </div>
                                            </div>

                                            <button type="submit" className="btn btn-primary btn-lg btn-block mt-2">
                                                Đặt hàng
                                            </button>
                                        </form>
                                    )}
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </div>
    );
}

export default Cart;
