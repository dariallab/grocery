$("#fill-cart").click(function () {
  $("#status").text("");
  fillCart();
});

$("#add-rewe-product").click(function () {
  $("#status").text("");
  chrome.tabs.executeScript(null, { file: "jquery-3.3.1.min.js" }, function () {
    chrome.tabs.executeScript(null, { file: "content.js" });
  });
});

chrome.runtime.onMessage.addListener(function (request, sender) {
  if (request.operation == "product-info") {
    call("http://127.0.0.1:8080/rewe-products", "post", request.data)
  }
});

function fillCart() {
  call("http://127.0.0.1:8080/cart", "get", null, function (data) {
    var values = {
      "context": "favorite-list-all",
      "listings": JSON.parse(data)
    }
    call("https://shop.rewe.de/basket/addAll", "post", values, function () {
      chrome.tabs.update({
        url: "https://shop.rewe.de/checkout/basket"
      });
    })
  })
}

function call(url, type, data, callback) {
  $.ajax({
    url: url,
    type: type,
    headers: {
      'content-type': 'application/json',
      'accept': '*/*',
    },
    data: JSON.stringify(data),
    success: function (response) {
      $("#status").text("success");
      console.log(response)
      if (callback) {
        callback(response)
      }
    },
    error: function (jqXHR, textStatus, errorThrown) {
      $("#status").text("error");
      console.log(textStatus + "\n" + errorThrown)
    }
  });
}