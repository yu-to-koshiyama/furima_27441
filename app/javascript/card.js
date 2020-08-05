const pay = () => {
  Payjp.setPublicKey(process.env.PAYJP_PUBLIC_KEY);
  // console.log(process.env.PAYJP_PUBLIC_KEY);
  console.log("test");
  const form = document.getElementById("charge-form");
  form.addEventListener("submit", (e) => {
    e.preventDefault();
    // debugger;
    const formResult = document.getElementById("charge-form");
    const formData = new FormData(formResult);

    const card = {
      number: formData.get("purchase_dealing[number]"),
      cvc: formData.get("purchase_dealing[cvc]"),
      exp_month: formData.get("purchase_dealing[exp_month]"),
      exp_year: `20${formData.get("purchase_dealing[exp_year]")}`,
    };

    Payjp.createToken(card, (status, response) => {
      if (status === 200) {
        const token = response.id;
        const renderDom = document.getElementById("charge-form");
        const tokenObj = `<input value=${token} type="hidden" name='purchase_dealing[token]'>`;
        renderDom.insertAdjacentHTML("beforeend", tokenObj);
        // debugger;
        document.getElementById("number").removeAttribute("name");
        document.getElementById("cvc").removeAttribute("name");
        document.getElementById("exp_month").removeAttribute("name");
        document.getElementById("exp_year").removeAttribute("name");
        document.getElementById("charge-form").submit();
        document.getElementById("charge-form").reset();
        alert("success");
      } else {
        alert("Pay.jp送信に失敗しました");
        //document.getElementById("charge-form").submit();
      }
    });
  });
};

window.addEventListener("load", pay);
