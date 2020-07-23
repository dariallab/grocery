const token = "cf9707cd-c65d-44c9-bf76-d143c9a518e4"
const docID = "uPCQIEOvuT"
const tableID = "grid-lOUF85T2Sd"

$("#fill-cart").click(function () {
  $("#status").text("");
  chrome.tabs.executeScript(null, { file: "jquery-3.3.1.min.js" }, function () {
    chrome.tabs.executeScript(null, { file: "content.js" });
  });
});

$("#add-product").click(function () {
  $("#status").text("");
  chrome.tabs.executeScript(null, { file: "jquery-3.3.1.min.js" }, function () {
    chrome.tabs.executeScript(null, { file: "content2.js" });
  });
});

chrome.runtime.onMessage.addListener(function (request, sender) {
  if (request.operation == "user-info") {
    fillCart();
  }
});

chrome.runtime.onMessage.addListener(function (request, sender) {
  console.log(request.data)
  if (request.operation == "product-info") {
    var data = {
      "rows": [{
        "cells": [
          { "column": "c-wnAwEBKzhq", "value": request.data.asin },
          { "column": "c-myOzYqX3p8", "value": request.data.offerID },
          { "column": "c-M5y8xC9Vqu", "value": request.data.imageURL },
          { "column": "c-d1bxbdwH0z", "value": request.data.name }
        ]
      }],
      "keyColumns": [
        "c-wnAwEBKzhq",
        "c-myOzYqX3p8"
      ]
    }
    call("https://coda.io/apis/v1beta1/docs/" + docID + "/tables/" + tableID + "/rows", "post", data)
  }
});

function fillCart() {
  var rawData = [
    { amount: 1, quantity: 0, asin: 'B01DZXAIGY', offerId: 'WPjiISeSfkqDn7ZWj%2F3xNel9KYwMCAY8YNjl6zeKyggw0%2B4s9I69WPaG2lpR%2BCvBguYcNs%2Bp7rE%2BZlcglwAfswcc4HP4Qdt2N7Wa153%2BS5wI5WjOkkPrJk0gEdMbwyd53qhBCrlShvg%3D' },
    { amount: 1, quantity: 0, asin: 'B00LUIF0R4', offerId: 'WPjiISeSfko2wB%2BqZL%2FWadaI71qplToQjY9x6gbgffTstpnpwQgCwA%2BHqv8enw54toMTIac1AHFfp%2BJNnrbbc9slvarhg85QFVK4w8Laz8T1cBT7uDAHoS4fxvFzKLJBHNTNu%2FsqxcI%3D' },
  ]

  var i;
  var data = "clientAtfcRefTag=fs_dsk_pp_qa_atc_cs_qa&shouldEmitBuyBoxMetrics=true";
  for (i = 0; i < rawData.length; i++) {
    data += "&nm" + i + "=" + rawData[i].amount +
      "&no" + i + "=" + rawData[i].offerId +
      "&nq" + i + "=" + rawData[i].quantity +
      "&na" + i + "=" + rawData[i].asin +
      "&newOffers[" + i + "][amount]" + "=" + rawData[i].amount +
      "&newOffers[" + i + "][quantity]" + "=" + rawData[i].quantity +
      "&newOffers[" + i + "][offerId]" + "=" + rawData[i].offerId +
      "&newOffers[" + i + "][asin]" + "=" + rawData[i].asin;
  }
  $.post("https://www.amazon.de/afx/cartconflicts/resolve/substitute/accept?mockLcr&mockLcrIssues&mockFail&ref=afx_ccp_atfc_c2c",
    encodeURI(data),
    function () {
      chrome.tabs.update({
        url: "https://www.amazon.de/gp/cart/view.html?ref_=nav_cart"
      });
    });

  // call("http://127.0.0.1:8080/cart", "get", null, function (data) {
  // call("https://www.amazon.de/afx/cartconflicts/resolve/substitute/accept?mockLcr&mockLcrIssues&mockFail&ref=afx_ccp_atfc_c2c", "post", values, function () {
  // })
  // })
}

function call(url, type, data, callback) {
  $.ajax({
    url: url,
    type: type,
    headers: {
      'authorization': 'Bearer ' + token,
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