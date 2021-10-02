const resultContainer = document.querySelector(".result")
const searchField = document.querySelector("#search-input")
const searchBtn = document.querySelector("#search-btn")
const API_KEY = `f9d9256c930a0fb9be9a9c7738927719`
let query = ``

// for making requests, sudah deprecated, tapi lebih aman
// karena built in di semua browser, berbeda dengan JQuery.
const ajax = new XMLHttpRequest()

// Ketika search button di klik, maka lakukan request ke server
searchBtn.addEventListener("click", () => {

  // ambil text di search field
  query = searchField.value
  const URL = `https://api.openweathermap.org/data/2.5/weather?q=${query}&appid=${API_KEY}`

  // request ke open weather server (asynchronously)
  ajax.open("GET", URL, true)
  ajax.send()
})

// function ini akan di call ketika attribute `readyState` dari ajax object berubah
// bersifat asynchrnous
ajax.onreadystatechange = function() {

  // cek jika readyState === 4 (ajax siap di call)
  // cek jika status === 200 (response OK)
  if (this.readyState === 4 && this.status === 200) {
    // parse JSON result dari OpenWeather server
    const result = JSON.parse(ajax.responseText).main

    // temperatur yang dikembalikan oleh OpenWeather
    // dalam Kelvin secara default, sehingga harus di konversi ke Celcius
    const temperature = result.temp - 273
    const temperatureMin = result.temp_min - 273
    const temperatureMax = result.temp_max - 273
    const temperatureFeels = result.feels_like - 273

    // satuan default: hPa (hecto-Pascal)
    // konversi ke satuan `atm`
    const pressure = result.pressure * 0.0009869233

    // satuan: %
    const humidity = result.humidity

    resultContainer.innerHTML = `
      <p>Kota: ${query}</p>
      <p>- Humidity: ${humidity.toFixed(2)} %</p>
      <p>- Pressure: ${pressure.toFixed(2)}</p>
      <p>- Temp. Avg: ${temperature.toFixed(2)} C</p>
      <p>- Temp. Max: ${temperatureMax.toFixed(2)} C</p>
      <p>- Temp. Min: ${temperatureMin.toFixed(2)} C</p>
      <p>- Feels: ${temperatureFeels.toFixed(2)} C</p>
    `
  }

  else if (this.readyState === 4 && this.status === 404) {
    resultContainer.innerHTML = `
      <h2 class="text-danger">Kota: "${query}"</h2>
      <h1 class="text-danger">tidak ditemukan!</h1>
    `
  }
}
