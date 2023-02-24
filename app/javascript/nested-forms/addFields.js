class addFields {
    constructor() {
      console.log("some text1")
      this.links = document.querySelectorAll(".add_row");
      this.iterateLinks();
    }
  
    iterateLinks() {
      console.log("some text2")
      if (this.links.length === 0) return;
      this.links.forEach((link) => {
        link.addEventListener("click", (e) => {
          this.handleClick(link, e);
        });
      });
    }
  
    handleClick(link, e) {
      console.log("some text3")
      if (!link || !e) return;
      e.preventDefault();
      let time = new Date().getTime();
      let linkId = link.dataset.id;
      let regexp = linkId ? new RegExp(linkId, "g") : null;
      let newFields = regexp ? link.dataset.fields.replace(regexp, time) : null;
      newFields ? link.insertAdjacentHTML("beforebegin", newFields) : null;
    }
  }
  
  window.addEventListener("turbolinks:load", () => new addFields());