#' # Intro to Typesetting Math using LaTeX in R
#'
#' In this document, you'll learn some basics for how to typeset math using
#' LaTeX in an R script. With a little practice, you'll be able to easily add
#' beautiful, textbook-worthy math proofs to your documents knitted from R.
#'
#' The basics:
#'
#' - To get fancy formatting, use `#'` instead of `#` for commenting out lines.
#' - LaTeX needs to be wrapped in dollar signs: $y = mx + b$
#' - LaTeX formats greek letters, hats, bars, tildes, and so much more!
#'
#' # LaTeX in R Scripts
#'
#' Like I mentioned before, when you want your text to be compiled by LaTeX,
#' you'll wrap your math in dollar signs: `$`. For example: $y = mx + b$
#' (compile to html now to see how that section now has math formatting).
#'
#' You'll use single dollar signs for inline math, and double dollar signs
#' to put your equations centered on their own line. Export this document
#' to see how this is rendered by LaTeX: $$y = mx + b$$
#'
#' ## Question 1
#' Use LaTeX to write `a^2 + b^2 = c^2` as "inline" math and then centered on
#' its own line. Compile to html to check to make sure it's working.
#' Inline:
#' __
#'
#' Centered:
#' __
#'
#' # Special Characters
#'
#' How do you write a special character like the greek symbol beta in LaTeX?
#' This doesn't work: $beta$, because LaTeX thinks you're trying to signal
#' that the variables $b$, $e$, $t$, and $a$ are all multiplied.
#'
#' Instead, use `\`, the *escape character*, to tell LaTeX to switch into
#' a special reading mode and understand the whole group b, e, t, and a at
#' once instead of separately. That is, use: $\beta$.
#'
#' So greek letters in LaTeX should be escaped:
#'
#'   $$\alpha$$
#'   $$\beta$$
#'   $$\gamma$$
#'   $$\delta$$
#'   $$\epsilon$$
#'   $$\mu$$
#'   $$\nu$$
#'   $$\rho$$
#'
#' ## Question 2
#' Write the greek letters tau, chi, and sigma in LaTeX.
#'
#' __
#'
#' ## Subscripts and Superscripts
#'
#' Subscripts can be made with an underscore `_`: $y_i$. If you need to put
#' more than one character in the subscript, you can use curly brackets:
#'
#' $$y_{1i}$$
#'
#' Superscripts are made with a carrot `^`: $x^2$. Again, use curly brackets
#' if you have more than one character in the superscript:
#'
#' $$\beta_1^{OLS}$$
#'
#' ## Question 3
#' Write the simple regression equation in LaTeX using subscripts and greek
#' letters: yi = beta0 + beta1 xi + ui
#'
#' __
#'
#' ## Other useful LaTeX functions
#'
#' ### `\frac{}{}`
#'
#' To write a fraction in LaTeX, use `\frac{numerator}{denomenator}`.
#'
#' $$\frac{1}{2}$$
#'
#'
#' ### `\text{}`
#'
#' Latex doesn't recognize `\Cov` or `\Var` for covariance and variance.
#' Instead, use `\text{Cov}` and `\text{Var}` to get Cov and Var to display
#' as text.
#'
#' $$\frac{\text{Cov}(X, Y)}{\text{Var}(X)}$$
#'
#'
#' ### `\bar{}`
#'
#' We'll often put bars over variables to indicate we'd like to take the mean.
#'
#' $$\bar{x} = \frac{1}{n}\sum_{i = 1}^n x$$
#'
#' ## Question 4
#' Write this in LaTeX: z with a bar over it is the average of x and y:
#' zbar = (x + y) / 2
#' Make sure to use `\bar` and `\frac`.
#'
#' __
#'
#' ### `\hat{}`
#'
#' Similar to `\bar{}`, we'll usually indicate we're talking about the estimate
#' for a paramter instead of its true value by putting a hat over the symbol.
#' For example:
#'
#' Population model: $y_i = \beta_0 + \beta_1 x_i + u_i$
#'
#' Estimate: $y_i = \hat{\beta_0} + \hat{\beta_1} x_i + \hat{u_i}$
#'
#' # Alignment
#'
#' When you're writing a proof, you'll often have multiple lines of math and
#' it can be nice to align the equals signs in those lines. To do this, you can
#' skip the dollar signs in favor of using `\begin{align}` at the beginning of
#' the chunk, `\end{align}` at the end, and then instead of writing `=`, use
#' `&=`. The `&` tells LaTeX where you want the lines of math to align.
#'
#' \begin{align}
#' \frac{2x^2 + 6x}{4x} &= \frac{2x(x + 3)}{4x} \\
#' &= \frac{2x}{4x} \cdot \frac{x + 3}{1} \\
#' &= \frac{1}{2} \cdot (x + 3) \\
#' &= \frac{1}{2}x + \frac{3}{2}
#' \end{align}
#'
#' That's it! If you find yourself wondering about how to do anything else in
#' LaTeX, a quick google search will usually help a lot.
