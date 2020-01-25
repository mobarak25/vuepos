<template>
  <div class="sidebar-cont">
    <ul class="list-unstyled">
      <li>
        <router-link :to="{name:'Add_Stock'}">Stock Entry</router-link>
      </li>
      <li>
        <router-link class="dropdown-item" :to="{name:'cashier'}">Cashier</router-link>
      </li>
      <li>
        <router-link class="dropdown-item" :to="{name:'Add_Supplier'}">Suppliers</router-link>
      </li>
      <li>
        <a href>Coustomers</a>
      </li>
      <li>
        <a href>Expense Detail</a>
      </li>
      <li>
        <a href>Sales Report</a>
      </li>
      <li>
        <a href>Expense Detail</a>
      </li>
    </ul>
  </div>
</template>

<script>
export default {
  name: "Sidebar",
  data: function() {
    return {};
  }
};
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
</style>
