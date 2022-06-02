window.addEventListener('load', () => {

  const inputPrice = document.getElementById("item-price");

  inputPrice.addEventListener('keyup',() => {
    const inputValue = inputPrice.value;

    const addTax = document.getElementById("add-tax-price");
    addTax.innerHTML = Math.floor(inputValue * 0.1);

    const addProfit = document.getElementById("profit");
    addProfit.innerHTML = Math.floor(inputValue - addTax.innerHTML);

  });

});

