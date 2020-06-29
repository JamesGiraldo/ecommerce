var datos = {
  token: document.getElementsByName('csrf-token')[0].content,
  product: null,
  btn: null,
  message: "",
  cart: null,
  status: 0,
  response: null,
  element: null,
  total: null
}
var actions = {
  addCart (e){
    datos.product = e.getAttribute("product");
    datos.btn = e;
    //AJAX
    datos.cart += 1
    document.getElementById('mycart').textContent = datos.cart
  },
  addFav (e){
    datos.product = e.getAttribute("product");
    datos.btn = e;
    fetch('/favorites/',
      {
        method: 'POST',
        headers:{
          'X-CSRF-Token': datos.token,
          'Accept': 'application/json',
          'Content-Type': 'application/json'
        },
        body: JSON.stringify(
          {
            "product_id":datos.product
          }
        )
      },
    ).then(result => {
      datos.status = result.clone().status // 200 a 400
      return result.json()
    })
    .then(result => {
      datos.result = result
      if (datos.status == 200){
        ap_accions.toast_alert("success", datos.result.response, 3000)
        // alert(datos.result.response);
      }else {
        ap_accions.toast_alert("error", result.favorites[0], 3000)
        // alert(result.favorites[0]);
      }
    })
    .catch(console.log)
  },
  deleteItem(e,fila){

  },
  deleteFavorite(e,fila){
    datos.product = parseInt(e.getAttribute("product"))
    datos.element = document.getElementById('p_' + fila)
    fetch('/favorites/' + fila,
      {
        method: 'DELETE',
        headers:{
          'X-CSRF-Token': datos.token,
          'Accept': 'application/json',
          'Content-Type': 'application/json'
        }
      }
    )
    .then( response => {
      datos.status = response.clone().status
      return response.json()
    })
    .then( result => {
      if (datos.status == 200) {
        ap_accions.toast_alert("success", result.response, 3000)
        datos.element.style.display = "none"
      }else{
        ap_accions.toast_alert("success", result.products[0], 3000)
      }
    })
    .catch(console.log)
  }
}

// $(document).ready(function(){
//   datos.cart = parseInt(document.getElementById('mycard').textContent)
// })
