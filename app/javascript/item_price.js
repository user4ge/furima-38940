function price () {
  const priceInput = document.getElementById('item-price');
  priceInput.addEventListener('input', () => {
    const inputValue = priceInput.value;
    const addTaxDom = document.getElementById("add-tax-price");
    const addProfitDom = document.getElementById("profit")
    const calcTax = Math.floor( priceInput.value * 0.1 )
    addTaxDom.innerHTML = calcTax;
    addProfitDom.innerHTML = Math.floor( priceInput.value - calcTax );
  });
};
window.addEventListener('load', price);
