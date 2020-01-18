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
        <div class="row form-group">
          <label class="col-sm-2 col-form-label">Supplier ID:</label>
          <div class="col-sm-4">
            <input :value="supplierID" type="text" class="form-control" readonly />
          </div>
          <label class="col-sm-2 col-form-label">Supplier Name:</label>
          <div class="col-sm-4">
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
          <div class="col-sm-4">
            <textarea ref="address" v-model="collects.address" class="form-control" rows="2"></textarea>
          </div>
          <label class="col-sm-2 col-form-label">Remarks:</label>
          <div class="col-sm-4">
            <textarea ref="remarks" v-model="collects.remarks" class="form-control" rows="2"></textarea>
          </div>
        </div>

        <div class="form-group row">
          <label class="col-sm-2 col-form-label">Contact No:</label>
          <div class="col-sm-4">
            <input ref="contactNo" v-model="collects.contactNo" type="text" class="form-control" />
          </div>
          <div class="col-sm-2"></div>
          <div class="col-lg-4">
            <button type="submit" class="btn btn-dark mb-3">Save Supplier</button>
          </div>
        </div>
      </form>
      <table class="table table-hover table-bordered table-striped">
        <thead>
          <tr>
            <th>Id</th>
            <th>Name</th>
            <th>Address</th>
            <th>Contact No.</th>
            <th>Remarks</th>
            <th class="text-center">Action</th>
          </tr>
        </thead>
        <tbody>
          <tr v-for="(supplier,index) in jsonData" :key="index">
            <td v-text="supplier.id"></td>
            <td v-text="supplier.name"></td>
            <td v-text="supplier.address"></td>
            <td v-text="supplier.contact_no"></td>
            <td v-text="supplier.remarks"></td>

            <td class="text-center">
              <button @click="deleteSupplier(supplier.id)" class="btn btn-sm btn-danger ml-2">
                <i class="fa fa-trash"></i>
              </button>
            </td>
          </tr>
        </tbody>
      </table>
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
  name: "Add_Product",
  data() {
    return {
      title: "Suppliers Entry",
      collects: {},
      supplierID: "",
      showSpinner: true,
      jsonData: null,
      host: "https://vuepos.000webhostapp.com/pos"
    };
  },
  methods: {
    dataBulder: function() {
      this.niceData = Object.keys(this.$refs).forEach(element => {
        var x = {};
        this.collects = {};
        Object.keys(this.$refs).forEach(element => {
          x[element] = "";
        });
        this.collects = x;
      });
    },

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
          alert("Data Submit Successfully");
          this.getSuppliers();
          this.dataBulder();
        })
        .catch(err => {
          console.log("Error");
        });
    },

    getSuppliers: function() {
      let url = this.host + "/get_suppliers.php";
      axios.get(url).then(res => {
        this.jsonData = res.data;
        this.showSpinner = false;
      });
    },

    deleteSupplier: function(singleId) {
      var getConfirm = confirm("Are you sure, You want to delete ? ");
      if (singleId && getConfirm !== false) {
        let url = this.host + "/delete_supplier.php";
        var formdata = new FormData();
        formdata.append("id", singleId);

        axios.post(url, formdata).then(res => {
          this.getSuppliers();
        });
      }
    }
  },

  mounted() {
    this.getSuppliers();
    this.dataBulder();
  }
};
</script>
