---
title: The Tower of Hanoi
date: 2022-12-21
mathjax: true
---

Every couple of years I like to pull my copy of Concrete Mathematics[^1] off
the shelf and spend some time refreshing my computer science skills
(particularly algorithm analysis). The first example in the book is the fairly
well-known Tower of Hanoi puzzle. It's a fun little puzzle that feels
incredibly satisfying to solve; I still remember coding a solver in college as
a homework assignment. It's a great problem for introducing students to
recursion, time complexity, and mathematical induction.

While writing a Towers of Hanoi solver is fun, Concrete Mathematics uses it as
an example of solving a recurrence. At the end of the puzzle's section, the
authors wave their hands with the statement "It doesn't take genius (sic) to
discover that the solution to *this* recurrence is just... Even a computer
could discover this." Well, I am neither a genius nor a computer so it's not so
easy for me to just wave my own hand and say "but of course". I need to see the
work. Unfortunately, my notebooks from when I solved these types of equations
in school are buried somewhere and I'm not willing to spend time finding them.
It also seems like the Internet is filled with geniuses and computers because I
wasn't able to find any solutions that didn't also involve a decent amount of
hand-waving. I guess I need to solve it for myself.

Thankfully, it didn't take me too long to find the complete solution. I don't
feel quite so dumb now. However, I know that in a couple years time, when I
decide to crack open Concrete Mathematics again, I'll once again find myself at
square one and feeling dumb. So to prevent that from happening, here is my
attempt to explain the complete solution to the Tower of Hanoi recurrence.

# The Solution

To start, let $T_n$ be the optimal number of moves required to solve for $n$
disks. Intuitively, the following base cases can be quickly identified:

<div>
$$
\begin{align*}
T_0 &= 0\\
T_1 &= 1\\
T_2 &= 3\\
T_n &= 2T_{n-1} + 1\text{, for $n \gt 0$.}
\end{align*}
$$
</div>

In the above, the base cases are used to build a general form for $T_n$.
However, the problem with this general form is it requires the solution for
$T_{n-1}$ to be known first. This makes computation of large values of $n$
slow. It would be better if it was possible to find $T_n$ without needing any
prior knowledge. This can be done as follows:

<div>
$$
\begin{align*}
T_n &= 2T_{n-1} + 1\\
T_n + 1 &= 2T_{n-1} + 2\\
&= 2 \times (T_{n-1} + 1)
\end{align*}
$$
</div>

Both sides can be simplified by letting $U_n = T_n + 1$:

<div>
$$
\begin{align*}
U_0 &= 1\\
U_n &= 2 \times U_{n-1}\\
&= 2 \times 2 \times U_{n-2}\\
&= 2^2 \times U_{n-2}\\
&= 2^k \times U_{n-k}
\end{align*}
$$
</div>

Above, $U_{n-1}$ was expanded using $U_{n-1} = 2 \times U_{n-2}$. Using some
intuition, an exponential pattern appears that is can be parameterized as $k$.
The $n-k$ index can be solved to utilize the $U_0$ base case ($n - k = 0$).
This results in $k=n$ which can be substituted into the equation:

<div>
$$
\begin{align*}
U_n &= 2^n \times U_{n-n}\\
&= 2^n \times U_0\\
&= 2^n \times 1\\
&= 2^n
\end{align*}
$$
</div>

Finally, the $U_n = T_n + 1$ replacement can be reversed:

<div>
$$
\begin{align*}
T_n + 1 &= 2^n\\
T_n &= 2^n - 1\text{, for $n \gt 0$.}
\end{align*}
$$
</div>

This is the exact solution found in Concrete Mathematics. The validity of this
result can be quickly checked using the initial $T_0$, $T_1$, and $T_2$ base
cases. Validation for $n > 2$ cases require additional computation.

# Conclusion

Well, there we have it. Hopefully future me will remember that I wrote this and
not have to solve it from scratch again. Some fun facts, for 8 disks (the
number of disks in the original Tower of Hanoi problem) an optimal solution
requires 255 moves. Furthermore, solving the 64 disks of the Tower of Brahma
(the mythical tower upon which the Tower of Hanoi is based) requires
18,446,744,073,709,551,615 moves. Which means that if you made 1 move every
second, it would take you 584.9 billion years[^2] to solve the puzzle. Guess it's
time to start moving some disks. Better late than never.

[^1]: https://en.wikipedia.org/wiki/Concrete_Mathematics
[^2]: According to Wolfram|Alpha; I have not independently verified this number.
