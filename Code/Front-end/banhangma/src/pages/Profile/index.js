import styles from './Profile.module.scss';
import classNames from 'classnames/bind';
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome';
import { faCar } from '@fortawesome//fontawesome-free-solid';
import CurrencyFormat from 'react-currency-format';
import Button from '~/components/Button';
const cx = classNames.bind(styles);
function Profile() {
    return (
        <div className={cx('container')}>
            <h3>Thông tin tài khoản</h3>
        </div>
    );
}

export default Profile;
