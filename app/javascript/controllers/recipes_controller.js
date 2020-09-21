import { Controller } from "stimulus"

export default class extends Controller {
  renderRecipes() {
    fetch(this.data.get('url'))
      .then(response => response.json())
      .then((data) => {
        this.element.innerHTML = data.recipes;
      });
  }

  renderRecipe() {
    fetch(this.data.get('url'))
      .then(response => response.json())
      .then((data) => {
        this.element.innerHTML = data.recipe;
      });
  }
}
