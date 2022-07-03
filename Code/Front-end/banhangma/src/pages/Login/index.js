import { React, useEffect } from 'react';
import { useNavigate } from 'react-router-dom';
import config from '~/config';
import { useForm } from 'react-hook-form';
import * as authService from '~/services/authService';
import styles from './Login.module.scss';
import classNames from 'classnames/bind';
const cx = classNames.bind(styles);
function Login() {
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
                const response = await authService.token(data.Email, data.Password);
                localStorage.setItem('_token', response.token);
                localStorage.setItem('userID', response.id);
                localStorage.setItem('userName', response.fullname);
                localStorage.setItem('userType', response.userType);
                localStorage.setItem('currentUser', true);
                navigate('/');
            } catch (error) {
                console.log(error);
            }
        };
        fetchUser();
    };
    return (
        <div className={cx('form-signin', 'w-100', 'm-auto')}>
            <form action="" onSubmit={handleSubmit(onHandleSubmit)}>
                <h1 className="h3 mb-3 fw-normal text-center">Đăng nhập</h1>
                <div className="row g-3">
                    <div class="col-12">
                        <label htmlFor="username" className="form-label">
                            Tài khoản
                        </label>
                        <div className="input-group has-validation">
                            <input
                                id="Email"
                                className="form-control"
                                type="text"
                                placeholder="Tài khoản"
                                {...register('Email', { required: true })}
                            />
                            {errors.Email && errors.Email.type === 'required' && (
                                <span className={cx('invalid-feedback')}>Chưa nhập tài khoản!</span>
                            )}
                        </div>
                    </div>
                    <div class="col-12">
                        <label htmlFor="username" className="form-label">
                            Mật khẩu
                        </label>
                        <div className="input-group has-validation">
                            <input
                                type="password"
                                className="form-control"
                                placeholder="Mật khẩu"
                                {...register('Password', { required: true })}
                            />
                            {errors.Password && errors.Password.type === 'required' && (
                                <span className={cx('invalid-feedback')}>Chưa nhập mật khẩu!</span>
                            )}
                        </div>
                    </div>
                </div>
                <hr className="my-4"></hr>
                <button className="w-100 btn btn-lg btn-primary" type="submit">
                    Đăng nhập
                </button>
            </form>
        </div>
    );
}

export default Login;
