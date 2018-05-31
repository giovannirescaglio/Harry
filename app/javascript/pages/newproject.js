const new_email = document.getElementById("email-input");
const add_btn = document.getElementById("add-email");
const emails_list = document.getElementById("emails-list");
const emails_hidden = document.getElementById("hidden-emails");

add_btn.addEventListener("click", function(){
  emails_list.insertAdjacentHTML("beforeend", `<li>${new_email.value}</li>`);
  emails_hidden.insertAdjacentHTML("beforeend", `<input type="text" name=emails[] value=${new_email.value} class="hidden">`);
  new_email.value = "";
});
