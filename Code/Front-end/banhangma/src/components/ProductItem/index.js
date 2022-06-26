import styles from './ProductItem.module.scss';
import classNames from 'classnames/bind';
import PropTypes from 'prop-types';
import CurrencyFormat from 'react-currency-format';
const cx = classNames.bind(styles);
function ProductItem(props) {
    let img = require('src/assets/images/products/' + props.item.images.split(',')[0]);
    return (
        <li className={cx('product-item')}>
            <div className={cx('product-top')}>
                <a href={'/san-pham/' + props.item.id} className={cx('product-thumb')}>
                    <img src={img} alt="" />
                </a>
            </div>
            <div className={cx('product-info')}>
                <a href={'/san-pham/' + props.item.id} className={cx('product-name')}>
                    {props.item.name}
                </a>
                <div className={cx('product-price')}>
                    <CurrencyFormat
                        value={props.item.price}
                        displayType={'text'}
                        thousandSeparator={true}
                        suffix={' vnđ'}
                    />
                </div>
            </div>
        </li>
    );
}
ProductItem.propTypes = {
    item: PropTypes.object,
};

ProductItem.defaultProps = {
    item: {},
};
export default ProductItem;
