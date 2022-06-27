import { useParams } from 'react-router-dom';
import { useEffect, useState } from 'react';
import CurrencyFormat from 'react-currency-format';
import ProductItem from '~/components/ProductItem';
import Button from '~/components/Button';
import styles from './ProductDetail.module.scss';
import '~/../node_modules/react-image-gallery/styles/scss/image-gallery.scss';
import classNames from 'classnames/bind';
import ImageGallery from 'react-image-gallery';
import * as productsService from '~/services/productsService';
import * as productCategoryService from '~/services/productCategoryService';
const cx = classNames.bind(styles);

function ProductDetail() {
    const { id } = useParams();
    const [images, setimages] = useState([]);
    const [pricelist, setpricelist] = useState([]);
    const [colorlist, setcolorlist] = useState([]);
    const [pricedefault, setpricedefault] = useState({});
    const [productDetail, setProductDetail] = useState({});
    const [productCategoryHome, setProductCategoryHome] = useState([]);
    const [productSameType, setProductSameType] = useState([]);
    const productChoose = {
        sizeId: 0,
        price: 0,
        colorId: 0,
        productId: id,
        quantity: 1,
    };
    useEffect(() => {
        const fetchProductDetail = async () => {
            try {
                let images = [];
                const response = await productsService.getProductDetail(id);
                setProductDetail(response);
                setpricelist(response.productPrice);
                setcolorlist(response.productColor);
                productChoose.sizeId = response.productPrice[0].sizeId;
                productChoose.price = response.productPrice[0].price;
                productChoose.colorId = response.productColor[0].colorId;
                setpricedefault(productChoose);
                setProductSameType(response.productsSameType);
                response.images.split(',').map((item) => {
                    const img = {
                        original: require('src/assets/images/products/' + item),
                        thumbnail: require('src/assets/images/products/' + item),
                    };
                    images.push(img);
                    setimages(images);
                });
            } catch (error) {
                console.log(error);
            }
        };
        fetchProductDetail();
    }, []);

    useEffect(() => {
        const fetchProductCategoryHome = async () => {
            try {
                const response = await productCategoryService.getProductCategory();
                setProductCategoryHome(response);
            } catch (error) {
                console.log(error);
            }
        };
        fetchProductCategoryHome();
    }, []);

    const handleSizeClick = (sizeId) => {
        let sizeNew = pricelist.filter((c) => c.sizeId == sizeId);
        productChoose.sizeId = sizeNew[0].sizeId;
        productChoose.price = sizeNew[0].price;
        productChoose.colorId = pricedefault.colorId;
        setpricedefault(productChoose);
    };
    const handleColorClick = (colorId) => {
        let colorNew = colorlist.filter((c) => c.colorId == colorId);
        productChoose.sizeId = pricedefault.sizeId;
        productChoose.price = pricedefault.price;
        productChoose.colorId = colorNew[0].colorId;
        setpricedefault(productChoose);
    };

    const increment = () => {
        productChoose.sizeId = pricedefault.sizeId;
        productChoose.price = pricedefault.price;
        productChoose.colorId = pricedefault.colorId;
        productChoose.quantity = pricedefault.quantity + 1;
        setpricedefault(productChoose);
    };

    const decrement = () => {
        productChoose.sizeId = pricedefault.sizeId;
        productChoose.price = pricedefault.price;
        productChoose.colorId = pricedefault.colorId;
        productChoose.quantity = pricedefault.quantity > 1 ? pricedefault.quantity - 1 : 1;
        setpricedefault(productChoose);
    };

    return (
        <>
            <div className={cx('container')}>
                <div className={cx('category')}>
                    <h5 className={cx('headline')}>Danh mục</h5>
                    <ul className={cx('productCategory')}>
                        {productCategoryHome.map((item, index) => (
                            <li className={cx('productCategory-item')} key={index}>
                                <a href={'/danh-muc-san-pham/' + item.id} className={cx('productCategory-name')}>
                                    {item.name}
                                </a>
                            </li>
                        ))}
                    </ul>
                </div>
                <div className={cx('content')}>
                    <div className={cx('slideProduct')}>
                        <ImageGallery items={images} showNav={false} lazyLoad={true} showPlayButton={false} />
                    </div>
                    <div className={cx('product-detail')}>
                        <div className={cx('product-detail-name')}>{productDetail.name}</div>
                        <p className={cx('product-detail-price')}>
                            <CurrencyFormat
                                value={pricedefault.price}
                                displayType={'text'}
                                thousandSeparator={true}
                                suffix={' vnđ'}
                            />
                        </p>
                        <hr />
                        <ul className={cx('product-detail-size')}>
                            <li className={cx('product-detail-size-headline')}>Kích thước:</li>
                            {pricelist.map((item, index) =>
                                item.sizeId == pricedefault.sizeId ? (
                                    <li className={cx('product-detail-size-active')} key={index}>
                                        {item.sizeName}
                                    </li>
                                ) : (
                                    <li
                                        className={cx('product-detail-size-item')}
                                        key={index}
                                        onClick={() => {
                                            handleSizeClick(item.sizeId);
                                        }}
                                    >
                                        {item.sizeName}
                                    </li>
                                ),
                            )}
                        </ul>
                        <ul className={cx('product-detail-size')}>
                            <li className={cx('product-detail-size-headline')}>Màu sắc:</li>
                            {colorlist.map((item, index) =>
                                item.colorId == pricedefault.colorId ? (
                                    <li className={cx('product-detail-size-active')} key={index}>
                                        {item.colorName}
                                    </li>
                                ) : (
                                    <li
                                        className={cx('product-detail-size-item')}
                                        key={index}
                                        onClick={() => {
                                            handleColorClick(item.colorId);
                                        }}
                                    >
                                        {item.colorName}
                                    </li>
                                ),
                            )}
                        </ul>
                        <hr />
                        <p className={cx('product-detail-des')}> {productDetail.detail}</p>
                        <div className={cx('quantity-input')}>
                            <span className={cx('title-quantity')}>Số lượng:</span>
                            <button
                                className={cx('quantity-input__modifier', 'quantity-input__modifier--left')}
                                onClick={() => {
                                    decrement();
                                }}
                            >
                                &mdash;
                            </button>
                            <input className={cx('quantity-input__screen')} type="text" value={pricedefault.quantity} />
                            <button
                                className={cx('quantity-input__modifier', 'quantity-input__modifier--right')}
                                onClick={() => {
                                    increment();
                                }}
                            >
                                &#xff0b;
                            </button>
                        </div>
                        <div>
                            <span className={cx('title-quantity')}>Ghi Chú:</span>
                            <textarea name="myTextBox" cols="50" rows="5"></textarea>
                        </div>
                        <div className={cx('product-detail-cart')}>
                            <Button text>Thêm giỏ hàng</Button>
                            <Button primary>Mua ngay</Button>
                        </div>
                    </div>
                </div>
            </div>
            <div className={cx('container-sanpham')}>
                <div className={cx('headline')}>
                    <h3>Sản phẩm tương tự</h3>
                </div>
                <ul className={cx('products')}>
                    {productSameType.map((item, index) => (
                        <ProductItem item={item} key={index} />
                    ))}
                </ul>
            </div>
        </>
    );
}
export default ProductDetail;
