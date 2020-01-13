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
            <label class="col-sm-2 col-form-label">Supplier ID:</label>
            <div class="col-sm-10">
              <input :value="supplierID" type="text" class="form-control" readonly />
            </div>
          </div>

          <div class="form-group row">
            <label class="col-sm-2 col-form-label">Supplier Name:</label>
            <div class="col-sm-10">
              <input
                ref="supplirName"
                v-model="collects.supplirName"
                type="text"
                class="form-control"
              />
            </div>
          </div>

          <div class="form-group row">
            <label class="col-sm-2 col-form-label">Address:</label>
            <div class="col-sm-10">
              <textarea ref="address" v-model="collects.address" class="form-control" rows="4"></textarea>
            </div>
          </div>

          <div class="form-group row">
            <label class="col-sm-2 col-form-label">Contact No:</label>
            <div class="col-sm-10">
              <input ref="contactNo" v-model="collects.contactNo" type="text" class="form-control" />
            </div>
          </div>

          <div class="form-group row">
            <label class="col-sm-2 col-form-label">Remarks:</label>
            <div class="col-sm-10">
              <textarea ref="remarks" v-model="collects.remarks" class="form-control" rows="4"></textarea>
            </div>
          </div>
        </div>
        <div class="col-lg-3">
          <button type="submit" class="btn btn-lg btn-dark w-100 mb-3">Save Supplier</button>
          <br />
          <router-link class="btn btn-lg btn-dark w-100" to="/All_Product">All Suppliers</router-link>
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
      title: "Suppliers Entry",
      collects: {},
      supplierID: "",
      showSpinner: false,
      niceData: "",
      host: "https://vuepos.000webhostapp.com/pos"
    };
  },
  methods: {
    submitData: function(event) {
      let url = this.host + "/add_supplier.php";

      var formdata = new FormData();
      formdata.append("name", this.collects.supplirName);
      formdata.append("address", this.collects.address);
      formdata.append("contactNo", this.collects.contactNo);
      formdata.append("remarks", this.collects.remarks);

      axios
        .post(url, formdata)
        .then(res => {
          this.niceData;
          alert("Data Submit Successfully");
        })

        .catch(err => {
          console.log("Error");
        });
    }
  },

  mounted() {
    //this.getDatas();

    this.niceData = Object.keys(this.$refs).forEach(element => {
      var x = {};
      this.collects = {};
      Object.keys(this.$refs).forEach(element => {
        x[element] = "";
      });
      this.collects = x;
    });
  }
};
</script>
