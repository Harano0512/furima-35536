function priceinput () {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    const addTaxPrice = Math.floor(inputValue * 0.1);
    const profit = Math.floor(inputValue * 0.9);
    const addTaxDom = document.getElementById("add-tax-price")
    const profitDom = document.getElementById("profit")
    addTaxDom.innerHTML = `${addTaxPrice}`
    profitDom.innerHTML = `${profit}`
  })
}

window.addEventListener('load', priceinput)