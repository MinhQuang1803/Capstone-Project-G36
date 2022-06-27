import httpRequest from '~/utils/httpRequest';

export const search = (q, type = 'less') => {
    try {
        const data = {
            Email: q,
            Password: type,
        };
        return httpRequest.get('/users/search', data);
    } catch (error) {
        console.log(error);
    }
};
