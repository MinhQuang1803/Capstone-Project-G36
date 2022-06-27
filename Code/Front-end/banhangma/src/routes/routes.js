import config from '~/config';

// Layouts
import { HeaderOnly } from '~/layouts';

// Pages
import Home from '~/pages/Home';
import ProductDetail from '~/pages/ProductDetail';
import ProductCategory from '~/pages/ProductCategory';
// Public routes
const publicRoutes = [
    { path: config.routes.home, component: Home, layout: HeaderOnly },
    { path: config.routes.product, component: ProductDetail, layout: HeaderOnly },
    { path: config.routes.productcategory, component: ProductCategory, layout: HeaderOnly },
];

const privateRoutes = [];

export { publicRoutes, privateRoutes };
