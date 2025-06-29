window.addEventListener('turbo:load', () => {
  const priceInput = document.getElementById("item-price");
  if (!priceInput) return; // 新規出品ページだけで動くように

  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;

    const addTaxDom = document.getElementById("add-tax-price");
    const profitDom = document.getElementById("profit");

    // 販売手数料 = 価格の10% (小数点切り捨て)
    const fee = Math.floor(inputValue * 0.1);

    // 販売利益 = 価格 - 手数料 (小数点切り捨て)
    const profit = Math.floor(inputValue - fee);

    addTaxDom.innerHTML = fee;
    profitDom.innerHTML = profit;
  });
});

