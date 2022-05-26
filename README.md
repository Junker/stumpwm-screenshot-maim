# StumpWM Screenshot-maim

Screenshot module for StumpWM

## Requirements

- [maim](https://github.com/naelstrof/maim) CLI screenshot tool
- [xdotool](https://github.com/jordansissel/xdotool) CLI Xorg automation tool

## Installation

```bash
cd ~/.stumpwm.d/modules/
git clone https://github.com/Junker/stumpwm-screenshot-maim screenshot-maim
```

```lisp
(stumpwm:add-to-load-path "~/.stumpwm.d/modules/screenshot-maim")
(load-module "screenshot-maim")
```

## Usage

```lisp
  (define-key *top-map* (kbd "Print") "screenshot")
  (define-key *top-map* (kbd "C-Print") "screenshot-area")
  (define-key *top-map* (kbd "M-Print") "screenshot-window")
```

### Parameters

- screenshot-maim:\*path\* - path to save screens (default: "/var/tmp/")
- screenshot-maim:\*ask-filename\* - show input prompt with filename (default: t)
- screenshot-maim:\*format\* - file format, if \*ask-filename\* is nil.
(default: "png". Currently supports 'png', 'jpg', 'bmp' and 'webp')
- screenshot-maim:\*quality\* - An integer from 1 to 10 that determines the
compression quality. (default: 10)
- screenshot-maim:\*delay\* - time in seconds to wait before taking a
screenshot. (default: 0.2)
- screenshot-maim:\*hide-cursor\* - By  default maim super-imposes the cursor
onto the image, you can disable that behavior with this flag. (default: nil)
