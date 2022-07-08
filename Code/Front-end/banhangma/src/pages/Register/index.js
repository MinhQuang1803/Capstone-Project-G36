import { React, useEffect } from 'react';
import { useNavigate } from 'react-router-dom';
import { userAdd } from '~/Models/userAdd';
import config from '~/config';
import province from '~/assets/provinces.json';
import districts from '~/assets/districts.json';
import wards from '~/assets/wards.json';
import { useForm } from 'react-hook-form';
import * as usersService from '~/services/usersService';
import styles from './Register.module.scss';
import classNames from 'classnames/bind';
const cx = classNames.bind(styles);
function Register() {
    const navigate = useNavigate();
    const {
        register,
        handleSubmit,
        formState: { errors },
    } = useForm();
    useEffect(() => {
        const currentUser = localStorage.getItem('currentUser');
        if (currentUser) {
            navigate(config.routes.home);
        }
    }, []);
    const onHandleSubmit = (data) => {
        const fetchUser = async () => {
            try {
                const user = new userAdd();
                user.Fullname = data.Fullname;
                user.Password = data.Password;
                user.WardId = data.WardId;
                user.DistrictId = data.DistrictId;
                user.ProvinceId = data.ProvinceId;
                user.Address = data.Address;
                user.Mobile = data.Mobile;
                user.Email = data.Email;
                const response = await usersService.UserAdd(user);
                if (response > 0) {
                    navigate('/dang-nhap');
                } else {
                    console.log('Có lỗi xảy ra!');
                }
            } catch (error) {
                console.log(error);
            }
        };
        fetchUser();
    };
    return (
        <div className={cx('form-signin', 'w-100', 'm-auto')}>
            <form action="" onSubmit={handleSubmit(onHandleSubmit)}>
                <h1 className="h3 mb-3 fw-normal text-center">Đăng ký</h1>
                <div className="row g-3">
                    <div class="col-12">
                        <label htmlFor="Fullname" className="form-label">
                            Họ và tên
                        </label>
                        <div className="input-group has-validation">
                            <input
                                id="Fullname"
                                className="form-control"
                                type="text"
                                placeholder="Họ và tên"
                                {...register('Fullname', { required: true })}
                            />
                            {errors.Fullname && errors.Fullname.type === 'required' && (
                                <span className={cx('invalid-feedback')}>Chưa nhập họ và tên!</span>
                            )}
                        </div>
                    </div>
                    <div class="col-12">
                        <label htmlFor="Password" className="form-label">
                            Mật khẩu
                        </label>
                        <div className="input-group has-validation">
                            <input
                                type="Password"
                                className="form-control"
                                placeholder="Mật khẩu"
                                {...register('Password', { required: true })}
                            />
                            {errors.Password && errors.Password.type === 'required' && (
                                <span className={cx('invalid-feedback')}>Chưa nhập mật khẩu!</span>
                            )}
                        </div>
                    </div>
                    <div class="col-12">
                        <label htmlFor="Mobile" className="form-label">
                            Số điện thoại
                        </label>
                        <div className="input-group has-validation">
                            <input
                                type="Mobile"
                                className="form-control"
                                placeholder="Số điện thoại"
                                {...register('Mobile', { required: true })}
                            />
                            {errors.Mobile && errors.Mobile.type === 'required' && (
                                <span className={cx('invalid-feedback')}>Chưa nhập số điện thoại!</span>
                            )}
                        </div>
                    </div>
                    <div class="col-12">
                        <label htmlFor="Email" className="form-label">
                            Email
                        </label>
                        <div className="input-group has-validation">
                            <input
                                type="Email"
                                className="form-control"
                                placeholder="Email"
                                {...register('Email', { required: true })}
                            />
                            {errors.Email && errors.Email.type === 'required' && (
                                <span className={cx('invalid-feedback')}>Chưa nhập email!</span>
                            )}
                        </div>
                    </div>
                    <div class="col-12">
                        <label htmlFor="ProvinceId" className="form-label">
                            Tỉnh thành
                        </label>
                        <div className="input-group has-validation">
                            <select
                                type="ProvinceId"
                                className="form-control"
                                {...register('ProvinceId', { required: true })}
                            >
                                {province.map((item, index) => (
                                    <option value={item.code} key={index}>
                                        {item.name}
                                    </option>
                                ))}
                            </select>
                            {errors.ProvinceId && errors.ProvinceId.type === 'required' && (
                                <span className={cx('invalid-feedback')}>Chưa nhập tỉnh thành!</span>
                            )}
                        </div>
                    </div>
                    <div class="col-12">
                        <label htmlFor="DistrictId" className="form-label">
                            Quận huyện
                        </label>
                        <div className="input-group has-validation">
                            <select
                                type="DistrictId"
                                className="form-control"
                                {...register('DistrictId', { required: true })}
                            >
                                {districts.map((item, index) => (
                                    <option value={item.code} key={index}>
                                        {item.name}
                                    </option>
                                ))}
                            </select>
                            {errors.DistrictId && errors.DistrictId.type === 'required' && (
                                <span className={cx('invalid-feedback')}>Chưa nhập quận huyện!</span>
                            )}
                        </div>
                    </div>
                    <div class="col-12">
                        <label htmlFor="WardId" className="form-label">
                            Xã phường
                        </label>
                        <div className="input-group has-validation">
                            <select type="WardId" className="form-control" {...register('WardId', { required: true })}>
                                {wards.map((item, index) => (
                                    <option value={item.code} key={index}>
                                        {item.name}
                                    </option>
                                ))}
                            </select>
                            {errors.WardId && errors.WardId.type === 'required' && (
                                <span className={cx('invalid-feedback')}>Chưa nhập xã phường!</span>
                            )}
                        </div>
                    </div>
                    <div class="col-12">
                        <label htmlFor="Address" className="form-label">
                            Địa chỉ
                        </label>
                        <div className="input-group has-validation">
                            <input
                                type="Address"
                                className="form-control"
                                placeholder="Địa chỉ"
                                {...register('Address', { required: true })}
                            />
                            {errors.Address && errors.Address.type === 'required' && (
                                <span className={cx('invalid-feedback')}>Chưa nhập địa chỉ!</span>
                            )}
                        </div>
                    </div>
                </div>
                <hr className="my-4"></hr>
                <button className="w-100 btn btn-lg btn-primary" type="submit">
                    Đăng ký
                </button>
            </form>
        </div>
    );
}

export default Register;
