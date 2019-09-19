document.addEventListener("DOMContentLoaded", () => {
  // toggling restaurants

  const toggleLi = (e) => {
    const li = e.target;
    if (li.className === "visited") {
      li.className = "";
    } else {
      li.className = "visited";
    }
  };

  document.querySelectorAll("#restaurants li").forEach((li) => {
    li.addEventListener("click", toggleLi);
  });



  // adding SF places as list items

  // --- your code here!  
  const addRestaurantButton = document.getElementsByClassName("favorite-submit")[0];
  const restuarants = document.getElementById("restaurants");
  addRestaurantButton.addEventListener("click", event => {
    event.preventDefault();
    let restaurantInput = document.getElementsByClassName("favorite-input")[0];
    let restaurant = restaurantInput.value;
    restaurantInput.value = "";
    let li = document.createElement("li");
    li.textContent = restaurant;
    restuarants.appendChild(li);
  });

  // adding new photos

  // --- your code here!
  const togglePhotoFormBtn = document.getElementsByClassName("photo-show-button")[0];
  const photoForm = document.getElementsByClassName("photo-form-container")[0];
  const photos = document.getElementsByClassName("dog-photos")[0];
  togglePhotoFormBtn.addEventListener("click", event => {
    event.preventDefault();
    photoForm.classList.toggle('hidden');
  })

  const addPhotoBtn = document.getElementsByClassName("photo-url-submit")[0];
  addPhotoBtn.addEventListener("click", event => {
    event.preventDefault();
    let imgSrc = document.getElementsByClassName("photo-url-input")[0].value;
    let li = document.createElement("li");
    let img = document.createElement("img");
    img.src = imgSrc;
    li.append(img);
    photos.appendChild(li);
  });

});
