import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["item", "button"]

  set(event) {
    const filter = event.currentTarget.dataset.filter

    // สลับคลาส active ของปุ่ม
    this.buttonTargets.forEach(btn => btn.classList.remove("active"))
    event.currentTarget.classList.add("active")

    // กรองการแสดงผลรายการ
    this.itemTargets.forEach(item => {
      if (filter === "all" || item.dataset.status === filter) {
        item.style.display = ""
      } else {
        item.style.display = "none"
      }
    })
  }
}