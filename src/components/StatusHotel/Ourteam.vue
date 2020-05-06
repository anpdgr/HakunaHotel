<template>
  <div>
    <STnav />
    <Side />

    <div id="all">
      <div id="summary" style="float:right">
      <b-button id="show-btn"  variant="success"   @click="showModalstaff">see summary</b-button>

      <b-modal ref="my-modal-staff" hide-footer title="Summary" size='lg'>
        <div class="chart-wrapper">
          <chart :options="chartOptionsBar" style="float:center"></chart>
        </div>
      </b-modal>
    </div>
      <h1 style="margin-top:30px">Staff information</h1>
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
              <b-input-group size="sm">
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
              <b-form-checkbox-group v-model="filterOn" class="mt-1">
                <b-form-checkbox value="id">ID</b-form-checkbox>
                <b-form-checkbox value="sName">Name</b-form-checkbox>
                <b-form-checkbox value="position">Position</b-form-checkbox>
                <b-form-checkbox value="salary">Salary</b-form-checkbox>
              </b-form-checkbox-group>
            </b-form-group>
          </b-col>

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
              <b-form-select
                v-model="perPage"
                id="perPageSelect"
                size="sm"
                :options="pageOptions"
              ></b-form-select>
            </b-form-group>
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
          :filterIncludedFields="filterOn"
          @filtered="onFiltered"
          :tbody-tr-class="rowClass"
        >
          <template v-slot:cell(sName)="row">
            {{ row.value.title }} {{ row.value.name }}
          </template>

          <template v-slot:cell(actions)="row">
            <b-button variant="light" size="sm" @click="row.toggleDetails">
              {{ row.detailsShowing ? "Hide" : "Show" }} more details
            </b-button>

            <b-button
              size="sm"
              @click="showModal(row.item)"
              class="mr-1"
              variant="danger"
            >
              Edit
            </b-button>
          </template>

          <template v-slot:row-details="row">
            <b-card>
              <pre style="font-size:large; margin:0px">
              <b>Date of Birth</b>: {{row.item.dob}}        <b>Address</b>: {{row.item.address}}        <b>Start date</b>: {{row.item.sDate}}        <b>End date</b>: {{row.item.eDate}}   
              </pre>
            </b-card>
          </template>
        </b-table>


        <!-- Info modal -->
          <b-modal ref="editModal" title="Edit staff information" hide-footer>
              <div id="editST">
                {{infoModalContent}}
                <b-form-group label="Position:" label-for="ip-position">
                  <b-form-input
                    id="ip-position"
                    v-model="editPosition"
                    placeholder="Enter new position"
                  ></b-form-input>
                </b-form-group>

                <b-form-group label="Salary:" label-for="ip-salary">
                  <b-form-input
                    id="ip-salary"
                    v-model="editSalary"
                    placeholder="Enter new salary"
                    required=""
                  ></b-form-input>
                </b-form-group>

                <b-form-group label="Start date:" label-for="ip-sDate">
                  <b-form-datepicker
                    id="ip-sDate"
                    v-model="editSDate"
                    placeholder="-- select date --"
                  ></b-form-datepicker>
                </b-form-group>

                <b-form-group label="End date:" label-for="ip-eDate">
                  <b-form-datepicker
                    id="ip-eDate"
                    v-model="editEDate"
                    placeholder="-- select date --"
                  ></b-form-datepicker>
                </b-form-group>

                <div style="float: right;">
                  <b-button
                    type="reset"
                    variant="danger"
                    style="margin-right:20px;"
                    @click="onReset"
                    >Reset</b-button
                  >
                  <b-button @click="onSubmit" variant="primary"
                    >Submit</b-button
                  >
                </div>
              </div>
          </b-modal>

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
import Side from "./Side_statusH.vue";
export default {
  components: { STnav, Side },
  data() {
    return {
            chartOptionsBar: {
        xAxis: {
          data: ["IT", "housekeeper","DBA","dev"],
        },
        yAxis: {
          type: "value",
        },
        series: [
          {
            type: "bar",
            data: [63, 5,45,9],
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
      items: [
        {
          id: "ST_0002",
          sName: { title: "Mrs.", name: "Suthada Haha" },
          position: "IT",
          salary: 28000,
          email: "ST_0002@mail.hotel.com",
          tel: "0659666687",
          dob: "1999-12-02",
          address: "The mall tha phra",
          sDate: "2020-05-03",
          eDate: "2020-05-04",
        },
        {
          id: "ST_0001",
          sName: { title: "Mr.", name: "Ananya Gaga" },
          position: "housekeeper",
          salary: 3000,
          email: "ST_0001@mail.hotel.com",
          tel: "0629398559",
          dob: "2000-08-11",
          address: "Taksin 33",
          sDate: "2020-05-03",
          eDate: "",
        },
        {
          id: "ST_0003",
          sName: { title: "Miss", name: "Piyaluk Rukkorn" },
          position: "DBA",
          salary: 28000,
          email: "ST_0003@mail.hotel.com",
          tel: "0889965789",
          dob: "1999-09-16",
          address: "Pchut 33",
          sDate: "2020-05-03",
          eDate: "",
        },
        {
          id: "ST_0004",
          sName: { title: "Mr.", name: "Warakorn Norneeklaew" },
          position: "Full stack dev",
          salary: 500000,
          email: "ST_0004@mail.hotel.com",
          tel: "0128596458",
          dob: "1999-00-00",
          address: "Cosmo",
          sDate: "2020-05-02",
          eDate: "2021-06-08",
        },
      ],
      fields: [
        { key: "id", label: "Staff ID", sortable: true },
        { key: "sName", label: "(title) Staff name", sortable: true },
        { key: "position", label: "Position", sortable: true },
        { key: "salary", label: "Salary", sortable: true },
        { key: "email", label: "Email", sortable: true },
        { key: "tel", label: "TelNo", sortable: true },
        { key: "actions", label: "Actions" },
      ],
      fieldsMore: [
        { key: "dob", label: "Date of Birth", sortable: true },
        { key: "address", label: "Address", sortable: true },
        { key: "sDate", label: "Start date", sortable: true },
        { key: "eDate", label: "End date", sortable: true },
      ],
      totalRows: 1,
      currentPage: 1,
      perPage: 5,
      pageOptions: [5, 10, 15],
      sortBy: "",
      sortDesc: false,
      sortDirection: "asc",
      filter: null,
      filterOn: [],
      //edit prmt
      editPosition: null,
      editSalary: null,
      editSDate: null,
      editEDate: null,
      show: true,
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
    showModal(item) {
      this.infoModalContent=item;
      this.$refs["editModal"].show();
    },
    hideModal() {
      this.$refs["editModal"].hide();
    },
    onSubmit(evt) {
      evt.preventDefault();
      if (
        this.editPosition === null &&
        this.editSalary === null &&
        this.editSDate === null &&
        this.editEDate === null
      ) {
        this.makeToast("danger", "Nothing updated");
      } else {
        this.makeToast("success", "Information has been updated.");
      }
      this.hideModal();
    },
    onReset(evt) {
      evt.preventDefault();
      // Reset our form values
      this.editPosition = "";
      this.editSalary = "";
      this.editSDate = "";
      this.editEDate = "";
      this.show = false;
      this.$nextTick(() => {
        this.show = true;
      });
    },
    makeToast(variant = null, text) {
      this.$bvToast.toast(text, {
        title: "Notice!",
        variant: variant,
        solid: true,
        toaster: "b-toaster-bottom-center",
      });
    },
    rowClass(item) {
      if (item._showDetails === true) return "table-secondary";
      else return;
    },
    showModalstaff() {
        this.$refs['my-modal-staff'].show()
      },
      hideModalstaff() {
        this.$refs['my-modal-staff'].hide()
      },
  },
};
</script>

<style scoped>
#card {
  max-width: 90rem;
  margin: 100px 100px 100px 300px;
  padding: 30px;
}
#all {
  margin: 100px 100px auto 300px;
}
.chart-wrapper {
  width: 100%;
  height: 500px;
}
</style>
