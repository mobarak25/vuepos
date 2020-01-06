<template>
  <div class="add-product">
    <h1 class="bit-title">{{ title }}</h1>
    <div
      v-if="showSpinner"
      class="d-flex justify-content-center align-items-end"
      style="height:200px"
    >
      <div class="spinner-grow text-dark" role="status">
        <span class="sr-only">Loading...</span>
      </div>
    </div>

    <div v-else class="row align-items-center flex-wrap">
      <div class="col-lg-12">
        <table class="table table-hover table-bordered table-striped ">
          <thead>
            <tr>
              <th>Id</th>
              <th>Name</th>
              <th>Category</th>
              <th>Company</th>
              <th>Description</th>
              <th>Qty</th>
              <th>Cost Price</th>
              <th>Selling Price</th>
              <th class="text-center">Action</th>
              
            </tr>
          </thead>
          <tbody>
            <tr v-for="(product,index) in jsonData" :key="index">
              <td v-text="product.id"></td>
              <td v-text="product.product_name"></td>
              <td v-text="product.title"></td>
              <td v-text="product.company_name"></td>
              <td v-text="product.description"></td>
              <td v-text="product.qty"></td>
              <td v-text="product.cost_price"></td>
              <td v-text="product.selling_price"></td>
              <td class="text-center">
                <button @click="deleteProduct(product.id)" class="btn btn-sm btn-danger ml-2"><i class="fa fa-trash"></i></button>
              </td>
            </tr>
          </tbody>
        </table>
      </div>
    </div>
  </div>
</template>

<script>
window.axios = require("axios");
//window.axios.defaults.headers.common['X-Requested-With'] = 'XMLHttpRequest';

let axiosConfig = {
  headers: {
    "Content-Type": "application/json;charset=UTF-8",
    "Access-Control-Allow-Origin": "*"
  }
};

export default {
  name: "All_Product",
  data() {
    return {
      title: "Out of stock products",
      showSpinner: true,
      jsonData: null,
      host:"https://vuepos.000webhostapp.com/pos",
    };
  },

  methods:{
    getProducts:function(){
      let url = this.host + "/sell_out_products.php";
      axios
        .get(url)
        .then(res => {
          this.jsonData = res.data;
          this.showSpinner = false;
        })
        .catch(err => {
          console.log("Error");
        });
    },
    deleteProduct:function(getId){
      var getConfirm = confirm("Are you sure, You want to delete ? ");
      if(getId && getConfirm !== false){
        let url = this.host + "/delete_product.php";
        var formdata = new FormData();
        formdata.append("product_id", getId)

        axios
        .post(url, formdata)
        .then(res => {
          this.getProducts();
        })
        .catch(err => {
          console.log("Error");
        });
      }

    }

  },

  mounted() {
    this.getProducts();
  }
};
</script>
