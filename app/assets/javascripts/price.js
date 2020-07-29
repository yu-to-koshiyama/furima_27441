$(function () {
  $(".price-input").on("keyup", function () {
    if (
      $(this)
        .val()
        .match(/(?=.*?[\d])/)
    ) {
      $("#add-tax-price").text(parseInt($(this).val() * 0.1));
      $("#profit").text(parseInt($(this).val() - $(this).val() * 0.1));
    } else {
      $("#add-tax-price").text("半角数字のみ入力可能");
      $("#profit").text("半角数字のみ入力可能");
    }
  });
});
