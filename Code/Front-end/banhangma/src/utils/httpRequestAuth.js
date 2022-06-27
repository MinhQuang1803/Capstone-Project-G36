import axios from 'axios';

const httpRequest = axios.create({
    baseURL: process.env.REACT_APP_BASE_URL,
    headers: {
        'Content-Type': 'application/json',
    },
});
httpRequest.interceptors.request.use(async (config) => {
    const token = LocalStorage.get('_token');
    if (token) {
        config.headers.Authorization = `Bearer ${token}`;
    }

    return config;
});

export const get = async (path, options = {}) => {
    const response = await httpRequest.get(path, options);
    return response.data;
};

export default httpRequest;
