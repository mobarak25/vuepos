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
        <div class="col-lg-10">
          <div class="row">
            <div class="col-lg-6">
              <div class="border p-3">
                <h6 class="m-0 pb-3">Stock & Supplier Details</h6>
                <div class="pb-1 row">
                  <label class="col-sm-4 col-form-label">Stock ID:</label>
                  <div class="col-sm-8 input-group-sm">
                    <input :value="productId" type="text" class="form-control" readonly />
                  </div>
                </div>
                <div class="pb-1 row">
                  <label class="col-sm-4 col-form-label">Date:</label>
                  <div class="col-sm-8 input-group-sm">
                    <datepicker :format="customFormatter" v-model="date" class="customdate"></datepicker>
                  </div>
                </div>
                <div class="pb-1 row">
                  <label class="col-sm-4 col-form-label">Supplier Name</label>
                  <div class="col-sm-8 input-group-sm">
                    <select
                      @change="fillSupplier()"
                      class="form-control"
                      v-model="selectedSupplier"
                    >
                      <option disabled value>Please select one</option>
                      <option
                        v-for="(supplier, index) in suppliers"
                        :key="index"
                        v-text="supplier.name"
                        :value="supplier.id"
                      ></option>
                    </select>
                  </div>
                </div>
                <div class="pb-1 row">
                  <label class="col-sm-4 col-form-label">Supplier ID:</label>
                  <div class="col-sm-8 input-group-sm">
                    <input ref="supId" v-model="collects.supId" type="text" class="form-control" />
                  </div>
                </div>

                <div class="pb-1 row">
                  <label class="col-sm-4 col-form-label">Address:</label>
                  <div class="col-sm-8 input-group-sm">
                    <textarea
                      ref="supplierAddress"
                      v-model="collects.supplierAddress"
                      class="form-control"
                      rows="2"
                    ></textarea>
                  </div>
                </div>
              </div>
            </div>
            <div class="col-lg-6">
              <div class="border p-3">
                <h6 class="m-0 pb-3">Product Details</h6>
                <div class="pb-1 row">
                  <label class="col-sm-4 col-form-label">Product Name</label>
                  <div class="col-sm-8 input-group-sm">
                    <select class="form-control" v-model="selectedProduct" @change="fillProduct">
                      <option disabled value>Please select one</option>
                      <option
                        v-for="(product, index) in products"
                        :key="index"
                        :value="product.id"
                        v-text="product.product_name"
                      ></option>
                    </select>
                  </div>
                </div>
                <div class="pb-1 row">
                  <label class="col-sm-4 col-form-label">Product ID:</label>
                  <div class="col-sm-8 input-group-sm">
                    <input type="text" class="form-control" readonly />
                  </div>
                </div>
                <div class="pb-1 row">
                  <label class="col-sm-4 col-form-label">Quantity</label>
                  <div class="col-sm-8 input-group-sm">
                    <input type="text" class="form-control" />
                  </div>
                </div>
                <div class="pb-1 row">
                  <label class="col-sm-4 col-form-label">Price per Unit:</label>
                  <div class="col-sm-8 input-group-sm">
                    <input type="text" class="form-control" />
                  </div>
                </div>
                <div class="pb-1 row">
                  <label class="col-sm-4 col-form-label">Selling Price:</label>
                  <div class="col-sm-8 input-group-sm">
                    <input type="text" class="form-control" />
                  </div>
                </div>
                <div class="pb-1 row">
                  <label class="col-sm-4 col-form-label">Total Amount:</label>
                  <div class="col-sm-8 input-group-sm">
                    <input type="text" class="form-control" />
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>

        <div class="col-lg-2">
          <button type="submit" class="btn btn-sm btn-dark w-100 mb-3">SAVE</button>
          <br />
          <router-link class="btn btn-sm btn-dark w-100" to="/All_Product">STOCK LIST</router-link>
        </div>
      </div>
    </form>
  </div>
</template>

<script>
window.axios = require("axios");
import moment from "moment";
import Datepicker from "vuejs-datepicker";

let axiosConfig = {
  headers: {
    "Content-Type": "application/json;charset=UTF-8",
    "Access-Control-Allow-Origin": "*"
  }
};

export default {
  name: "Add_Stock",
  data() {
    return {
      title: "Stock Entry",

      collects: {},
      date: "",
      niceDate: "",

      productId: null,
      showSpinner: true,
      suppliers: null,
      products: [],
      selectedSupplier: "",
      selectedProduct: "",
      companies: null,
      product_names: null,
      host: "https://vuepos.000webhostapp.com/pos"
    };
  },
  methods: {
    submitData: function(event) {
      let url = this.host + "/add_product.php";

      var formdata = new FormData();
      formdata.append("name", this.collects.pro_name);
      formdata.append("catId", this.collects.selected);
      formdata.append("descr", this.collects.pro_desc);
      formdata.append("cost", this.collects.pro_cost);
      formdata.append("sell", this.collects.pro_sell);
      formdata.append("qty", this.collects.pro_qty);
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
      let url = this.host;
      function getSupplier() {
        return axios.get(url + "/get_suppliers.php");
      }
      function getProduct() {
        return axios.get(url + "/get_product_forstock.php");
      }
      axios
        .all([getSupplier(), getProduct()])
        .then(
          axios.spread((suplier, product) => {
            this.suppliers = suplier.data;
            this.products = product.data;

            this.showSpinner = false;
          })
        )
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
    },
    fillSupplier: function(params) {
      this.suppliers.find(element => {
        if (element.id == this.selectedSupplier) {
          this.collects.supId = element.id;
          this.collects.supplierAddress = element.address;
        }
      });
    },
    fillProduct: function() {
      alert("gg");
    },
    customFormatter(date) {
      return moment(date).format("DD/MM/YYYY");
    }
  },
  components: {
    Datepicker
  },
  watch: {
    date: function(val, newVal) {
      this.niceDate =
        val.getDate() + "/" + (val.getMonth() + 1) + "/" + val.getFullYear();
    }
  },

  mounted() {
    this.getDatas();
  }
};
</script>
<style>
.customdate input {
  width: 100%;
  height: 30px;
  padding: 7px 10px;
  background: #ddd;
  border: 1px solid #4950571a;
  border-radius: 3px;
}
</style>
