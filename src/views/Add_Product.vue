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

    <form v-else v-on:submit.prevent="submitData">
      <div class="row align-items-center flex-wrap">
        <div class="col-lg-9">
          <div class="form-group row">
            <label class="col-sm-2 col-form-label">Product Id:</label>
            <div class="col-sm-10">
              <input :value="productId" type="text" class="form-control" readonly />
            </div>
          </div>

          <div class="form-group row">
            <label class="col-sm-2 col-form-label">Product Name:</label>
            <div class="col-sm-10">
              
              <select ref="pro_name" v-model="collects.pro_name" type="text" class="form-control">
                <option value>--Select Name--</option>
                <option
                  v-for="(product_name, index) in product_names"
                  :key="index"
                  :value="product_name.id"
                >{{product_name.product_name}}</option>
              </select>
            </div>
          </div>

          <div class="form-group row">
            <label class="col-sm-2 col-form-label">Category:</label>
            <div class="col-sm-4">
              <select ref="selected" v-model="collects.selected" type="text" class="form-control">
                <option value>--Select Category--</option>
                <option
                  v-for="(category, index) in jsonData"
                  :key="index"
                  :value="category.id"
                >{{category.title}}</option>
              </select>
            </div>

            <label class="col-sm-2 col-form-label text-right">Company:</label>
            <div class="col-sm-4">
              <select
                ref="company_id"
                v-model="collects.company_id"
                type="text"
                class="form-control"
              >
                <option value>--Select Company--</option>
                <option
                  v-for="(company, index) in companies"
                  :key="index"
                  :value="company.id"
                >{{company.company_name}}</option>
              </select>
            </div>
          </div>

          <div class="form-group row">
            <label class="col-sm-2 col-form-label">Description:</label>
            <div class="col-sm-10">
              <textarea ref="pro_desc" v-model="collects.pro_desc" class="form-control" rows="5"></textarea>
            </div>
          </div>

          <div class="form-group row">
            <label class="col-sm-2 col-form-label">Cost Price:</label>
            <div class="col-sm-4">
              <input ref="pro_cost" v-model="collects.pro_cost" type="text" class="form-control" />
            </div>

            <label class="col-sm-2 col-form-label text-right">Selling Price:</label>
            <div class="col-sm-4">
              <input ref="pro_sell" v-model="collects.pro_sell" type="text" class="form-control" />
            </div>
          </div>

          <div class="form-group row">
            <label class="col-sm-2 col-form-label">Quantity:</label>
            <div class="col-sm-10">
              <input ref="pro_qty" v-model="collects.pro_qty" type="text" class="form-control" />
            </div>
          </div>
        </div>
        <div class="col-lg-3">
          <button type="submit" class="btn btn-lg btn-dark w-100 mb-3">SAVE PRODUCT</button>
          <br />
          <router-link class="btn btn-lg btn-dark w-100" to="/All_Product">ALL PRODUCT</router-link>
        </div>
      </div>
    </form>
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
  name: "Add_Product",
  data() {
    return {
      title: "Product Entry",

      collects: {},

      productId: null,
      showSpinner: true,
      jsonData: null,
      companies: null,
      product_names:null,
      host: "https://vuepos.000webhostapp.com/pos"
    };
  },
  methods: {

    submitData: function(event) {
      let url = this.host + "/add_product.php";

      var formdata = new FormData();
      formdata.append("name",    this.collects.pro_name);
      formdata.append("catId",   this.collects.selected);
      formdata.append("descr",   this.collects.pro_desc);
      formdata.append("cost",    this.collects.pro_cost);
      formdata.append("sell",    this.collects.pro_sell);
      formdata.append("qty",     this.collects.pro_qty);
      formdata.append("company", this.collects.company_id);

      axios
        .post(url, formdata)
        .then(res => {
          this.getDatas();
        })
        .catch(err => {
          console.log("Error");
        });
    },
    getDatas: function() {
      let url = this.host + "/get_categories.php";
      axios
        .get(url)
        .then(res => {
          this.jsonData = res.data.cat;
          this.companies = res.data.company;
          this.product_names = res.data.proName;
          this.productId = parseInt(res.data.last_product[0].id) + 1;
          this.showSpinner = false;
        })
        .then(() => {
          Object.keys(this.$refs).forEach(element => {
            var x = {};
            this.collects = {};
            Object.keys(this.$refs).forEach(element => {
              x[element] = "";
            });
            this.collects = x;
          });
        })
        .catch(error => {
          console.log("Error");
        });
    }
  },

  mounted() {
    this.getDatas();
  }
};
</script>
