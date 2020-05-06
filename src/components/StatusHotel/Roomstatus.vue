<template>
  <div>
    <!-- User Interface controls -->
    <STnav />
    <Side />
    <div id="all">
      <div id="summary" style="float:right">
      <b-button id="show-btn"  variant="success"   @click="showModal">see summary</b-button>

      <b-modal ref="my-modal" hide-footer title="room summary" size="lg">
        <div class="chart-wrapper" >
          <chart :options="chartOptionsBar" style="float:center"></chart>
        </div>
      </b-modal>
    </div>
      <h1>Room</h1>
      <b-row>
        <b-col lg="6" class="my-1">
          <b-form inline style="float:center">

            <b-form-group
              label="Room type"
              label-cols-sm="5"
              label-align-sm="right"
              label-size="sm"
              label-for="selectType"
              class="mb-0"
            >
              <b-input-group size="sm">
                <b-form-select
                  v-model="selected_type"
                  id="selectType"
                  :options="type_options"
                  class="w-75"
                  style="margin-top:30px; margin-left:100px"
                  @change="onSelect"
                >
                </b-form-select>
              </b-input-group>
            </b-form-group>
          </b-form>
        </b-col>

      </b-row>

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
      >
      </b-table>
      <!-- pagination -->
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
    </div>
  </div>
</template>

<script>

import STnav from "../Nav_st.vue";
import Side from "./Side_statusH.vue";
export default {
  components: {
    STnav,
    Side,
  },
  data() {
    return {
      chartOptionsBar: {
            xAxis: {
                data: ['avaiable', 'reserved']
            },
            yAxis: {
                type: 'value'
            },
            series: [
                {
                type: 'bar',
                data: [200, 47]
                }
            ],
            title: {
                text: 'Number of room',
                x: 'center',
                textStyle: {
                fontSize: 24
                }
            },
            color: ['#127ac2']
        },
      type_options: [
        { value: null, text: "All" },
        { value: "Dulux Urban Twin Bed", text: "Dulux Urban Twin Bed" },
        { value: "Dulux Urban King Bed", text: "Dulux Urban King Bed" },
        { value: "Dulux Executive Twin Bed", text: "Dulux Executive Twin Bed" },
        { value: "Dulux Executive Twin Bed", text: "Dulux Executive Twin Bed" },
        { value: "Premier Lux Twin Bed", text: "Premier Lux Twin Bed" },
        { value: "Premier Lux King Bed", text: "Premier Lux King Bed" },
        { value: "Urban Junior Suite", text: "Urban Junior Suite" },
        { value: "Ocean Junior Suite", text: "Ocean Junior Suite" },
        { value: "Marina Suite", text: "Marina Suite" },
      ],
      items: [
        {
          Type: "Premier Lux Twin Bed",
          RoomID: 10000,
          Tel: "02-4445555",
          Status: "Available",
        },
        {
          Type: "Ocean Junior Suite",
          RoomID: 10001,
          Tel: "02-3322441",
          Status: "Available",
        },
        {
          Type: "Dulux Urban King Bed",
          RoomID: 10002,
          Tel: "02-3322455",
          Status: "Reserved",
        },
        {
          Type: "Dulux Urban King Bed",
          RoomID: 10003,
          Tel: "02-6724550",
          Status: "Reserved",
        },
        {
          Type: "Ocean Junior Suite",
          RoomID: 10004,
          Tel: "02-3388441",
          Status: "Available",
        },
        {
          Type: "Urban Junior Suite",
          RoomID: 10005,
          Tel: "02-0022455",
          Status: "Reserved",
        },
        {
          Type: "Dulux Urban King Bed",
          RoomID: 10006,
          Tel: "02-6024550",
          Status: "Available",
        },
      ],

      fields: [
        { key: "Type", sortable: true },
        { key: "RoomID", sortable: true },
        { key: "Tel", sortable: true },
        { key: "Status", sortable: true },
      ],

      totalRows: 1,
      currentPage: 1,
      perPage: 5,
      pageOptions: [5, 10, 15],
      selected_type: "",
      sortDesc: false,
      sortDirection: "asc",
      filter: "",
      filterOn: [],
      sortOptions: ["Dic", "G", "O"],
    };
  },
  mounted() {
    // Set the initial number of items
    this.totalRows = this.items.length;
  },
  methods: {
    onFiltered(filteredItems) {
      // Trigger pagination to update the number of buttons/pages due to filtering
      this.totalRows = filteredItems.length;
      this.currentPage = 1;
    },

        onSelect() {
        this.filter = this.selected_type;
    },
    showModal() {
        this.$refs['my-modal'].show()
      },
      hideModal() {
        this.$refs['my-modal'].hide()
      },
  },
};
</script>

<style>
#all {
  margin: 100px 100px auto 300px;
}
.chart-wrapper {
  width: 100%;
  height: 500px;
}
</style>
