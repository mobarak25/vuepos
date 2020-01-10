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
        <div class="form-group row">
          <label class="col-sm-2 col-form-label">Product Name:</label>
          <div class="col-sm-4">
            <input v-model="proName" type="text" class="form-control"/>
          </div>
          <label class="col-sm-2 col-form-label text-right">By Company:</label>
          <div class="col-sm-4">
            <select
                ref="company_id"
                type="text"
                class="form-control"
              >
                <option value>--Select Company--</option>
                <option
                  v-for="(company, index) in this.jsonData"
                  :key="index"
                >{{company.company_name}}</option>
              </select>
          </div>
        </div>
        <hr>
        <table class="table table-hover table-bordered table-striped">
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
            <tr v-for="(filterProduct,index) in filterProducts" :key="index">
              <td v-text="filterProduct.id"></td>
              <td v-text="filterProduct.product_name"></td>
              <td v-text="filterProduct.title"></td>
              <td v-text="filterProduct.company_name"></td>
              <td v-text="filterProduct.description"></td>
              <td v-text="filterProduct.qty"></td>
              <td v-text="filterProduct.cost_price +'.00'"></td>
              <td v-text="filterProduct.selling_price +'.00'"></td>
              <td class="text-center">
                <router-link
                  class="btn btn-sm btn-success"
                  :to="{name:'Update_product', params:{id: filterProduct.id}}"
                >
                  <i class="fa fa-edit"></i>
                </router-link>
                <button @click="deleteProduct(filterProduct.id)" class="btn btn-sm btn-danger ml-2">
                  <i class="fa fa-trash"></i>
                </button>
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

let axiosConfig = {
  headers: {
    "Content-Type": "application/json;charset=UTF-8",
    "Access-Control-Allow-Origin": "*"
  }
};

export default {
  name: "Product_Search",
  data() {
    return {
      title: "Search Product",
      proName:"",
      showSpinner: true,
      jsonData: null,
      host: "https://vuepos.000webhostapp.com/pos"
    };
  },

  computed:{
    filterProducts:function() {
      if(this.proName){
        return this.jsonData.filter(element => {
          return element.product_name.toLowerCase().includes(this.proName.toLowerCase());
        });
      }else{
        return this.jsonData
      }
    },
  },

  methods: {
    
    getProducts: function() {
      let url = this.host

      function getUserAccount() {
        return axios.get(url + "/get_products.php");
      }

      function getUserPermissions() {
        return axios.get(url + "/get_companies.php");
      }

      axios.all([getUserPermissions(),getUserAccount()])
      .then(axios.spread(res=>{
        console.log(res);
        // this.jsonData = res.data;
        // this.showSpinner = false;
      
      }))
      .catch(err => {
          console.log("Error");
        });
    
      // axios
      //   .get(url)
      //   .then(res => {
      //     this.jsonData = res.data;
      //     this.showSpinner = false;
      //   })
      //   .catch(err => {
      //     console.log("Error");
      //   });
    },
    deleteProduct: function(getId) {
      var getConfirm = confirm("Are you sure, You want to delete ? ");
      if (getId && getConfirm !== false) {
        let url = this.host + "/delete_product.php";
        var formdata = new FormData();
        formdata.append("product_id", getId);

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
