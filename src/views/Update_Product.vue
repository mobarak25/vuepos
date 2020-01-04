<template>
  <div class="add-product">

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
  name: "UpdateProduct",
  data() {
    return {
      matchId: this.$route.params.id,

      showSpinner: true,
      jsonData: null,
      host:"https://vuepos.000webhostapp.com/pos",
    };
  },
  
  methods: {
    submitData: function(event) {
      let url = this.host + "/get_single_product.php";

      axios
        .post(url, this.matchId)
        .then(res => {
          console.log(res);
        })
        .catch(err => {
          console.log("Error");
        });
    }
  },

  mounted() {
  }
};
</script>
