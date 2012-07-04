wowlinks
========

This awful gem generates links to Wowhead with quality colours and texture images. Works best with CSS like:

```css
.wowlinks {
  background: no-repeat 1px 2px;
  padding: 0 0 0 20px;

  &.error {
    color: #c41f3b;
  }

  &.spell {
    color: #ffcd55;
  }

  &.poor {
    color: #9d9d9d;
  }

  &.common {
    color: white;
  }

  &.uncommon {
    color: #1eff00;
  }

  &.rare {
    color: #0080ff;
  }

  &.epic {
    color: #b048f8;
  }

  &.legendary {
    color: #ff8000;
  }

  &.artifact, &.heirloom {
    color: #e6cc80;
  }

  &.error {
    color: red;
  }

  &:hover {
    color: white !important;
  }
}
```
