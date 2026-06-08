# `caselabbetse` Container

Servar caselabbet.se. Denna container innehåller en väldigt basic Caddy-server, som servar innehåll genererat från Astro-projektet under [`./site/`](./site).


The website is written in plain HTML/CSS/JS, with templating and media optimisation being handled by Astro which generates the resulting static website. To make changes, begin by cloning the entire caselabbet-docker repo.

## Updating the site
Assuming you have node and npm installed, open caselabbetse/site in a terminal. Run
- `npm i` to install and setup dependencies
- `npm run astro dev` to start the development server & do local preview. It will print the address to the dev server, usually `localhost:4321`.

Once you've made your modifications, just commit and push to the repo and it'll build the site and push the images automatically.

## Project structure 
There’s two main folders: `public` and `src`. 
- `public` contains assets that should be included without modification, such as data files, PDFs and fonts. 
- `src` holds all the content, templates, styles and more used to generate the final site.

`src` further contains:
- `pages` is the main content of the site. These files become paths you can visit like `/board` or `/components`.
- `assets` holds primarily images, which are referenced by the pages. Images here will be processed and optimised to be fast, light and look good on the web. If you want your images untouched, you should put them in `public`.
- `components` are reusable features like cards, headers, buttons and text layouts. Be careful touching these, some are fundamental to the layout of the site.
- `data` contains data files for procedurally generating repetitive content. These are referenced by pages, which generate and style content based on this data.
- `styles` contain global CSS stylesheets applied to all pages. 
- `layouts` is unused.

Styling is generally scoped to the component or page, so what you do in one .astro file does not affect any of the others.

## Basic page creation
A page should generally be wrapped in the `<Base title="Name of the page">` component, which handles page setup, headers and global styling. The most useful components are then are 
- `<PaddedColumn>` for adding spacing around content
- `<TextColumn>` for limiting a text column to a readable width
- `<Centered>` for centering eg. images and titles
- `<Centered text_align="left">` for centering eg. a text column without center aligning the contained text lines
