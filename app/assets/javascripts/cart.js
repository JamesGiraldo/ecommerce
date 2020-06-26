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

  },
  addFav (e){

  },
  deleteItem(e,fila){

  },
  deleteFavorite(e,fila){

  }
}

$(document).ready(function(){
  datos.cart = parseInt(document.getElementById('mycard').textContent)
})
