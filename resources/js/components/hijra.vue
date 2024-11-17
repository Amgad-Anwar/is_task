<template>
  <div class="date-picker-container w-100">
    <label for="mobile" class="form-label">DOB (Hijri)</label>

    <input
      type="text"
      id="dob_hijri"
      placeholder="Select Date"
      @focus="showCalendar = true"
      class="date-input"
      @change="handleDateChange"
      required
    />

    <datepicker-hijri
      v-if="showCalendar"
      reference="dob_hijri"
      placement="bottom"
      date-format="iYYYY/iMM/iDD"
      :selected-date="hijriDate"
      @change="handleDateChange"
      class="datepicker"
    ></datepicker-hijri>
  </div>
</template>

<script>
import moment from 'moment-hijri';

export default {
  props: {
    initialDate: {
      type: String,
      default: '',
    },
    setDate: {
      type: Function,
      required: true,
    }
  },
  data() {
    return {
      hijriDate: this.initialDate,
      showCalendar: false,
       minDate: moment(),
    };
  },
  methods: {
    handleDateChange(event) {
         console.log(event.target.value);
      this.hijriDate = event.target.value;
      this.setDate(this.hijriDate);
      this.showCalendar = false;

    },

  },
  watch: {
    initialDate(newVal) {
      this.hijriDate = newVal;
    },
  },
};
</script>

<style scoped>
.date-picker-container {
  position: relative;
  display: inline-block;
  width: 220px;
  font-family: 'Arial', sans-serif;
}

.date-input {
  width: 100%;
  padding: 12px 15px;
  border: 1px solid #ccc;
  border-radius: 8px;
  font-size: 14px;
  background-color: #fff;
  transition: all 0.3s ease-in-out;
  box-sizing: border-box;
}

.date-input:focus {
  outline: none;
  border-color: #007bff;
  box-shadow: 0 0 8px rgba(0, 123, 255, 0.2);
}

.date-input:hover {
  border-color: #007bff;
}

.datepicker {
  position: absolute;
  top:0;
  left:0;
  z-index: 100;
  margin-top: 8px;
  border-radius: 8px;
  box-shadow: 0 5px 20px rgba(0, 0, 0, 0.1);
  background-color: #fff;
  transition: opacity 0.3s ease;
}

.datepicker .day {
  cursor: pointer;
  padding: 10px;
  text-align: center;
  border-radius: 5px;
}

.datepicker .day:hover {
  background-color: #f0f0f0;
}

.datepicker .day.selected {
  background-color: #007bff;
  color: white;
}

.datepicker .day.today {
  background-color: #d1e7fd;
}

.datepicker .week {
  display: flex;
  justify-content: space-around;
}

.datepicker .week .day {
  width: 30px;
}

.date-picker-container .datepicker {
  display: block;
  opacity: 1;
  pointer-events: auto;
}

.datepicker::-webkit-calendar-picker-indicator {
  display: none;
}
</style>
