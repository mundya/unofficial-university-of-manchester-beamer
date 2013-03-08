Unofficial University of Manchester Beamer Theme
================================================
Provides a (very nice looking) Beamer theme that matches the official
University of Manchester PowerPoint Style.

"University of Manchester" and associated logos are copyright of the
University of Manchester -- please see http://www.brand.manchester.ac.uk

Installation
------------
[*A beginner's introduction, and complete install guide may be found here*](http://amundy.co.uk/blog/2013/03/06/installation-guide-for-the-unofficial-university-of-manchester-beamer-theme/)


To use the theme, ensure the following files are copied into somewhere like:
`~/texmf/tex/latex/beamer/themes` or `/usr/share/texmf/`...

- beamercolorthemeUniversityOfManchester.sty
- beamerfontthemeUniversityOfManchester.sty
- beamerinnerthemeUniversityOfManchester.sty
- beamerouterthemeUniversityOfManchester.sty
- beamerthemeUniversityOfManchester.sty
- TAB_allwhite.pdf
- TAB_col_white_background.pdf

Then run `texhash` as yourself.

### Font Installation ###
If you want to use the Cabin font (see below), you'll either need a recent TeXlive release, or will have to install it from CTAN:
- Cabin itself, http://www.ctan.org/pkg/cabin
- *AND* `ifluatex`, http://www.ctan.org/pkg/ifluatex

_Not for the faint hearted!_

Usage
-----
Once installed, you can use the theme as:

	\documentclass[t]{beamer}
	\usetheme[..options..]{UniversityOfManchester}

### Options
- `dark`
- `darktitle`
- `cabin` [Replaces the default font with Cabin, much nicer!]
- `framenumber`
- `totalframenumber` [Only works if `framenumber` is also set!]
- `compress` [Reduces the logo padding by half, this is a Bad Thing&trade;]

You can also use `plain` on a slide to hide the logo and gain some extra space.

The following colours are defined for your use:
- `uompurple`
- `uomyellow`
- `uomgrey`

A Fun Note
----------
Older versions of Beamer require you to put

	\begin{frame}
		\frametitle{...title...}
		% ...
	\end{frame}

Instead of the (much nicer) `\begin{frame}{...title...}` - be aware of this!

License
-------
Based partially upon http://nschloe.blogspot.de/2009/04/ua-beamer-theme_15.html,
This file may be distributed and/or modified
1. under the LaTeX Project Public License and/or
2. under the GNU Public License.

To Do:
------
- Frame option to make a selected frame dark (for, e.g., overview/content slides)
