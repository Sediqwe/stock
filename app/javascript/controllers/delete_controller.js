import {  Controller } from "stimulus"

export default class extends Controller {
  static targets = ["heading"]
  connect() {
    console.log("hello from StimulusJS")
  }
  delete() {
    this.headingTarget.innerHTML = "Törölve"
    this.headingTarget.classList.remove('btn-danger')
    this.headingTarget.classList.add('btn-success')
  }
  get name(){
    return this.targets.find("name").value
  }
 
}