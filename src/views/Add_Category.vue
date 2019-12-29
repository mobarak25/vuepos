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
    <div v-else>
      <div class="form-group row">
        <label class="col-sm-2 col-form-label">Add Category:</label>
        <div class="col-sm-5">
          <input v-model="category" type="text" class="form-control" />
          {{category}}
        </div>
        <div class="col-sm-2">
          <button @click="addCat" class="btn btn-dark mb-3" style="width:150px">SAVE</button>
        </div>
      </div>
      <hr />
      <table class="table table-hover table-bordered table-striped">
        <thead>
          <tr>
            <th>Id</th>
            <th>Name</th>
          </tr>
        </thead>
        <tbody>
          <tr v-for="(category, index) in jsonData" :key="index">
            <td v-text="category.id"></td>
            <td v-text="category.name"></td>
          </tr>
        </tbody>
      </table>
    </div>
  </div>
</template>

<script>
import axios from "axios";

export default {
  name: "Category",
  data() {
    return {
      title: "Available Category",
      showSpinner: true,
      jsonData: null,

      category: ""
    };
  },

  methods: {
    addCat: function() {
      
    }
  },

  mounted() {
    let url = "./data/category.json";
    axios
      .get(url)
      .then(res => {
        this.jsonData = res.data;
        this.showSpinner = false;
      })
      .catch(err => {
        console.log("Error");
      });
  }
};
</script>
