/**
 * EVENT: Change picture when clicked
*/
const profilePic = document.querySelector("#profile-pic")
const imageSources = {
  normal: "img/Tugas-CV.png",
  dio: "img/Dio.png",
}

profilePic.addEventListener("click", () => {

  /// Grab the current active image
  const currentImage = profilePic.getAttribute("src")

  /// Set the profile picture according to current image
  if (currentImage === imageSources.normal) {
    profilePic.setAttribute("src", imageSources.dio)
    profilePic.setAttribute("width", "250pt")
  } else {
    profilePic.setAttribute("src", imageSources.normal)
    profilePic.setAttribute("width", "150pt")
  }
})
