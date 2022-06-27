import httpRequest from '~/utils/httpRequest';

export const getProductCategory = () => {
    try {
        return httpRequest.get('/ProductCategory/GetProductCategory');
    } catch (error) {
        console.log(error);
    }
};
