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
                <input ref="pName" v-model="pro_name" type="text" class="form-control" />
              </div>
            </div>

            <div class="form-group row">
              <label class="col-sm-2 col-form-label">Category:</label>
              <div class="col-sm-4">
                <select v-model="selected" type="text" class="form-control">
                  <option value="">--Select Category--</option>
                  <option v-for="(category, index) in jsonData" :key="index" :value="category.id">{{category.title}}</option>
                </select>
              </div>

              <label class="col-sm-2 col-form-label text-right">Company:</label>
              <div class="col-sm-4">
                <select v-model="company_id" type="text" class="form-control">
                  <option value="">--Select Company--</option>
                  <option v-for="(company, index) in companies" :key="index" :value="company.id">{{company.company_name}}</option>
                </select>
              </div>
            </div>

            <div class="form-group row">
              <label class="col-sm-2 col-form-label">Description:</label>
              <div class="col-sm-10">
                <textarea v-model="pro_desc" class="form-control" rows="5"></textarea>
              </div>
            </div>

            <div class="form-group row">
              <label class="col-sm-2 col-form-label">Cost Price:</label>
              <div class="col-sm-4">
                <input v-model="pro_cost" type="text" class="form-control" />
              </div>

              <label class="col-sm-2 col-form-label text-right"
                >Selling Price:</label
              >
              <div class="col-sm-4">
                <input v-model="pro_sell" type="text" class="form-control" />
              </div>
            </div>

            <div class="form-group row">
              <label class="col-sm-2 col-form-label">Quantity:</label>
              <div class="col-sm-10">
                <input ref="pQty" v-model="pro_qty" type="text" class="form-control" />
              </div>
            </div>
          
        </div>
        <div class="col-lg-3">
          <button  type="submit"  class="btn btn-lg btn-dark w-100 mb-3">
            SAVE PRODUCT</button
          ><br />
          <router-link class="btn btn-lg btn-dark w-100" to="/All_Product">ALL PRODUCT</router-link>
          <button @click="getRef">sads</button>
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

      collectors:{},

      pro_name:"",
      selected:"",
      company_id:"",
      pro_desc:"",
      pro_cost:"",
      pro_sell:"",
      pro_qty:"",


      productId:null,
      showSpinner: true,
      jsonData: null,
      companies: null,
      host:"https://vuepos.000webhostapp.com/pos",
    };
  },
  methods: {

    getRef:function(){
      Object.keys(this.$refs).forEach( function(element, index) {
        console.log(element)
      });
    },
    
    submitData: function(event) {

      let url = this.host + "/add_product.php";

      var formdata = new FormData();
      formdata.append("name", this.pro_name);
      formdata.append("catId", this.selected);
      formdata.append("descr", this.pro_desc);
      formdata.append("cost", this.pro_cost);
      formdata.append("sell", this.pro_sell);
      formdata.append("qty", this.pro_qty);
      formdata.append("company", this.company_id);

      axios
        .post(url, formdata)
        .then(res => {
          this.getDatas();
          event.target.reset();
        })
        .catch(err => {
          console.log("Error");
        });
    },
    getDatas:function(){
      let url = this.host + "/get_categories.php";
      axios.get(url)
      .then(res=>{
        this.jsonData = res.data.cat;
        this.companies = res.data.company;
        this.productId = parseInt(res.data.last_product[0].id) + 1;
        this.showSpinner = false;
      })
      .catch(error=>{
        console.log("Error");
      });
    },
  },
  mounted() {
    this.getDatas();
  },
};
</script>
