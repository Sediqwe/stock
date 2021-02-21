import {  Controller } from "stimulus"

export default class extends Controller {
  static targets = ["heading"]
  connect() {
    console.log("hello from StimulusJS")
  }
  done() {
    
    this.headingTarget.innerHTML = "Nincs kész"
    this.headingTarget.classList.remove('btn-success')
    this.headingTarget.classList.remove('text-light')
    this.headingTarget.classList.add('btn-warning')
    this.headingTarget.classList.add('text-dark')
  }
  notdone() {
    this.headingTarget.innerHTML = "Kész"
    this.headingTarget.classList.add('btn-success')
    this.headingTarget.classList.add('text-light')
    this.headingTarget.classList.remove('btn-warning')
    this.headingTarget.classList.remove('text-dark')
  }  
}