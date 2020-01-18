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
      <div class="row">
        <div class="col-lg-12">
          <div class="form-group row">
            <label class="col-sm-2 col-form-label">Expense Id:</label>
            <div class="col-sm-2">
              <input :value="expenseId" type="text" class="form-control" readonly />
            </div>

            <label class="col-sm-2 col-form-label">Expense Type:</label>
            <div class="col-sm-3">
              <select ref="exp_type" v-model="collects.exp_type" type="text" class="form-control">
                <option value>--Select Type--</option>
                <option v-for="(expenseType, index) in jsonData" :key="index">{{expenseType.name}}</option>
              </select>
            </div>

            <label class="col-sm-1 col-form-label">Cost:</label>
            <div class="col-sm-2">
              <input ref="cost" v-model="collects.cost" type="text" class="form-control" />
            </div>
          </div>

          <div class="form-group row">
            <label class="col-sm-2 col-form-label">Date:</label>
            <div class="col-sm-2">
              <datepicker :format="customFormatter" v-model="date" class="form-control"></datepicker>
              <!-- <input ref="exp_date" v-model="collects.exp_date" type="text" class="form-control" /> -->
            </div>

            <label class="col-sm-2 col-form-label">Name:</label>
            <div class="col-sm-3">
              <input ref="name" v-model="collects.name" type="text" class="form-control" />
            </div>
            <label class="col-sm-1 col-form-label"></label>
            <div class="col-sm-2">
              <button class="btn btn-dark">Save Expense</button>
            </div>
          </div>
          <hr />
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
  name: "Expense",
  data() {
    return {
      title: "Expense Entry",

      collects: {},
      date: null,
      expenseId: null,
      showSpinner: true,
      jsonData: null,
      host: "https://vuepos.000webhostapp.com/pos"
    };
  },
  components: {
    Datepicker
  },
  methods: {
    submitData: function(event) {
      let url = this.host + "/add_expense.php";

      var formdata = new FormData();
      formdata.append("name", this.collects.name);
      formdata.append("cost", this.collects.cost);
      formdata.append("type", this.collects.exp_type);
      formdata.append("expDate", this.date);

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
      let url = this.host + "/get_expense_type.php";
      axios
        .get(url)
        .then(res => {
          this.jsonData = res.data;
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
    },
    customFormatter(date) {
      return moment(date).format("DD/MM/YYYY");
    }
  },

  mounted() {
    this.getDatas();
  }
};
</script>
