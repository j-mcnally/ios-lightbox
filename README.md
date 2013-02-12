ios-lightbox
============

An iOS implementation of a basic lightbox for images.

<img src="https://dl.dropbox.com/s/0du90jlao0hho86/Screen%20Shot%202013-02-12%20at%2011.06.15%20AM.png" />

Usage
=====

```
ImageLightbox *lightbox;
lightbox = [[ImageLightbox alloc] init]; 
[lightBox showImage:mediaPath];
```

Notes
=====

I looked around and couldnt find a project like this prebaked, so I threw one together. Hope someone finds it useful,
this kind of generic functionality shouldnt have to be rewritten for anyone. Atleast it provides a simple template.
This probably doesn't need to subclass UIViewController, but eventually i may need to refactor it to use the view controllers'
view to handle orientation. I will update it as nessiscary to cover more scenarios, just sharing something useful from one
of our projects.



