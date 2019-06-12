document.addEventListener('DOMContentLoaded', () => {

const endPoint = "https://warm-oasis-35665.herokuapp.com/poses"
const createButton = document.querySelector('.btn-create')
//form consts
const submitCreateButton = document.querySelector('.btn-create-submit')
const createPoseName = document.querySelector('.create-pose-name')
const createPoseSanskritName = document.querySelector('.create-pose-sanskrit-name')
const createPoseAnatomy = document.querySelector('.create-pose-anatomy')
const createPoseDifficulty = document.querySelector('.create-pose-difficulty')
const createPoseImage = document.querySelector('.create-pose-image-url')
const createPoseSubmitButton = document.querySelector('.btn-create-submit')

function fetchPoses() {
    return fetch(`${endPoint}`).then(res => res.json());
  }
  // console.log(fetchPoses());


function deleteKiddos(){
  let element = document.querySelector('.poses');
    while (element.firstChild) {
      element.removeChild(element.firstChild);
    }
  }



function main() {
  deleteKiddos()
  // fetch(endPoint)
  //   .then(res => res.json())
  fetchPoses()
    .then(json =>
      json.forEach(pose => {
        const markup =
        // <div class="container">
        // <li class="list-item-pose">
        // <h3>${pose.name}</h3>
        // <input type="button" value="Edit" class="btn btn-primary btn-edit" id="${pose.id}-edit">
        // <input type="button" value="Delete" class="btn btn-primary btn-delete" id="${pose.id}-delete">
        // <img src="${pose.image_url}" id="${pose.id}-image">
        // </li>
        // </div>

        `
        <div class="card shadow-lg p-3 mb-5 bg-white rounded" style="width: auto;">

  <img src="${pose.image_url}" id="${pose.id}-image" class="card-img-top">
  <div class="card-body bg-info mb-3">
    <b><h4 class="card-title">${pose.name}</h4></b>
    <ul class="list-group list-group-flush">
    <li class="list-group-item"><b>Sanskrit Name:</b> ${pose.sanskrit_name}</li>
    <li class="list-group-item"><b>Focus:</b>  ${pose.anatomy}</li>
    <li class="list-group-item"><b>Level:</b>  ${pose.difficulty}</li>
  </ul><br><center>
    <input type="button" value="Edit" class="btn btn-primary btn-edit" id="${pose.id}-edit">
    <input type="button" value="Delete" class="btn btn-primary btn-delete" id="${pose.id}-delete">
</center>
  </div>
</div>`
        document.querySelector('.poses').innerHTML += markup
      })
    ) .then(something => {
        document.querySelectorAll('.btn-delete').forEach(function(button) {
          button.addEventListener('click', () => {
            deletePose(button)
          })
        })









        document.querySelectorAll('.btn-edit').forEach(function(button) {
            button.addEventListener('click', (event) => {
              fetch(`${endPoint}/${button.id}`).then(res => res.json()).then(pose => {


                let editForm = document.createElement("form")

                editForm.innerHTML = `
                <center>
                <br><br><b>Name: </b><input type="text" name="name" value="${pose.name}" id="editname">
              <br><br>  <b>Sanskrit Name: </b><input type="text" name="sanskrit_name" value="${pose.sanskrit_name}"id="sanskrit_name">
              <br><br>  <b>Anatomy: </b><input type="text" name="anatomy" value="${pose.anatomy}"id="anatomy">
                <br><br><b>Difficulty: </b><input type="text" name="difficulty" value="${pose.difficulty}"id="difficulty">
                <br><br><b>Image URL: </b><input type="text" name="image_url" value="${pose.image_url}"id="image_url">
                <br><br><input type="hidden" value="${pose.id}" name="id">
              <br><br>  <input type="submit" class="btn-edit-submit" value="Edit">
                </center>
                `

                document.querySelector(".poses").appendChild(editForm)
                editForm.setAttribute("id", "editForm")
                editForm.setAttribute("name", "editForm")


                  const editData = new FormData(event.target)
                  const body ={
                    name: document.querySelector("#editname").value,
                    sanskrit_name: editData.get("sanskrit_name"),
                    anatomy: editData.get("anatomy"),
                    difficulty: editData.get("difficulty"),
                    image_url: editData.get("image_url")
                  }
                  let editname = document.querySelector('#editname')
                  editname.addEventListener("input", (e) => {
                    body.name = e.target.value
                  })

                  let sanskrit_name = document.querySelector('#sanskrit_name')
                  sanskrit_name.addEventListener("input", (e) => {
                    body.sanskrit_name = e.target.value
                    console.log(body)
                  })

                  let anatomy = document.querySelector('#anatomy')
                  anatomy.addEventListener("input", (e) => {
                    body.anatomy = e.target.value
                  })

                  let difficulty = document.querySelector('#difficulty')
                  difficulty.addEventListener("input", (e) => {
                    body.difficulty = e.target.value
                  })

                  let image_url = document.querySelector('#image_url')
                  image_url.addEventListener("input", (e) => {
                    body.image_url = e.target.value
                  })

                document.querySelector('.btn-edit-submit').addEventListener('click', (event) => {
                      console.log(pose.id)
                  event.preventDefault()

                  fetch(`${endPoint}/${pose.id}`, {
                    method: "PATCH",
                    headers: {
                         'Content-Type': 'application/json',
                          Accept: 'application/json',
                       },
                       body: JSON.stringify(body)
                  }).then(res => res.json()).then(res => console.log(res))

                })
                // alert(`<form class="create-form">
                //     Name:<input type="text" class="create-pose-name" value="${pose.name}">
                //     Sanskrit Name:<input type="text" class="create-pose-sanskrit-name" value="${pose.sanskrit_name}">
                //     Anatomy:<input type="text" class="create-pose-anatomy" value="${pose.anatomy}">
                //     Difficulty:<input type="text" class="create-pose-difficulty" value="${pose.difficulty}"><br>
                //     Image URL:<input type="text" class="create-pose-image-url" value="${pose.image_url}">
                //     <input type="button" class="btn-create-submit" value="Submit">
                //   </form>
                //     `)
              })
            // console.log(button.id)


      })
    })
  })
}
// document.querySelector('.btn-edit-submit').addEventListener('click', (event) => {
//   const editData = new FormData(event.target)
//   const body ={
//     name: editData.get("name"),
//     sanskrit_name: editData.get("sanskrit_name"),
//     anatomy: editData.get("anatomy"),
//     difficulty: editData.get("difficulty"),
//     image_url: editData.get("image_url")
//   }
//   fetch(`${endPoint}/${editData.get("id")}`, {
//     method: "PATCH",
//     headers: {
//          'Content-Type': 'application/json',
//           Accept: 'application/json',
//        },
//        body: JSON.stringify()
//   }).then(res => res.json()).then(res => console.log(res))
//
// })


// function updatePose(button) {
//
//   const editData = new FormData(event.target)
//   const body ={
//     name: editData.get("name"),
//     sanskrit_name: editData.get("sanskrit_name"),
//     anatomy: editData.get("anatomy"),
//     difficulty: editData.get("difficulty"),
//     image_url: editData.get("image_url")
//   }
//   fetch(`${endPoint}/${button.id}`, {
//     method: "PATCH",
//     headers: {
//          'Content-Type': 'application/json',
//           Accept: 'application/json',
//        },
//        body: JSON.stringify()
//   }).then(res => res.json()).then(res => console.log(res))
// }


function deletePose(button) {
  fetch(`${endPoint}/${button.id}`, {
    method: "DELETE"
  })
  .then(res => main())
}

// function editPose(button) {
//   //i want this to render the edit form populated with information from this specific pose
// alert('still working')
// const editForm = `
// <form name="${pose.id}">
// `
//
// }
  // const deleteButtons = document.querySelectorAll('.btn-delete')
  // deleteButtons.forEach(function(button){
  //   button.addEventListener('click', deleteThis())
  // })
  // function deleteThis(){
  //   alert(this.data-id)
  // }
  // console.log(deleteButtons);
  // const deletes = document.querySelectorAll('.btn-delete');
  // deleteButtons.forEach(function(button) {
  //   console.log(button);
  // })

  // createButton.addEventListener('click', (event) => {
  //
  // })

createPoseSubmitButton.addEventListener('click', (event) => {
  let createData = {
    name: createPoseName.value,
    sanskrit_name: createPoseSanskritName.value,
    anatomy: createPoseAnatomy.value,
    difficulty: createPoseDifficulty.value,
    image_url: createPoseImage.value
  }
  fetch(endPoint, {
    method: "POST",
    headers: {
      "Content-Type": "application/json",
      "Accept": "application/json"
    },
    body: JSON.stringify(createData)
  })
  .then(res => main())
})


 main();
  })
