# USB Docs

This is the git repository for [Ultraseedbox Docs](https://docs.usbx.me/) powered by [BookStack](https://www.bookstackapp.com/).

This is an ongoing project and is updated as new guides are synced to Bookstack. There maybe some missing guides and inconsistencies.

# How to contribute?

To contribute, just submit a PR here. Once approved, it will be uploaded to USB Docs.

## Formatting

Note that all of the articles in here and in the docs site uses Markdown but it has certain formatting rules followed.

## Images

Images needed to be in center.

```
<p align="center">
<img src="https://i.ibb.co/XS9Q7C3/22601782810-cbe3ede5f5-o-focus-none-original.jpg">
</p>
```
## Callouts

Should you need to use callouts, refer to the following 

### Info

```
<p class="callout info">Your info text here.</p>
```

### Success

```
<p class="callout success">Your success text here.</p>
```

### Warning

```
<p class="callout warning">Your warning text here.</p>
```

### Danger

```
<p class="callout danger">Your danger text here.</p>
```

Add `<c></c>` before the callout for markdown within callout to work.

```
<c><p class="callout info">Your info text here [with some links](https://www.example.com/).</p></c>
```

## replace.sh script

* To automate the formatting, you can use `replace.sh` to automatically replace the markdown formatting to what iis listed above. It just needs the following:
  * Images do not have comments in it (`![](image-link-here`))
  * Callout tags should be in this format

<callout {warning,info,danger,success}>Text here. You might need to <br> if you want</callout>

* You can use the script by doing `./replace.sh Path/to/markdown.md`

# License

This work is licensed under a [Creative Commons Attribution-ShareAlike 4.0
International License][cc-by-sa].

[![CC BY-SA 4.0][cc-by-sa-image]][cc-by-sa]

[cc-by-sa]: http://creativecommons.org/licenses/by-sa/4.0/
[cc-by-sa-image]: https://licensebuttons.net/l/by-sa/4.0/88x31.png
[cc-by-sa-shield]: https://img.shields.io/badge/License-CC%20BY--SA%204.0-lightgrey.svg