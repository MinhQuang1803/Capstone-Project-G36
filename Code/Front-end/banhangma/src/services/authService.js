import httpRequest from '~/utils/httpRequest';

export const token = (user, pass) => {
    try {
        const data = {
            Email: user,
            Password: pass,
        };
        const url = '/token';
        return httpRequest.post(url, data);
    } catch (error) {
        console.log(error);
    }
};
