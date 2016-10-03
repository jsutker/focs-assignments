# FOCS Homework 9, for Day 10

You may edit your answers into this file, or add a separate file in the same directory.

If you add a separate file, please include the following at the top:

```
Student Name: Joe Sutker
Check one:
[ ] I completed this assignment without assistance or external resources.
[X] I completed this assignment with assistance from Wikipedia (to remember what Context Free Grammar referred to
   and how to format a Context Free Grammar
```

## 1. Reading

Read Sipser pp. 101–125. (This was the optional reading for today. It is required for Monday.)

## 2. Constructing Grammars

Construct a Context Free Grammar for each of the following languages.

a) All strings (over {0,1}) consisting of a substring _w_ followed by its reverse. (This is the same problem you were asked to work on in class.)


`G = ({S}, {0,1}, P, S)`

With P as: 
`S` => `0S0`, 
`S` => `1S1`, 
`S` => `00`, 
`S` => `11`, 

Give a derivation for `010010`.

`S` => `0S0` => `01S10` => `010010`

b) All strings (over {a,b,c}) of the form a^{i}b^{i}c^{j}: an equal number of `a`s and `b`s, followed by any number of `c`s. For example, `aabb`, `aabbcc`, and `aabbcccc`, but not `aaaabbcc`.

`G = ({S,X,Y}, {a,b,c}, P, S)`

With P as: 
`S` => `XY`, 
`S` => `X`, 
`S` => `Y`, 
`X` => `aXb`, 
`X` => `ab`, 
`Y` => `Yc`, 
`Y` => `c`

c) All strings (over {a,b,c}) of the form a^{i}b^{j}c^{j}: any number of `a`s, followed by an equal number of `b`s and `c`s. For example, `abbcc`, `aabbcc`, and `aaaabbcc`, but not `aabbccc`.

`G = ({S,X,Y}, {a,b,c}, P, S)`

With P as: 
`S` => `XY`, 
`S` => `X`, 
`S` => `Y`, 
`X` => `aX`, 
`X` => `a`, 
`Y` => `bYc`, 
`Y` => `bc`

d) Give two distinct grammars that produce the strings described by the regular expression `(ab)*`: empty, `ab`, `abab`, `ababab`, ….

`G = ({S}, {a,b}, P, S)`

With P as: 
`S` => `abS`, 
`S` => epsilon

`G = ({S,X,Y}, {a,b}, P, S)`

With P as: 
`S` => `SXY`, 
`S` => epsilon, 
`X` => `a`, 
`Y` => `b`

## 4. Ambiguous Grammars

Consider the grammar:

    S --> a S | a S b S | epsilon 

This grammar is ambiguous. Show in particular that the string `a a b` has
two:

a. parse trees

(Non-terminating S's become epsilon)

```
  S
 / \
a   S
   / \
  /\ /\
 a Sb  S
```

```
   S
  / \
 /\ /\
a Sb  S
 / \
a   S
```

b. leftmost derivations (These are the ones that, starting from the start variable, rewrite the leftmost nonterminal first.)

`S` => `a S` => `a a S b S` => `a a b S` => `a a b`

`S` => `a S b S` => `a a S b S` => `a a b S` => `a a b`

c. rightmost derivations (These are the ones that, starting from the start variable, rewrite the rightmost nonterminal first.)

`S` => `a S` => `a a S b S` => `a a S b` => `a a b`

`S` => `a S b S` => `a S b` => `a a S b` => `a a b`

Extra Credit/Challenge: Prove that this grammar generates all and only the strings of `a`s and `b`s such that every prefix has at least as many `a`s as `b`s. **Hint: Do the readings!**

You cannot add a `b` without adding an `a`, but you can add an `a` without a `b`

## 5. [Optional] Play with Prolog

Read the page and download the sample files from [here](https://sites.google.com/site/focs16fall/prolog).

Warning: your instructor was unable to get these to reliably run today, and some of the instructions are from memory of when it previously worked. Your mileage may vary.
