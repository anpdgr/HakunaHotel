<template>
  <div>
    <STnav />
    <Side />
    <!-- ปุ่ม summary code id แต่อยากให้เปลี่ยนเป็น code name  -->
    <div id="summary" style="float:right; margin-right:100px">
      <b-button id="show-btn" variant="success" @click="showModalcode"
        >see summary</b-button
      >
      <!-- chart  -->
      <b-modal ref="my-modal-code" hide-footer title="Summary" size="lg">
        <div class="chart-wrapper">
          <chart :options="chartOptionsBar" style="float:center"></chart>
        </div>
      </b-modal>
    </div>

    <div id="all">
      <div></div>
      <div id="addSection">
        <h1>Add code</h1>
        <br />
        <!-- form for add code  -->
        <b-form inline id="idname">
          <!-- input code id -->
          <b-form-group class="mb-0" label="Code ID: " label-for="id">
            <b-form-input
              id="id"
              required
              v-model="code.codeid"
              placeholder="Enter Code ID"
              style="margin-left:10px; margin-right:50px; width: 15rem;"
            ></b-form-input>
          </b-form-group>
          <!-- input code name  -->
          <b-form-group class="mb-0" label="Code name: " label-for="name">
            <b-form-input
              id="name"
              v-model="code.codename"
              placeholder="Enter Code name"
              style="width: 15rem;"
            ></b-form-input>
          </b-form-group>
        </b-form>
        <br />
        <b-form inline id="discountlimit">
          <!-- input discount  -->
          <b-form-group class="mb-0" label="Discount: " label-for="discount">
            <b-form-input
              id="discount"
              v-model="code.discount"
              placeholder="Enter discount in THB"
              style="margin-left:7px; margin-right:100px; width: 15rem;"
            ></b-form-input>
          </b-form-group>
          <!-- input limit  -->
          <b-form-group class="mb-0" label="Limit: " label-for="limit">
            <b-form-input
              id="limit"
              v-model="code.limit"
              placeholder="Enter limit used"
              style="width: 15rem;"
            ></b-form-input>
          </b-form-group>
        </b-form>
        <br />
        <b-form inline id="dateform">
          <!-- input start date -->
          <b-form-group class="mb-0" label="Start date: " label-for="StartDate">
            <b-form-datepicker
              id="StartDate"
              v-model="code.SDate"
              placeholder="Select start date"
              style="margin-right:43px; width: 15rem;"
            ></b-form-datepicker>
          </b-form-group>
          <!-- input ex date -->
          <b-form-group
            class="mb-0"
            label="Expired date: "
            label-for="ExpiredDate"
          >
            <b-form-datepicker
              id="ExpiredDate"
              v-model="code.ExDate"
              placeholder="Select expired date"
              style="width: 15rem;"
            ></b-form-datepicker>
          </b-form-group>
        </b-form>
        <br />
        <!-- ปุ่ม submit ::: @click=chechAdd() เนยเปลี่ยนเป็น @submit="onSubmit"-->
        <b-button id="button" type="submit" variant="dark" @click="checkAdd()"
          >Add</b-button
        >
      </div>
      <hr />
      <h5 style="margin-top:30px; padding-right:130px"><b>Existing code</b></h5>
      <b-container fluid style="margin-top:20px;">
        <!-- User Interface controls -->
        <div style="margin:auto; margin-top:20px;">
          <b-row>
            <b-col lg="4" class="my-1">
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
          id="my-table"
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
            aria-controls="my-table"
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

export default {
  components: {
    Side,
    STnav,
  },
  data() {
    return {
      chartOptionsBar: {
        xAxis: {
          data: ["FIRST100", "LIMIT5"],
        },
        yAxis: {
          type: "value",
        },
        series: [
          {
            type: "bar",
            data: [63, 5],
          },
        ],
        title: {
          text: "Quarterly Sales Results",
          x: "center",
          textStyle: {
            fontSize: 24,
          },
        },
        color: ["#127ac2"],
      },
      code: {
        codeid: null,
        codename: null,
        discount: null,
        limit: null,
        SDate: null,
        ExDate: null,
      },
      // post code promotion ที่มีใน db
      items: [],

      fields: [
        { key: "Code_ID", label: "Code ID", sortable: true },
        { key: "Code_Name", label: "Code name", sortable: true },
        { key: "Discount", label: "Discount", sortable: true },
        { key: "Limit", label: "Limit used", sortable: true },
        { key: "StartDate", label: "Start Date", sortable: true },
        { key: "ExpireDate", label: "Expired Date", sortable: true },
      ],

      //totalRows: 1,
      currentPage: 1,
      perPage: 10,
      //pageOptions: [5, 10, 15],
      filter: null,

      sortDesc: false,
      sortDirection: "asc",
      filterOn: [],
    };
  },
  computed: {
    totalRows() {
      return this.items.length;
    },
    sortOptions() {
      // Create an options list from our fields
      return this.fields
        .filter((f) => f.sortable)
        .map((f) => {
          return { text: f.label, value: f.key };
        });
    },
  },
  mounted() {
    // Set the initial number of items
    this.totalRows = this.items.length;
    this.fetchCode();
  },

  methods: {
    onFiltered(filteredItems) {
      // Trigger pagination to update the number of buttons/pages due to filtering
      this.totalRows = filteredItems.length;
      this.currentPage = 1;
    },
    checkAdd() {
      if (
        (this.code.codeid === null) |
        (this.code.codename === null) |
        (this.code.discount === null) |
        (this.code.limit === null) |
        (this.code.SDate === null) |
        (this.code.ExDate === null)
      ) {
        this.makeToast("danger", "You have not done all the fields yet.");
      } else {
        this.AddCode();
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
    //show code in db
    fetchCode() {
      var formData = this.toFormData(this.items);
      this.axios
        .post(
          "http://hakuna-hotel.kmutt.me/phpapi/CodePromo.php?action=read",
          formData
        )
        .then((response) => {
          this.items = response.data.data;

          // if (response.data.error) {
          //   console.log(response.data.error);
          // } else {
          //   console.log(response.data.message);
          // }
        });
    },
    //Add code to db
    AddCode() {
      var formData = this.toFormData(this.code);
      this.axios
        .post(
          "http://hakuna-hotel.kmutt.me/phpapi/CodePromo.php?action=add",
          formData
        )
        // .then((response) => {
        //   //set var to default
        //   // console.log(response);
        //   this.code = {
        //     codeid: null,
        //     codename: null,
        //     discount: null,
        //     limit: null,
        //     SDate: null,
        //     ExDate: null,
        //   };
        //   // if (response.data.error) {
        //   //   console.log(response.data.error);
        //   // } else {
        //   //   console.log(response.data.message);
        //   // }
        // })
        ;
        this.code = {
            codeid: null,
            codename: null,
            discount: null,
            limit: null,
            SDate: null,
            ExDate: null,
          };
    },
    // convert to formdata
    toFormData(obj) {
      var fd = new FormData();
      for (var i in obj) {
        fd.append(i, obj[i]);
      }
      return fd;
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
  margin: 100px 100px auto 300px;
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
.chart-wrapper {
  width: 100%;
  height: 500px;
}
</style>
