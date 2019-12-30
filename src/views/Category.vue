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
          <label class="col-sm-2 col-form-label">Add Category:</label>
          <div class="col-sm-6">
            <input v-model="category" type="text" class="form-control" />
          </div>
          <div class="col-sm-4">
            <button @click="addCat(category)" class="btn btn-dark mb-3">
              SAVE Category
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
            <tr v-for="(category, index) in jsonData" :key="index">
              <td v-text="category.id"></td>
              <td v-text="category.title"></td>
              <td>
                <button class="btn btn-sm btn-danger" @click.prevent="deleteCat(category.id)">
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
  name: "Category",
  data() {
    return {
      title: "Available Category",
      showSpinner: true,
      jsonData: null,
      host:"http://localhost:8080",
      category: ""
    };
  },

  methods: {
    addCat: function(e) {
      if (e.length > 0) {
        let url = this.host + "/pos/add_categories.php";

        var formdata = new FormData();
        formdata.append("title", e);
        axios
          .post(url, formdata)
          .then(res => {
            this.getCategories();
          })
          .catch(err => {
            console.log("Error");
          });
      }
    },
    getCategories() {
      let url = this.host + "/pos/get_categories.php";
      axios
        .get(url)
        .then(res => {
          this.jsonData = res.data;
          this.showSpinner = false;
          this.category = "";
        })
        .catch(err => {
          console.log("Error");
        });
    },
    deleteCat(id) {
      var gerConfirm = confirm("Are you seure, You want to delete ?");
      if (id && gerConfirm !== false) {
        let url = this.host + "/pos/delete_categories.php";

        var formdata = new FormData();
        formdata.append("id", id);

        

        axios
          .post(url, formdata)
          .then(res => {
            this.getCategories();
          })
          .catch(err => {
            console.log("Error");
          });
      }
    }
  },

  mounted() {
    this.getCategories();
  }
};
</script>
