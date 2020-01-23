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
      <form v-on:submit.prevent="submitData">
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
                <datepicker :format="customFormatter" v-model="date" class="customdate"></datepicker>
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
      <table class="table table-hover table-bordered table-striped">
        <thead>
          <tr>
            <th>Id</th>
            <th>Name</th>
            <th>Expense type</th>
            <th>Cost</th>
            <th>Date</th>
          </tr>
        </thead>
        <tbody>
          <tr v-for="(expense, index) in jsonExpense" :key="index">
            <td v-text="expense.id"></td>
            <td v-text="expense.expDame"></td>
            <td v-text="expense.expense_type"></td>
            <td v-text="expense.cost"></td>
            <td v-text="expense.expDate"></td>
          </tr>
        </tbody>
      </table>
    </div>
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
      niceDate: "",
      expenseId: null,
      showSpinner: true,
      jsonData: null,
      jsonExpense: null,
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
      formdata.append("expDate", this.niceDate);

      axios
        .post(url, formdata)
        .then(res => {
          this.getExpenseType();
          this.getExpense();
        })
        .catch(err => {
          console.log("Error");
        });
    },
    getExpenseType: function() {
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
          this.niceDate = null;
          this.date = null;
        })
        .catch(error => {
          console.log("Error");
        });
    },
    getExpense: function() {
      let url = this.host + "/get_expense.php";
      axios
        .get(url)
        .then(res => {
          this.jsonExpense = res.data;
        })
        .catch(error => {
          console.log("Error");
        });
    },
    customFormatter(date) {
      return moment(date).format("DD/MM/YYYY");
    }
  },

  watch: {
    date: function(val, newVal) {
      this.niceDate =
        val.getDate() + "/" + (val.getMonth() + 1) + "/" + val.getFullYear();
    }
  },

  mounted() {
    this.getExpenseType();
    this.getExpense();
  }
};
</script>

<style>
.customdate input {
  width: 100%;
  padding: 7px 10px;
  background: #ddd;
  border: 1px solid #4950571a;
}
</style>

