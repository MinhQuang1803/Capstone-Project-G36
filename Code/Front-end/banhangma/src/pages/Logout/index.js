import { React, useEffect } from 'react';
import { useNavigate } from 'react-router-dom';
import config from '~/config';
import styles from './Logout.module.scss';
import classNames from 'classnames/bind';
const cx = classNames.bind(styles);

function Logout() {
    const navigate = useNavigate();
    useEffect(() => {
        const currentUser = localStorage.getItem('currentUser');
        if (currentUser) {
            setTimeout(() => {
                localStorage.removeItem('currentUser');
                localStorage.removeItem('_token');
                navigate(config.routes.home);
            }, 2000);
        } else {
            navigate(config.routes.home);
        }
    }, []);
    return (
        <div className={cx('container')}>
            <h4>Đang thoát tài khoản...</h4>
        </div>
    );
}

export default Logout;
