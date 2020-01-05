import Vue from 'vue'
import VueRouter from 'vue-router'
import Home from '../views/Home.vue'

Vue.use(VueRouter)

const routes = [
  {
    path: '/',
    name: 'home',
    component: Home
  },
  {
    path: '/pos',
    name: 'pos',
    // route level code-splitting
    // this generates a separate chunk (about.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () => import(/* webpackChunkName: "about" */ '@/views/Pos.vue')
  },
  {
    path: '/Add_Product',
    name: 'Add_Product',
    component: () => import( '@/views/Add_Product.vue' )
  },
  {
    path: '/All_Product',
    name: 'All_Product',
    component: () => import( '@/views/All_Product.vue' )
  },
  {
    path: '/Category',
    name: 'Category',
    component: () => import( '@/views/Category.vue' )
  },
  {
    path: '/Laundry_path',
    name: 'Laundry',
    component: () => import( '@/views/Laundry.vue' )
  },
  {
    path: '/Update_Product/:id',
    name: 'Update_product',
    component: () => import( '@/views/Update_Product.vue' )
  }
  
]

const router = new VueRouter({
 // mode: 'history',
  base: process.env.BASE_URL,
  routes
})

export default router
