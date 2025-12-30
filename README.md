# edgelight-for-linux (Waybar)


A simple edge light on screen for low-light video calls, inspired by Apple’s Edge Light -- built using Waybar.

It puts four thin bars around your screen (top, bottom, left, right), lighting up your face from the screen itself. Just like a ring light, but virtual.

Should work with any distro that supports waybar. (Tested with hyprland ☑️)

---

## What is this?

This project uses Waybar to draw four bars around the edges of the screen.
They're passthrough-able.
There’s a brightness control so you can tune how strong you want the light to be.

---

## How it works

- Four Waybar instances are launched:
  - top
  - bottom
  - left
  - right
- CSS to style them a bit
- A small script controls brightness by changing CSS variables

It’s basically a fake ring light made out of simple waybar UI.

---

## File Tree

edgelight-for-linux
├── configs
│   ├── top.jsonc
│   ├── bottom.jsonc
│   ├── right.jsonc
│   ├── left.jsonc
│   └── shared.css
│   
├── launch.sh
├── scripts
│   └── brightness_slider.sh
└── README.md

---

## Requirements

- Waybar
- bash

---

## How to run

Clone the repo and run:

```bash
git clone https://github.com/Atornous12/edgelight-for-linux.git
cd edgelight-for-linux
./launch.sh
```

---

## Feedback & contributions

This project is still rough around the edges.
If you have ideas, bug reports, or improvements, feel free to open an issue or a pull request.  
I’m happy to learn and improve it with help from others.

---

## License

MIT