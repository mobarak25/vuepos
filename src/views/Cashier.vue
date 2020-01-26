<template>
  <div class="add-product">
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
      <div class="row">
        <div class="col-lg-2 input-group-sm">
          <input type="text" class="form-control" placeholder="Product Code" />
        </div>
        <div class="col-lg-2 input-group-sm">
          <input type="text" class="form-control" placeholder="Product Name" />
        </div>
        <div class="col-lg-2 input-group-sm">
          <input type="text" class="form-control" placeholder="Company" />
        </div>
        <div class="col-lg-2 input-group-sm">
          <input type="text" class="form-control" placeholder="Unit Price" />
        </div>
        <div class="col-lg-2 input-group-sm">
          <input type="text" class="form-control" placeholder="Unit Price" />
        </div>
        <div class="col-lg-2 input-group-sm">
          <a href="#" class="btn btn-sm btn-dark w-100">Add to Cart</a>
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
  name: "Cashier",
  data() {
    return {
      title: "Cashier",
      collects: {},
      showSpinner: false,
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
    }
  },

  watch: {},

  mounted() {}
};
</script>
<style>
.form-control {
  border-radius: 0 !important;
}
</style>
