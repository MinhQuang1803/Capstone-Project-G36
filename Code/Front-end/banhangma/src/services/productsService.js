import httpRequest from '~/utils/httpRequest';

export const getProductHome = () => {
    try {
        return httpRequest.get('/Products/GetProductsHome?count=12');
    } catch (error) {
        console.log(error);
    }
};

export const getProductDetail = (id) => {
    try {
        return httpRequest.get('/Products/GetProducts/' + id);
    } catch (error) {
        console.log(error);
    }
};

export const GetProducts = (categoryId) => {
    try {
        return httpRequest.get('/Products/GetProductsPage?categoryId=' + categoryId);
    } catch (error) {
        console.log(error);
    }
};
