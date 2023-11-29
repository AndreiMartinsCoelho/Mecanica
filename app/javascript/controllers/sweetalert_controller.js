import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  connect() {
    console.log("Conectou!")
  }

  showAlert(event) {
    event.preventDefault();
    event.stopImmediatePropagation();

    const overlay = document.createElement("div");
    overlay.style.position = "fixed";
    overlay.style.top = "0";
    overlay.style.left = "0";
    overlay.style.width = "100%";
    overlay.style.height = "100%";
    overlay.style.backgroundColor = "rgba(0, 0, 0, 0.5)";
    overlay.style.zIndex = "9999";

    const confirmationBox = document.createElement("div");
    confirmationBox.classList.add("confirmation-box"); //class
    confirmationBox.style.position = "absolute";
    confirmationBox.style.top = "50%";
    confirmationBox.style.left = "50%";
    confirmationBox.style.transform = "translate(-50%, -50%)";
    confirmationBox.style.backgroundColor = "#fff";
    confirmationBox.style.padding = "20px";
    confirmationBox.style.borderRadius = "10px";
    confirmationBox.style.boxShadow = "0 0 10px rgba(0, 0, 0, 0.3)";

    const message = document.createElement("p");
    message.textContent = "Deseja cancelar mesmo?";

    const buttonContainer = document.createElement("div");
    buttonContainer.classList.add("button-container"); //class
    buttonContainer.style.display = "flex";
    buttonContainer.style.justifyContent = "space-between";
    buttonContainer.style.marginTop = "10px";

    const yesButton = document.createElement("button");
    yesButton.textContent = "Sim";
    yesButton.classList.add("btn-yes"); //class
    yesButton.addEventListener("click", () => {
      event.target.closest("form").submit();
      overlay.remove();
    });

    const noButton = document.createElement("button");
    noButton.textContent = "Não";
    noButton.classList.add("btn-no"); //class
    noButton.addEventListener("click", () => {
      overlay.remove();
      this.renderConfirmationBox();
    });

    buttonContainer.appendChild(yesButton);
    buttonContainer.appendChild(noButton);

    confirmationBox.appendChild(message);
    confirmationBox.appendChild(buttonContainer); // adiciona a div dos botões
    overlay.appendChild(confirmationBox);
    document.body.appendChild(overlay);
  }
}
