<template>
  <div>
    <STnav />
    <Side />
    <div id="all">
      <div id="summary" style="float:right">
        <!-- ปุ่มดู summary status booking -->
        <b-button id="show-btn" variant="success" @click="showModal">see summary</b-button>
        <b-modal
          ref="my-modal"
          hide-footer
          title="Booking summary"
          style="padding:10px; float:center"
          size="lg"
        >
          <!-- chart detail  -->
          <div class="chart-wrapper">
            <chart :options="chartOptionsBar" style="float:center"></chart>
          </div>
        </b-modal>
      </div>

      <div>
        <h1>Booking</h1>
        <br />
        <br />
      </div>

      <b-container fluid>
        <!-- User Interface controls -->
        <b-row>
          <b-col lg="6" class="my-1">
            <b-form-group
              label="Filter"
              label-cols-sm="3"
              label-align-sm="right"
              label-size="sm"
              label-for="filterInput"
              class="mb-0"
            >
              <!-- input text for filter -->
              <b-input-group size="sm">
                <b-form-input
                  v-model="filter"
                  type="search"
                  id="filterInput"
                  placeholder="Type to Search"
                ></b-form-input>
                <!-- cleat text in filter box -->
                <b-input-group-append>
                  <b-button :disabled="!filter" @click="filter = ''">Clear</b-button>
                </b-input-group-append>
              </b-input-group>
            </b-form-group>
          </b-col>

          <b-col lg="6" class="my-1">
            <b-form-group
              label="Filter On"
              label-cols-sm="3"
              label-align-sm="right"
              label-size="sm"
              description="Leave all unchecked to filter on all data"
              class="mb-0"
            >
              <!-- check box for filter  -->
              <b-form-checkbox-group v-model="filterOn" class="mt-1">
                <b-form-checkbox value="bookid">Booking ID</b-form-checkbox>
                <b-form-checkbox value="cusid">Customer ID</b-form-checkbox>
                <b-form-checkbox value="status">Status</b-form-checkbox>
              </b-form-checkbox-group>
            </b-form-group>
          </b-col>
          <!-- setting number of row's booking data in per page -->
          <b-col sm="5" md="6" class="my-1">
            <b-form-group
              label="Per page"
              label-cols-sm="6"
              label-cols-md="4"
              label-cols-lg="3"
              label-align-sm="right"
              label-size="sm"
              label-for="perPageSelect"
              class="mb-0"
            >
              <b-form-select v-model="perPage" id="perPageSelect" size="sm" :options="pageOptions"></b-form-select>
            </b-form-group>
          </b-col>
        </b-row>

        <!-- Main table element -->
        <b-table
          show-empty
          small
          stacked="md"
          :items="items"
          :fields="fields"
          :current-page="currentPage"
          :per-page="perPage"
          :filter="filter"
          :filterIncludedFields="filterOn"
          :sort-by.sync="sortBy"
          :sort-desc.sync="sortDesc"
          :sort-direction="sortDirection"
          @filtered="onFiltered"
          style="margin-top:50px"
        >
          <!-- <template v-slot:cell(name)="row">
        {{ row.value.first }} {{ row.value.last }}
          </template>-->

          <template v-slot:cell(info)="row">
            <b-button
              variant="light"
              size="sm"
              @click="row.toggleDetails"
            >{{ row.detailsShowing ? "Hide" : "Show" }} info</b-button>
          </template>

          <template v-slot:cell(actions)="row">
            <div v-if="row.item.status == 'Booking'">
              <button id="btn" size="sm" @click="checkin(row.item.bookid)" style="color:#2688D9">check-in</button>
            </div>
            <div v-if="row.item.status == 'CheckIn'">
              <button  id="btn" size="sm" @click="done(row)" style="color:#E74C3C">check-out</button>
            </div>
          </template>

          <template v-slot:row-details="row">
            <b-card>
              <ul>
                <li v-for="(value, key) in row.item" :key="key">{{ key }}: {{ value }}</li>
              </ul>
            </b-card>
          </template>
        </b-table>

        <!-- Info modal -->
        <b-modal :id="infoModal.id" :title="infoModal.title" ok-only @hide="resetInfoModal">
          <pre>{{ infoModal.content }}</pre>
        </b-modal>
      </b-container>
      <b-col sm="7" md="6" class="my-1">
        <b-pagination
          v-model="currentPage"
          :total-rows="totalRows"
          :per-page="perPage"
          align="center"
          class="my-0"
          pills
          style="margin-left:500px"
        ></b-pagination>
      </b-col>
    </div>
  </div>
</template>

<script>
import STnav from "../Nav_st.vue";
import Side from "./Side_statusH.vue";

export default {
  components: {
    STnav,
    Side
  },
  //for chart summary
  mounted: function() {
    this.fetchBook();
    this.totalRows = this.items.length; // Set the initial number of items
  },

  data() {
    return {
      chartOptionsBar: {
        xAxis: {
          data: ["booking", "check-in", "check-out", "cancel"]
        },
        yAxis: {
          type: "value"
        },
        series: [
          {
            type: "bar",
            data: [63, 75, 24, 92]
          }
        ],
        title: {
          text: "Number of booking",
          x: "center",
          textStyle: {
            fontSize: 24
          }
        },
        color: ["#127ac2"]
      },
      items: [
        // { status: "cancel", cusid: "CUS0001", bookid: "A1000" },
        // { status: "check-in", cusid: "CUS0001", bookid: "A1001" },
        // { status: "check-in", cusid: "CUS0202", bookid: "A1002" },
        // { status: "cancel", cusid: "CUS0003", bookid: "A1003" },
        // { status: "booking", cusid: "CUS1004", bookid: "A1004" },
        // { status: "check-in", cusid: "CUS0005", bookid: "A1005" },
        // { status: "booking", cusid: "CUS1007", bookid: "A1007" },
        // { status: "booking", cusid: "CUS2002", bookid: "B2002" },
        // { status: "booking", cusid: "CUS2011", bookid: "B2001" },
        // { status: "check-out", cusid: "CUS2045", bookid: "B2000" },
      ],
      fields: [
        {
          key: "bookid",
          label: "Booking ID",
          sortable: true,
          sortDirection: "desc"
        },
        {
          key: "cusid",
          label: "Customer ID",
          sortable: true,
          class: "text-center"
        },
        {
          key: "status",
          label: "Status",
          /*formatter: (value, key, item) => {
              return value ? 'Yes' : 'No'
            },*/
          sortable: true,
          sortByFormatted: true,
          filterByFormatted: true
        },
        { key: "actions", label: "Actions" },
        { key: "info", label: "Info" }
      ],
      //totalRows: 1,
      currentPage: 1,
      perPage: 5,
      pageOptions: [5, 10, 15],
      sortBy: "",
      sortDesc: false,
      sortDirection: "asc",
      filter: null,
      filterOn: [],
      infoModal: {
        id: "info-modal",
        title: "",
        content: ""
      }
    };
  },
  computed: {
    sortOptions() {
      // Create an options list from our fields
      return this.fields
        .filter(f => f.sortable)
        .map(f => {
          return { text: f.label, value: f.key };
        });
    },
    totalRows() {
      return this.items.length;
    },
  },
  methods: {
    info(item, index, button) {
      this.infoModal.title = `Row index: ${index}`;
      this.infoModal.content = JSON.stringify(item, null, 2);
      this.$root.$emit("bv::show::modal", this.infoModal.id, button);
    },
    resetInfoModal() {
      this.infoModal.title = "";
      this.infoModal.content = "";
    },
    onFiltered(filteredItems) {
      // Trigger pagination to update the number of buttons/pages due to filtering
      this.totalRows = filteredItems.length;
      this.currentPage = 1;
    },
    done(row) {
      console.log(row.item);
      var formData = this.toFormData(row.item);
      this.axios
      .post(
        "http://hakuna-hotel.kmutt.me/phpapi/bookhis.php?action=done",formData
      );
    },
    //for model
    showModal() {
      this.$refs["my-modal"].show();
    },
    hideModal() {
      this.$refs["my-modal"].hide();
    },
    //เปลี่ยนหน้า
    checkin(bookid) {
      this.$store.dispatch("AcBKID", bookid);
      this.$router.push("checkin");
    },
    fetchBook() {
      this.axios
        .get("http://hakuna-hotel.kmutt.me/phpapi/Booking.php?action=read")
        .then(response => {
          var Books = response.data.data;

          for (var i = 0; i < Books.length; i++) {
            this.items.push({
              status: Books[i].Status,
              cusid: Books[i].User_ID,
              bookid: Books[i].Booking_ID
            });
          }

          // console.log(this.AllBook);
        });
    },

    // convert to formdata
    toFormData(obj) {
      var fd = new FormData();
      for (var i in obj) {
        fd.append(i, obj[i]);
      }
      return fd;
    },
  }
};
</script>

<style>
#btn {
  border: none;
  background-color: transparent;
  padding: 0px;
  font-size: 16px;
  cursor: pointer;
  display: inline-block;
}
#all {
  margin: 100px 100px auto 300px;
}
.chart-wrapper {
  width: 100%;
  height: 500px;
}
</style>

- เป็นตารางห้องๆ บอกสเตตัสบลาๆ มีfilter - ถ้าถึงวัน checkin ก็มีปุ่ม checkin -
ถ้า checkin แล้วมีปุ่ม checkout - ถ้าเกินวัน checkin ก็ตัดการจองเอง
