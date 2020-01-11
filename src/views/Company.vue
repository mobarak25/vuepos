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
          <label class="col-sm-2 col-form-label">Add Company:</label>
          <div class="col-sm-6">
            <input v-model="company" type="text" class="form-control" />
          </div>
          <div class="col-sm-4">
            <button @click="addCom(company)" class="btn btn-dark mb-3">
              SAVE COMPANY
            </button>
          </div>
        </div>
      </div>
      <div class="col-lg-12">
        <table class="table table-hover table-bordered table-striped ">
          <thead>
            <tr>
              <th>Id</th>
              <th>Title</th>
              <th>Actions</th>
            </tr>
          </thead>
          <tbody>
            <tr v-for="(company, index) in jsonData" :key="index">
              <td v-text="company.id"></td>
              <td v-text="company.company_name"></td>
              <td>
                <button class="btn btn-sm btn-danger" @click.prevent="deleteCom(company.id)">
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
  name: "Company",
  data() {
    return {
      title: "Available Company",
      showSpinner: true,
      jsonData: null,
      host:"https://vuepos.000webhostapp.com/pos",
      company: ""
    };
  },

  methods: {
    addCom: function(e) {
      if (e.length > 0) {
        let url = this.host + "/add_company.php";

        var formdata = new FormData();
        formdata.append("title", e);
        axios
          .post(url, formdata)
          .then(res => {
            this.getCompanies();
          })
          .catch(err => {
            console.log("Error");
          });
      }
    },
    getCompanies() {
      let url = this.host + "/get_companies.php";
      axios
        .get(url)
        .then(res => {
          this.jsonData = res.data;
          this.showSpinner = false;
          this.company = "";
        })
        .catch(err => {
          console.log("Error");
        });
    },
    deleteCom(id) {
      var gerConfirm = confirm("Are you seure, You want to delete ?");
      if (id && gerConfirm !== false) {
        let url = this.host + "/delete_company.php";

        var formdata = new FormData();
        formdata.append("id", id);
        axios
          .post(url, formdata)
          .then(res => {
            this.getCompanies();
          })
          .catch(err => {
            console.log("Error");
          });
      }
    }
  },

  mounted() {
    this.getCompanies();
  }
};
</script>
