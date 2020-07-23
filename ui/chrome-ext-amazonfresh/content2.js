
$(function () {
  var rawInfo = $('[data-fresh-add-to-cart]').attr("data-fresh-add-to-cart");
  var info = $.parseJSON(rawInfo)

  var productInfo = {
    asin: info.asin,
    offerID: info.offerListingID,
    name: info.title,
    imageURL: $("#imgTagWrapperId img").attr("src"),
  }

  chrome.runtime.sendMessage({
    operation: "product-info",
    data: productInfo
  });
});

