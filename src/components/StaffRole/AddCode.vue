<template>
  <div>
    <STnav />
    <br /><br /><br />
    <hr />
    <Side />
    <div id="summary" style="float:right; margin-right:100px">
      <b-button id="show-btn" variant="success" @click="showModalcode"
        >see summary</b-button
      >

      <b-modal v-model='ModalProps' ref="my-modal-code" hide-footer title="Summary">
        <div class="d-block text-center">
          <h3>code summary</h3>
          <canvas id="graph" width="400" height="400"></canvas>
          <p>try</p>
        </div>
      </b-modal>
    </div>

    <div id="all">
      <div>
        <h4><b>Add code</b></h4>
        <br />
        <div id="addSection">
          <b-form inline id="idname">
            <b-form-group class="mb-0" label="Code ID:" label-for="id">
              <b-form-input
                id="id"
                required
                v-model="cID"
                placeholder="Enter Code ID"
                style="margin-left:10px; margin-right:50px; width: 15rem;"
              ></b-form-input>
            </b-form-group>

            <b-form-group class="mb-0" label="Code name:" label-for="name">
              <b-form-input
                id="name"
                v-model="cName"
                placeholder="Enter Code name"
                style="width: 15rem;"
              ></b-form-input>
            </b-form-group>
          </b-form>
          <br />
          <b-form inline id="discountlimit">
            <b-form-group class="mb-0" label="Discount:" label-for="discount">
              <b-form-input
                id="discount"
                v-model="cDiscount"
                placeholder="Enter discount in THB"
                style="margin-left:7px; margin-right:100px; width: 15rem;"
              ></b-form-input>
            </b-form-group>

            <b-form-group class="mb-0" label="Limit:" label-for="limit">
              <b-form-input
                id="limit"
                v-model="cLimit"
                placeholder="Enter limit used"
                style="width: 15rem;"
              ></b-form-input>
            </b-form-group>
          </b-form>
          <br />
          <b-form inline id="dateform">
            <b-form-group
              class="mb-0"
              label="Start date:"
              label-for="StartDate"
            >
              <b-form-datepicker
                id="StartDate"
                v-model="cStartD"
                placeholder="Select start date"
                style="margin-right:43px; width: 15rem;"
              ></b-form-datepicker>
            </b-form-group>

            <b-form-group
              class="mb-0"
              label="Expired date:"
              label-for="ExpiredDate"
            >
              <b-form-datepicker
                id="ExpiredDate"
                v-model="cExpriedD"
                placeholder="Select expired date"
                style="width: 15rem;"
              ></b-form-datepicker>
            </b-form-group>
          </b-form>
          <br />
          <b-button id="button" type="submit" variant="dark" @click="checkAdd()"
            >Add</b-button
          >
        </div>
      </div>
      <hr />
      <h5 style="margin-top:30px"><b>Existing code</b></h5>
      <b-container fluid style="margin-top:20px;">
        <!-- User Interface controls -->
        <div style="margin:auto; margin-top:20px;">
          <b-row>
            <b-col lg="3" class="my-1">
              <b-input-group>
                <b-form-input
                  v-model="filter"
                  type="search"
                  id="filterInput"
                  placeholder="Type to Search"
                ></b-form-input>
                <b-input-group-append>
                  <b-button :disabled="!filter" @click="filter = ''"
                    >Clear</b-button
                  >
                </b-input-group-append>
              </b-input-group>
            </b-col>
          </b-row>
        </div>
        <!-- Main table element -->
        <b-table
          show-empty
          stacked="md"
          :items="items"
          :fields="fields"
          :current-page="currentPage"
          :per-page="perPage"
          :filter="filter"
          @filtered="onFiltered"
          style="margin-top:30px"
        >
        </b-table>

        <b-col class="my-1">
          <b-pagination
            v-model="currentPage"
            :total-rows="totalRows"
            :per-page="perPage"
            pills
            align="center"
            class="my-0"
          ></b-pagination>
          <br />
          <hr />
        </b-col>
      </b-container>
    </div>
  </div>
</template>

<script>
import STnav from "../Nav_st.vue";
import Side from "../StatusHotel/Side_statusH.vue";
import Chart from "chart.js";

export default {
  components: {
    Side,
    STnav,
  },
  data() {
    return {
      cID: null,
      cName: null,
      cDiscount: null,
      cLimit: null,
      cStartD: null,
      cExpriedD: null,
      items: [
        {
          id: "FIRST100",
          Cname: "First use",
          discount: "THB 100",
          limit: 5,
          sDate: "07/02/19",
          eDate: "08/02/19",
        },
        {
          id: "LIMIT5",
          Cname: "Limit for 5 users",
          discount: "THB 50",
          limit: 5,
          sDate: "01/05/20",
          eDate: "06/05/20",
        },
      ],

      fields: [
        { key: "id", label: "Code ID", sortable: true },
        { key: "Cname", label: "Code name", sortable: true },
        { key: "discount", label: "Discount", sortable: true },
        { key: "limit", label: "Limit used", sortable: true },
        { key: "sDate", label: "Start Date", sortable: true },
        { key: "eDate", label: "Expired Date", sortable: true },
      ],

      totalRows: 1,
      currentPage: 1,
      perPage: 10,
      filter: null,
    };
  },
  computed: {
    sortOptions() {
      // Create an options list from our fields
      return this.fields
        .filter((f) => f.sortable)
        .map((f) => {
          return { text: f.label, value: f.key };
        });
    },
  },
  /*mounted() {
    // Set the initial number of items
    this.totalRows = this.items.length;
  },*/

mounted:function(){
      this.totalRows = this.items.length // Set the initial number of items
      var ctx = document.getElementById('graph').getCotext('2d')
      var bar = new Chart( ctx ,{
        type: 'bar',
        data:{
          labels: ['booking','check-in','check-out','cancle'],
          datasets:[
            {
              label: '# of book',
              data: [88,70,100,5]
            }
          ]
        }
      })
      console.log(bar)
    },


  methods: {
    onFiltered(filteredItems) {
      // Trigger pagination to update the number of buttons/pages due to filtering
      this.totalRows = filteredItems.length;
      this.currentPage = 1;
    },
    checkAdd() {
      if (
        (this.cID === null) |
        (this.cName === null) |
        (this.cDiscount === null) |
        (this.cLimit === null) |
        (this.cStartD === null) |
        (this.cExpriedD === null)
      ) {
        this.makeToast("danger", "You have not done all the fields yet.");
      } else {
        this.makeToast("success", "Already added code");
      }
    },
    makeToast(variant = null, text) {
      this.$bvToast.toast(text, {
        title: "Notice!",
        variant: variant,
        solid: true,
        toaster: "b-toaster-bottom-center",
      });
    },
    showModalcode() {
      this.$refs["my-modal-code"].show();
    },
    hideModalcode() {
      this.$refs["my-modal-code"].hide();
    },
  },
};
</script>

<style scoped>
#addSection {
  display: table;
  margin: auto;
}
#all {
  margin: 20px 100px auto 300px;
}
canvas {
  max-width: 100%;
}
.container-canvas {
  /* This could be done in one single declaration. See the extended sample. */
  margin-right: auto;
  margin-left: auto;
  width: 800px;
}
</style>
