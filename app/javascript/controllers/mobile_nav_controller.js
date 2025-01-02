import { Controller } from "@hotwired/stimulus";

export default class MobilNavController extends Controller {
  static targets = ["menu", "hiddenIcon", "shownIcon"];

  toggle(_event) {
    if (this.menuTarget.classList.contains("hidden")) {
      this.menuTarget.classList.remove("hidden");
      this.menuTarget.classList.add("block");
      this.shownIconTarget.classList.remove("hidden");
      this.hiddenIconTarget.classList.add("hidden");
    } else {
      this.menuTarget.classList.add("hidden");
      this.menuTarget.classList.remove("block");
      this.hiddenIconTarget.classList.remove("hidden");
      this.shownIconTarget.classList.add("hidden");
    }
  }
}
