# USB Docs

This is the git repository for [Ultraseedbox Docs](https://docs.usbx.me/) powered by [BookStack](https://www.bookstackapp.com/). This is an ongoing project and is being updated as new guides are synced to Bookstack. There maybe some missing guides and inconsistencies.

# How to contribute?

To contribute, just submit a PR here. Once approved, it will be uploaded to USB Docs.

## Formatting

Note that all of the articles in here and in the docs site uses mostly Markdown with some HTML, which are listed below.

## Images

Images needed to be in center.

```html
<p align="center"><img src="https://i.ibb.co/XS9Q7C3/22601782810-cbe3ede5f5-o-focus-none-original.jpg"></p>
```

## Callouts

Should you need to use callouts, refer below.

### Info

```html
<p class="callout info">Your info text here.</p>
```

### Success

```html
<p class="callout success">Your success text here.</p>
```

### Warning

```html
<p class="callout warning">Your warning text here.</p>
```

### Danger

```html
<p class="callout danger">Your danger text here.</p>
```

Add `<c></c>` before the callout for markdown within callout tags to work. Add a line before it.

```html
<c><p class="callout info">Your info text here [with some links](https://www.example.com/).</p></c>
```

[![](https://docs.usbx.me/uploads/images/gallery/2020-08/scaled-1680-/image-1596295413957.png)](https://docs.usbx.me/uploads/images/gallery/2020-08/image-1596295413957.png)

## replace.sh script

To automate formatting, you can use `replace.sh` to automatically replace the markdown formatting to what is listed above. It just needs the following:

* Callout tags should be in this format

```html
<callout {warning,info,danger,success}>Text here. You might need to <br> if you want</callout>
```

You can run the script by doing the following

```ssh
bash replace.sh /path/to/markdown.md
```

# License

This project is licensed under a [Creative Commons Attribution-ShareAlike 4.0
International License][cc-by-sa].

[![CC BY-SA 4.0][cc-by-sa-image]][cc-by-sa]

[cc-by-sa]: http://creativecommons.org/licenses/by-sa/4.0/
[cc-by-sa-image]: https://licensebuttons.net/l/by-sa/4.0/88x31.png
[cc-by-sa-shield]: https://img.shields.io/badge/License-CC%20BY--SA%204.0-lightgrey.svg