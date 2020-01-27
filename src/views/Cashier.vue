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
      <div class="p-3 bg-white mb-2">
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
            <input type="text" class="form-control" placeholder="Quantity" />
          </div>
          <div class="col-lg-2 input-group-sm">
            <input type="text" class="form-control" placeholder="Unit Price" />
          </div>

          <div class="col-lg-2 input-group-sm">
            <a href="#" class="btn btn-sm btn-dark w-100">Add to Cashier</a>
          </div>
        </div>
      </div>
    </form>

    <div class="p-3 bg-white">
      <table class="table m-0 border-bottom">
        <thead>
          <tr>
            <th>Product Code</th>
            <th>Product Name</th>
            <th>Company</th>
            <th>Quantity</th>
            <th>Unit Price</th>
            <th>Total Price</th>
          </tr>
        </thead>

        <tbody>
          <tr>
            <td>Product Code</td>
            <td>Product Name</td>
            <td>Company</td>
            <td>Quantity</td>
            <td>Unit Price</td>
            <td>Total Price</td>
          </tr>
          <tr>
            <td>Product Code</td>
            <td>Product Name</td>
            <td>Company</td>
            <td>Quantity</td>
            <td>Unit Price</td>
            <td>Total Price</td>
          </tr>
        </tbody>
      </table>
    </div>
    <div class="p-3 bg-white mt-3">
      <div class="row">
        <div class="col-lg-4"></div>
        <div class="col-lg-8">
          <div class="d-flex">
            <div class="cash">
              <span>Sub Total</span>
              <input type="text" />
            </div>
            <div class="cash">
              <span>Payment</span>
              <input type="text" />
            </div>
            <div class="cash">
              <span>Change</span>
              <input type="text" />
            </div>
          </div>
          <div class="btnWrap d-flex border mt-3">
            <a href="#">PAY</a>
            <a href="#">
              Expense
              <br />Entry
            </a>
            <a href="#">
              Available
              <br />Stocks
            </a>
            <a href="#">
              Sales
              <br />Report
            </a>
            <a href="#">
              Cancel
              <br />Order
            </a>
            <a href="#">Exit</a>
          </div>
        </div>
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
@import url("https://fonts.googleapis.com/css?family=Lora:700i&display=swap");
.form-control {
  border-radius: 0 !important;
}
.cash {
  padding: 0;
  margin: 0;
  flex: 1;
  color: #fff;
  position: relative;
  background-color: #495057;
  border: 1px solid #fff;
}
.cash input {
  width: 100%;
  padding: 0 5px;
  margin: 0;
  color: #fff;
  border: 0;
  font-size: 30px;
  line-height: 40px;
  text-align: right;
  background-color: transparent;
  font-family: "Lora", serif;
  font-weight: 700;
}
.cash span {
  padding: 5px 10px;
  display: block;
}
.cash input:focus {
  outline: 0;
}
.btnWrap {
  padding: 0;
  margin: 0;
  display: flex;
}
.btnWrap a {
  height: 60px;
  padding: 0;
  margin: 0;
  display: flex;
  flex: 1;
  text-align: center;
  color: #fff;
  line-height: 16px;
  justify-content: center;
  background-color: #dc3545;
  border: 1px solid #fff;
  align-items: center;
  font-weight: 300;
}
.btnWrap a:hover {
  text-decoration: none;
  background-color: #003048;
}
</style>
