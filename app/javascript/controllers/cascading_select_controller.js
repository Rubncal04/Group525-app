// app/javascript/controllers/cascading_select_controller.js
document.addEventListener("DOMContentLoaded", function() {
  const countrySelect = document.getElementById('country-select');
  const stateSelect = document.getElementById('state-select');
  const citySelect = document.getElementById('city-select');

  countrySelect.addEventListener('change', function() {
    const countryId = countrySelect.value;
    if (countryId) {
      fetch(`/contacts/get_states?country_id=${countryId}`)
        .then(response => response.json())
        .then(data => {
          stateSelect.innerHTML = '';
          stateSelect.disabled = false;
          stateSelect.append(new Option('Choose your state', ''));
          data.forEach(state => {
            stateSelect.append(new Option(state.name, state.id));
          });
        });
    } else {
      stateSelect.disabled = true;
      citySelect.disabled = true;
    }
  });

  stateSelect.addEventListener('change', function() {
    const stateId = stateSelect.value;
    if (stateId) {
      fetch(`/contacts/get_cities?state_id=${stateId}`)
        .then(response => response.json())
        .then(data => {
          citySelect.innerHTML = '';
          citySelect.disabled = false;
          citySelect.append(new Option('Choose your city', ''));
          data.forEach(city => {
            citySelect.append(new Option(city.name, city.id));
          });
        });
    } else {
      citySelect.disabled = true;
    }
  });
});
