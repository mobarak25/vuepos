<template>
    <div class="add-product">
        <h1 class="bit-title">{{ title }}</h1>
        <div v-if="showSpinner" class="d-flex justify-content-center align-items-end" style="height:200px">
            <div class="spinner-grow text-dark" role="status">
                <span class="sr-only">Loading...</span>
            </div>
        </div>
        <div v-else>
            <!-- Large modal -->
            <button type="button" class="btn btn-primary" data-toggle="modal" data-target=".bd-example-modal-lg">Large modal</button>
            <div class="modal fade bd-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content">
                        <div class="container-fluid">
                            <div v-for="(laundry, index) in jsonData" :key="index" class="row border flex-wrap text-center">
                                <div class="col-lg-2 border-right">
                                    <label class="d-flex h-100 align-items-center m-0 flex-wrap">
                                      <div class="w-100">
                                        <img :src="'/images/'+laundry.img" alt=""><br>
                                        {{laundry.title}}
                                      </div>
                                    </label>
                                </div>
                                <div v-if="laundry.deep" class="col-lg-10">
                                    <div class="row">
                                        <div v-for="(laundryData, index) in laundry.data" :key="index" class="col-lg-4 border-right">
                                            <strong class="d-block p-2">{{laundryData.title}}</strong>
                                            <div class="d-flex w-100 justify-content-around flex-wrap">
                                                <div class="itm pt-2 pb-2" v-for="(item,index) in laundryData.data" :key="index">
                                                    <label>
                                                        <input v-model="checkedNames" type="checkbox" :value="item.title"><br>
                                                        {{item.title}}<br>
                                                        {{item.img}}
                                                    </label>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div v-else class="col-lg-10">
                                    <div class="row h-100 align-items-center">
                                        <div v-for="(laundryData, index) in laundry.data" :key="index" class="col-lg-2">
                                            <div class="item">{{laundryData.title}}</div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
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
    name: "Laundry",
    data() {
        return {
            title: "Laundry",
            publicPath: process.env.BASE_URL,
            checkedNames: [],
            showSpinner: true,
            jsonData: null,
            host: "http://localhost:8080/pos/laundry_care.php"
        };
    },

    methods: {
        getCategories() {
            let url = this.host;
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
    },

    mounted() {
        this.getCategories();
    }
};
</script>