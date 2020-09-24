import { Controller } from 'stimulus';

export default class extends Controller {
  static targets = [ 'container', 'spinner', 'form', 'query', 'paginationLink' ];

  renderRecipes(event) {
    const paginationLink = this.paginationLinkTargets.find(link => link === event.currentTarget);
    let page = 'page=1';
    if (paginationLink) {
      page = paginationLink.href.split('?')[1];
    } else if (window.location.search.match(/page=\d+/)[0]) {
      page = window.location.search.match(/page=\d+/)[0];
    }
    this.spinnerTarget.classList.remove('d-none');
    this.containerTarget.innerHTML = '';
    const url = this.hasQueryTarget && this.queryTarget.value ? `${this.data.get('url')}?query=${this.queryTarget.value}&${page}` : `${this.data.get('url')}?${page}`;
    const redirectUrl = this.hasQueryTarget && this.queryTarget.value ? `${window.location.pathname}?query=${this.queryTarget.value}&${page}` : `${window.location.pathname}?${page}`;
    fetch(url)
      .then(response => response.json())
      .then((data) => {
        this.spinnerTarget.classList.add('d-none');
        this.containerTarget.innerHTML = data.recipes;
        history.pushState({
          id: 'recipe'
        }, 'Recipes To Scrape', redirectUrl)
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
