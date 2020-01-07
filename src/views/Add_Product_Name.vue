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
          <label class="col-sm-2 col-form-label">Add product name:</label>
          <div class="col-sm-6">
            <input v-model="product_name" type="text" class="form-control" />
          </div>
          <div class="col-sm-4">
            <button @click="addName('product_name')" class="btn btn-dark mb-3">SAVE PRODUCT NAME</button>
          </div>
        </div>
      </div>
      <div class="col-lg-12">
        <table class="table table-hover table-bordered table-striped">
          <thead>
            <tr>
              <th>Id</th>
              <th>Title</th>
              <th>Actions</th>
            </tr>
          </thead>
          <tbody>
            <tr v-for="(name, index) in jsonData" :key="index">
              <td v-text="name.id"></td>
              <td v-text="name.product_name"></td>
              <td>
                <button class="btn btn-sm btn-danger" @click.prevent="deleteName(name.id)">
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
  name: "AddProductName",
  data() {
    return {
      title: "Product Name Entry",
      showSpinner: true,
      jsonData: null,
      host: "https://vuepos.000webhostapp.com/pos",
      product_name: ""
    };
  },

  methods: {
    addName: function(e) {
      if (e.length > 0) {
        let url = this.host + "/get_product_names.php";

        var formdata = new FormData();
        formdata.append("title", this.product_name);
        axios
          .post(url, formdata)
          .then(res => {
            this.getName();
          })
          .catch(err => {
            console.log("Error");
          });
      }
    },
    getName() {
      let url = this.host + "/get_product_names.php";
      axios
        .get(url)
        .then(res => {
          this.jsonData = res.data.ProName;
          this.showSpinner = false;
          this.product_name = "";
        })
        .catch(err => {
          console.log("Error");
        });
    },
    deleteName(id) {
      console.log(id);
      var gerConfirm = confirm("Are you seure, You want to delete ?");
      if (id && gerConfirm !== false) {
        let url = this.host + "/get_product_names.php";

        var formdata = new FormData();
        formdata.append("id", id);
        axios
          .post(url, formdata)
          .then(res => {
            this.getName();
          })
          .catch(err => {
            console.log("Error");
          });
      }
    }
  },

  mounted() {
    this.getName();
  }
};
</script>
