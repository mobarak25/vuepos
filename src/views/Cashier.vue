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
            <input
              @keyup="sendRequest(46)"
              type="text"
              class="form-control"
              placeholder="Product Code"
              ref="barCode"
              v-model="collects.barCode"
            />
          </div>
          <div class="col-lg-2 input-group-sm">
            <input
              type="text"
              class="form-control"
              ref="name"
              v-model="collects.name"
              placeholder="Product Name"
            />
          </div>
          <div class="col-lg-2 input-group-sm">
            <input
              type="text"
              class="form-control"
              ref="company"
              v-model="collects.company"
              placeholder="Company"
            />
          </div>
          <div class="col-lg-2 input-group-sm">
            <input
              type="text"
              class="form-control"
              placeholder="Qty"
              ref="qty"
              v-model="collects.qty"
            />
          </div>
          <div class="col-lg-2 input-group-sm">
            <input
              type="text"
              readonly
              class="form-control"
              placeholder="Unit Price"
              ref="unitPrice"
              v-model="collects.unitPrice"
            />
          </div>

          <div class="col-lg-2 input-group-sm">
            <a
              @click.prevent="displayCashier"
              href="#"
              class="btn btn-sm btn-dark w-100"
            >Add to Cashier</a>
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

        <tbody v-if="cashier_items.length > 0">
          <tr v-for="(cashier_item,index) in cashier_items" :key="index">
            <td v-text="cashier_item.product_id"></td>
            <td v-text="cashier_item.product_name"></td>
            <td v-text="cashier_item.product_company"></td>
            <td v-text="cashier_item.product_qty"></td>
            <td v-text="cashier_item.product_unit_price"></td>
            <td v-text="cashier_item.product_total_price"></td>
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
              <span>Grand Total</span>
              <div class="mony" v-text="grandTotal"></div>
            </div>
            <div class="cash">
              <span>Payment</span>
              <input v-model="payment" type="text" />
            </div>
            <div class="cash">
              <span>Change</span>
              <div class="mony" v-text="cashBack"></div>
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
      cashier_items: [],
      showSpinner: false,
      payment: "",
      host: "https://vuepos.000webhostapp.com/pos"
    };
  },
  methods: {
    displayCashier: function() {
      if (this.collects.unitPrice) {
        let data = this.collects;
        this.cashier_items.push({
          product_id: data.barCode,
          product_name: data.name,
          product_company: data.company,
          product_qty: data.qty,
          product_unit_price: data.unitPrice,
          product_total_price: parseInt(data.unitPrice * data.qty)
        });
        this.bulddata();
      }
    },
    sendRequest: function() {
      let url = this.host + "/get_selected_product.php";

      var formdata = new FormData();
      formdata.append("id", this.collects.barCode);

      axios
        .post(url, formdata)
        .then(res => {
          if (res.data.length > 0) {
            this.collects.name = res.data[0].product_name;
            this.collects.company = res.data[0].company_name;
            //this.collects.qty = res.data[0].qty;
            this.collects.unitPrice = res.data[0].selling_price;
          } else {
            this.collects.name = "";
            this.collects.company = "";
            this.collects.qty = "";
            this.collects.unitPrice = "";
          }
        })
        .catch(err => {
          console.log("Error");
        });
    },
    bulddata: function(params) {
      Object.keys(this.$refs).forEach(element => {
        var x = {};
        this.collects = {};
        Object.keys(this.$refs).forEach(element => {
          x[element] = "";
        });
        this.collects = x;
      });
    }
  },

  computed: {
    grandTotal: function() {
      let cartTotal = 0;

      this.cashier_items.forEach(function(item) {
        cartTotal += item.product_total_price;
      });
      return cartTotal;
    },
    cashBack: function() {
      if (this.payment) {
        return parseInt(this.payment - this.grandTotal);
      } else {
        return 0;
      }
    }
  },

  watch: {},

  mounted() {
    this.bulddata();
  }
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
.cash input,
.mony {
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
