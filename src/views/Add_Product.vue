<template>
  <div class="add-product">
    <h1 class="bit-title">{{ title }}</h1>
    <div class="row align-items-center flex-wrap">
      <div class="col-lg-9">
        <form>
          
          <div class="form-group row">
            <label class="col-sm-2 col-form-label">Product Id:</label>
            <div class="col-sm-10">
              <input
                type="text"
                class="form-control"
              />
            </div>
          </div>

          <div class="form-group row">
            <label class="col-sm-2 col-form-label">Product Name:</label>
            <div class="col-sm-10">
              <input
                type="text"
                class="form-control"
              />
            </div>
          </div>

          <div class="form-group row">
            <label class="col-sm-2 col-form-label">Company:</label>
            <div class="col-sm-10">
              <select type="text" class="form-control">
                <option>--Select Company--</option>
                <option>Dell</option>
                <option>HP</option>
                <option>Samsung</option>
                <option>Asus</option>
              </select>
            </div>
          </div>

          <div class="form-group row">
            <label class="col-sm-2 col-form-label">Description:</label>
            <div class="col-sm-10">
              <textarea
                class="form-control"
                rows="5"
              ></textarea>
            </div>
          </div>

          <div class="form-group row">
            <label class="col-sm-2 col-form-label">Cost Price:</label>
            <div class="col-sm-4">
              <input
                type="text"
                class="form-control"
              />
            </div>

            <label class="col-sm-2 col-form-label text-right">Selling Price:</label>
            <div class="col-sm-4">
              <input
                type="text"
                class="form-control"
              />
            </div>
          </div>

          <div class="form-group row">
            <label class="col-sm-2 col-form-label">Quantity:</label>
            <div class="col-sm-10">
              <input
                type="text"
                class="form-control"
              />
            </div>
          </div>

        </form>
      </div>
      <div class="col-lg-3">
        <button @click="gg" class="btn btn-lg btn-dark w-100 mb-3">SAVE PRODUCT</button><br>
        <button class="btn btn-lg btn-dark w-100">ALL PRODUCT</button>
      </div>
    </div>
  </div>
</template>

<script>
	export default {
		data:function(){
			return {
        title:"Product Entry",
			}
    }, 
    methods:{
      gg:function(){
        return alert('go');
      }
    }         
	}
</script>