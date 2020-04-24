<template>
    <b-card style="margin:60px">
        <b-container fluid>
            <b-form-select v-model="selected" :options="options" size="sm" class="mt-3"></b-form-select>
            <b-row class="my-1" v-for="type in types" :key="type">
            <b-col sm="3">
                <label :for="`type-${type}`">type <code>{{ type }}</code>:</label>
            </b-col>
            <b-col sm="9">
                <b-form-input :id="`type-${type}`" :type="type"></b-form-input>
            </b-col>
            </b-row>
        </b-container>
    </b-card>
</template>


<script>
  export default {
    data() {
      return {
        selected: null,
        options: [
          { value: null, text: 'Please select an option' },
          { value: 'a', text: 'Mr.' },
          { value: 'b', text: 'Ms.' },
          { value: 'a', text: 'Miss.' }
        ]
      }
    }
  }
</script>

<script>
  export default {
    data() {
      return {
        types: [
          'First name',
          'Last name',
          'number',
          'email',
          'password',
          'search',
          'url',
          'tel',
          'date',
          'time',
          'range',
          'color'
        ]
      }
    }
  }
</script>