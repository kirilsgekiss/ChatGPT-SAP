(function () {
    let tmpl = document.createElement('template');
    tmpl.innerHTML = `
      <style>
        /* Add your custom CSS styles here */
      </style>
      <div>
        <h2 id="title"></h2>
        <span id="temperature"></span>
        <span id="description"></span>
      </div>
    `;
  
    class Box extends HTMLElement {
      constructor() {
        super();
        this.init();
      }
  
      connectedCallback() {
        this.fetchWeatherData();
      }
  
      init() {
        let shadowRoot = this.attachShadow({ mode: "open" });
        shadowRoot.appendChild(tmpl.content.cloneNode(true));
      }
  
      fetchWeatherData() {
        const apiKey = "1a25aaf7b44ad33041bfaa594735034d"; // Replace with your actual OpenWeatherMap API key
        const city = this.$city; // Replace with the desired city name
  
        const url = `https://api.openweathermap.org/data/2.5/weather?q=${city}&APPID=${apiKey}&units=metric`;
  
        fetch(url)
          .then((response) => response.json())
          .then((data) => {
            const titleElement = this.shadowRoot.querySelector("#title");
            const temperatureElement = this.shadowRoot.querySelector("#temperature");
            const descriptionElement = this.shadowRoot.querySelector("#description");
  
            const temperature = data.main.temp;
            const weatherDescription = data.weather[0].description;
  
            titleElement.textContent = `Weather in ${city}`;
            temperatureElement.textContent = `Temperature: ${temperature}°C`;
            descriptionElement.textContent = `Description: ${weatherDescription}`;
  
            // Call the render function after fetching the data
            this.render();
          })
          .catch((error) => {
            console.error("Error fetching weather data:", error);
          });
      }
  
      onCustomWidgetBeforeUpdate(changedProperties) {
        this._props = { ...this._props, ...changedProperties };
      }
  
      onCustomWidgetAfterUpdate(changedProperties) {
        if ("city" in changedProperties) {
          this.$city = changedProperties["city"];
          this.fetchWeatherData();
        }
      }
  
      // Render function to update the widget's visual representation
      render() {
        // Add any additional rendering logic here if needed
      }
    }
  
    customElements.define("custom-button-2", Box);
  })();