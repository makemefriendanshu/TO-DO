import { createPopper } from '@popperjs/core';
export {Tooltip};


// A class to manage the tooltip lifecycle.
class Tooltip {
  showEvents = ['mouseenter', 'focus'];
  hideEvents = ['mouseleave', 'blur'];
  $parent;
  $tooltip;
  popperInstance;

  constructor($tooltip) {
    this.$tooltip = $tooltip;
    this.$parent = $tooltip.parentElement;
    this.popperInstance = createPopper(this.$parent, $tooltip, {
      modifiers: [
        {
          name: 'offset',
          options: {
            offset: [0, -8],
          },
        },
      ],
    });
    this.destructors = [];

    // For each show event, add an event listener on the parent element
    //   and store a destructor to call removeEventListener
    //   when the tooltip is destroyed.
    this.showEvents.forEach((event) => {
      const callback = this.show.bind(this);
      this.$parent.addEventListener(event, callback);
      this.destructors.push(() =>
        this.$parent.removeEventListener(event, callback)
      );
    });

    // For each hide event, add an event listener on the parent element
    //   and store a destructor to call removeEventListener
    //   when the tooltip is destroyed.
    this.hideEvents.forEach((event) => {
      const callback = this.hide.bind(this);
      this.$parent.addEventListener(event, callback);
      this.destructors.push(() =>
        this.$parent.removeEventListener(event, callback)
      );
    });
  }

  // The show method adds the data-show attribute to the tooltip element,
  //   which makes it visible (see CSS).
  show() {
    this.$tooltip.setAttribute('data-show', '');
    this.update();
  }

  // Update the popper instance so the tooltip position is recalculated.
  update() {
    this.popperInstance?.update();
  }

  // The hide method removes the data-show attribute from the tooltip element,
  //   which makes it invisible (see CSS).
  hide() {
    this.$tooltip.removeAttribute('data-show');
  }

  // The destroy method removes all event listeners
  //   and destroys the popper instance.
  destroy() {
    this.destructors.forEach((destructor) => destructor());
    this.popperInstance?.destroy();
  }
}
