import { useParams } from 'react-router-dom';
import { useEffect, useState } from 'react';
import ReactDOM from 'react-dom';
import ReactPaginate from 'react-paginate';
import ProductItem from '~/components/ProductItem';
import styles from './ProductCategory.module.scss';
import '~/../node_modules/react-image-gallery/styles/scss/image-gallery.scss';
import classNames from 'classnames/bind';
import * as productsService from '~/services/productsService';
import * as productCategoryService from '~/services/productCategoryService';
const cx = classNames.bind(styles);

function ProductCategory() {
    const { id } = useParams();
    const [productCategoryHome, setProductCategoryHome] = useState([]);
    const [productList, setProductList] = useState([]);
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
    useEffect(() => {
        const fetchProductList = async () => {
            try {
                const response = await productsService.GetProducts(id);
                setProductList(response);
            } catch (error) {
                console.log(error);
            }
        };
        fetchProductList();
    }, []);

    //Phân trang
    const [currentItems, setCurrentItems] = useState([]);
    const [pageCount, setPageCount] = useState(0);
    const [itemOffset, setItemOffset] = useState(0);
    const itemsPerPage = 12;

    useEffect(() => {
        const endOffset = itemOffset + itemsPerPage;
        setCurrentItems(productList.slice(itemOffset, endOffset));
        setPageCount(Math.ceil(productList.length / itemsPerPage));
    }, [itemOffset, itemsPerPage, productList]);

    const handlePageClick = (event) => {
        const newOffset = (event.selected * itemsPerPage) % productList.length;
        setItemOffset(newOffset);
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
                    {currentItems.length > 0 ? (
                        <ul className={cx('products')}>
                            {currentItems.map((product, index) => (
                                <ProductItem item={product} key={index} />
                            ))}
                        </ul>
                    ) : (
                        <div className={cx('products-no')}>
                            <h5 className={cx('products-no-title')}>Hiện không có sản phẩm nào!</h5>
                        </div>
                    )}
                    <ReactPaginate
                        breakLabel="..."
                        nextLabel=">"
                        onPageChange={handlePageClick}
                        pageRangeDisplayed={5}
                        pageCount={pageCount}
                        previousLabel="<"
                        renderOnZeroPageCount={null}
                        containerClassName={cx('pagination')}
                        pageLinkClassName={cx('page-num')}
                        previousLinkClassName={cx('page-num')}
                        nextLinkClassName={cx('page-num')}
                        activeLinkClassName={cx('active')}
                    />
                </div>
            </div>
        </>
    );
}

export default ProductCategory;
