import {  Controller } from "stimulus"

export default class extends Controller {
  static targets = ["heading"]

  done(event) {
    event.preventDefault();
    let id = this.element.getAttribute("data-done-id")

    console.log(id)

    this.headingTarget.innerHTML = "" + id
    this.headingTarget.classList.remove('btn-success', 'text-light')
    this.headingTarget.classList.add('text-dark', 'btn-warning')
  }

  notdone(event) {
    event.preventDefault();

    this.headingTarget.innerHTML = "Kész" + id
    this.headingTarget.classList.add('text-light', 'btn-success')
    this.headingTarget.classList.remove('text-dark', 'btn-warning')
  }

  status_class(success = false) {
    let id = this.element.getAttribute("data-done-id")
    console.log(id)
    this.headingTarget.innerHTML = success ? "Kész" : "Nincs kész";

    this.headingTarget.classList.add('text-light', 'btn-success')
    this.headingTarget.classList.remove('text-dark', 'btn-warning')
  }
}
