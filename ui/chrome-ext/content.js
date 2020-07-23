
$(function () {
    var productInfo = {
        "id": $(".pdr-MesoInclude meso-data").attr("data-listingid"),
        "product_id": "tooth_paste",
        "name": $(".pdr-QuickInfo__heading").text(),
        "price": parseFloat($(".pdr-PriceInformation__Price").text().replace(',', '.')) * 100,
        "quantity": 1,
        "link": "https://shop.rewe.de/p/" + $(".pdr-MesoInclude meso-data").attr("data-productid"),
        "image": $("a.pdr-product-details-image-link img").attr("src")
    }

    chrome.runtime.sendMessage({
        operation: "product-info",
        data: productInfo
    });
});


