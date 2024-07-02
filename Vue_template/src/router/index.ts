import { createRouter, createWebHistory } from 'vue-router';

const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes: [
    {
      path: '/',
      name: 'home',
      component: () => import('../views/HomeView.vue')
    },
    {
      path: '/about',
      name: 'about',
      component: () => import('../views/AboutView.vue')
    },
    {
      path: '/loginView',
      name: 'loginView',
      component: () => import('../views/CreateRecoverLoginAccount/LoginView.vue')
    },
    {
      path: '/createAcc',
      name: 'createAcc',
      component: () => import('../views/CreateRecoverLoginAccount/CreateAcc.vue')
    },
    {
      path: '/recoverPassword',
      name: 'RecoverPassword',
      component: () => import('../views/CreateRecoverLoginAccount/RecoverPassword.vue')
    },
    {
      path: '/BestSellers',
      name: 'BestSellers',
      component: () => import('../views/Products/BestSellers.vue')
    },
    {
      path: '/OffersProducts',
      name: 'OffersProducts',
      component: () => import('../views/Products/OffersProducts.vue')
    },
    {
      path: '/GamesAndConsoles',
      name: 'GamesAndConsoles',
      component: () => import('../views/Products/GamesAndConsoles.vue')
    },
    {
      path: '/ComputersProducts',
      name: 'ComputersProducts',
      component: () => import('../views/Products/ComputersProducts.vue')
    },
    {
      path: '/SmartPhonesProducts',
      name: 'SmartPhonesProducts',
      component: () => import('../views/Products/SmartPhones.vue')
    },
    {
      path: '/FoodsProducts',
      name: 'FoodsProducts',
      component: () => import('../views/Products/FoodsProducts.vue')
    },
    {
      path: '/KitchenProducts',
      name: 'KitchenProducts',
      component: () => import('../views/Products/KitchenProducts.vue')
    },
    {
      path: '/DrinksProducts',
      name: 'DrinksProducts',
      component: () => import('../views/Products/DrinksProducts.vue')
    },
    {
      path: '/ShoppingCart',
      name: 'ShoppingCart',
      component: () => import('../views/ShoppingCart.vue')
    },
    {
      path: '/:pathMatch(.*)',
      name: 'NotFoundComponent',
      component: () => import('../views/PageNotFound/PageNotFound.vue'),
    },
    {
      path: '/produto/:tipo/:id',
      name: 'Product',
      component: () => {
        import('../views/Products/BuyProduct.vue')
      },
      props: true
    }
  ]
});

export default router;
