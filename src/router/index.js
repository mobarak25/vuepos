import Vue from "vue";
import VueRouter from "vue-router";
import Home from "../views/Home.vue";

Vue.use(VueRouter);

const routes = [
  {
    path: "/",
    name: "home",
    component: Home
  },
  {
    path: "/pos",
    name: "pos",
    component: () => import("@/views/Pos.vue")
  },
  {
    path: "/Add_Product",
    name: "Add_Product",
    component: () => import("@/views/Add_Product.vue")
  },
  {
    path: "/Add_Product_Name",
    name: "Add_Product_Name",
    component: () => import("@/views/Add_Product_Name.vue")
  },
  {
    path: "/All_Product",
    name: "All_Product",
    component: () => import("@/views/All_Product.vue")
  },
  {
    path: "/Category",
    name: "Category",
    component: () => import("@/views/Category.vue")
  },
  {
    path: "/Company",
    name: "Company",
    component: () => import("@/views/Company.vue")
  },
  {
    path: "/Laundry_path",
    name: "Laundry",
    component: () => import("@/views/Laundry.vue")
  },
  {
    path: "/Update_Product/:id",
    name: "Update_product",
    component: () => import("@/views/Update_Product.vue")
  },
  {
    path: "/Sell_Out_Products",
    name: "Sell_Out_Products",
    component: () => import("@/views/Sell_Out_Products.vue")
  },
  {
    path: "/Search_Product",
    name: "Search_Product",
    component: () => import("@/views/Product_Search.vue")
  },
  {
    path: "/Expense",
    name: "Expense",
    component: () => import("@/views/Expense.vue")
  },
  {
    path: "/Add_Customer",
    name: "Add_Customer",
    component: () => import("@/views/Add_Customer.vue")
  },
  {
    path: "/Add_Supplier",
    name: "Add_Supplier",
    component: () => import("@/views/Add_Supplier.vue")
  },
  {
    path: "/Add_Stock",
    name: "Add_Stock",
    component: () => import("@/views/Add_Stock.vue")
  },
  {
    path: "/cashier",
    name: "cashier",
    component: () => import("@/views/Cashier.vue")
  }
];

const router = new VueRouter({
  mode: "history",
  base: process.env.BASE_URL,
  routes
});

export default router;
