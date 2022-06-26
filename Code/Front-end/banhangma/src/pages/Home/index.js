import { useEffect, useState } from 'react';
import styles from './Home.module.scss';
import classNames from 'classnames/bind';

import * as productsService from '~/services/productsService';
import * as productCategoryService from '~/services/productCategoryService';
import ProductItem from '~/components/ProductItem';
import slide_2 from '~/assets/images/slides/slide_2.png';
import slide_3 from '~/assets/images/slides/slide_3.png';
import slide_4 from '~/assets/images/slides/slide_4.png';
import SlideshowGallery from '~/components/slideshow-gallery/slideshow-gallery';
const cx = classNames.bind(styles);
const collection = [
    { src: slide_2, caption: 'Mừng hè 1' },
    { src: slide_3, caption: 'Mừng hè 2' },
    { src: slide_4, caption: 'Mừng hè 3' },
];

function Home() {
    const [productHome, setProductHome] = useState([]);
    const [productCategoryHome, setProductCategoryHome] = useState([]);

    useEffect(() => {
        const fetchProductHome = async () => {
            try {
                const response = await productsService.getProductHome();
                setProductHome(response);
            } catch (error) {
                console.log(error);
            }
        };
        fetchProductHome();
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
    return (
        <>
            <div className={cx('slide-home')}>
                <SlideshowGallery input={collection} ratio={`6.5:2`} mode={`automatic`} timeout={`3000`} />
            </div>
            <div className={cx('headline')}>
                <h3>DANH MỤC</h3>
            </div>
            <ul className={cx('product-category')}>
                {productCategoryHome.map((item, index) => (
                    <li className={cx('product-category-item')} key={index}>
                        <div className={cx('product-category-top')}>
                            <a href={'/danh-muc-san-pham/' + item.id} className={cx('product-category-thumb')}>
                                <img src={require('src/assets/images/category/' + item.image)} alt="" />
                            </a>
                        </div>
                        <div className={cx('product-category-info')}>
                            <a href={'/danh-muc-san-pham/' + item.id} className={cx('product-category-name')}>
                                {item.name}
                            </a>
                        </div>
                    </li>
                ))}
            </ul>

            <div className={cx('headline')}>
                <h3>Sản phẩm bán chạy</h3>
            </div>
            <ul className={cx('products')}>
                {productHome.map((product, index) => (
                    <ProductItem item={product} key={index} />
                ))}
            </ul>
        </>
    );
}

export default Home;
