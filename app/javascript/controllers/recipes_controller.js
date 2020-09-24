import { Controller } from 'stimulus';

export default class extends Controller {
  static targets = [ 'container', 'spinner', 'form', 'query', 'paginationLink', 'recipe', 'title' ];

  renderRecipes(event) {
    const paginationLink = this.paginationLinkTargets.find(link => link === event.currentTarget);
    let page = '';
    if (this.hasQueryTarget && this.queryTarget.value && event.currentTarget == this.formTarget) {
      page = 'page=1';
    }
    else if (paginationLink) {
      page = paginationLink.href.split('?')[1];
    } else if (window.location.search.match(/page=\d+/)) {
      page = window.location.search.match(/page=\d+/)[0];
    } else {
      page = 'page=1';
    }
    this.spinnerTarget.classList.remove('d-none');
    this.containerTarget.innerHTML = '';
    this.showRecipe(false);
    const url = this.hasQueryTarget && this.queryTarget.value ? `${this.data.get('url')}?search[query]=${this.queryTarget.value}&${page}` : `${this.data.get('url')}?${page}`;
    fetch(url)
      .then(response => response.json())
      .then((data) => {
        if (+page.match(/\d+/)[0] > data.last_page) page = 'page=1';
        const redirectUrl = this.hasQueryTarget && this.queryTarget.value ? `${window.location.pathname}?search[query]=${this.queryTarget.value}&${page}` : `${window.location.pathname}?${page}`;
        this.spinnerTarget.classList.add('d-none');
        this.containerTarget.innerHTML = data.recipes;
        history.pushState({
          id: 'recipe'
        }, 'Recipes To Scrape', redirectUrl)
      });
  }

  renderRecipe(event) {
    this.showRecipes(false);
    fetch(event.currentTarget?.dataset?.url || `/api/v1/recipes/${window.location.pathname.match(/\d+/)[0]}`)
      .then(response => response.json())
      .then((data) => {
        this.showRecipe(true, data.recipe);
        this.titleTarget.classList.add('d-none');
        this.spinnerTarget.classList.add('d-none');
        if (this.data.get('history')) {
          history.pushState({
            id: 'recipe',
          }, `${data.name} - Recipes To Scrape`, `/recipes/${data.id}/advanced`);
        }
      });
  }

  showRecipe(show, html = null) {
    if (show) {
      this.recipeTarget.classList.remove('d-none');
      this.recipeTarget.innerHTML = html;
    } else {
      this.recipeTarget.classList.add('d-none');
      this.recipeTarget.innerHTML = '';
    }
  }

  showRecipes(show, html = null) {
    if (show) {
      if (this.hasFormTarget) this.formTarget.classList.remove('d-none');
      if (this.hasContainerTarget) {
        this.containerTarget.classList.remove('d-none');
        this.containerTarget.innerHTML = html;
      }
      if (this.hasTitleTarget) {
        this.titleTarget.classList.remove('d-none');
        this.titleTarget.innerHTML = this.titleTarget.dataset.title;
      }
    } else {
      if (this.hasFormTarget) this.formTarget.classList.add('d-none');
      if (this.hasContainerTarget) {
        this.containerTarget.classList.add('d-none');
        this.containerTarget.innerHTML = '';
      }
    }
  }
}
