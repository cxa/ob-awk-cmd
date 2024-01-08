# ob-awk-cmd

Though you can customize a fixed `org-babel-awk-command`, `ob-awk-cmd` provides a `:cmd` header argument to dynamically select an AWK variant for execution:

```org
#+begin_src awk :cmd gawk
BEGIN {
    print gensub(/Hello/, "Hey", "g", "Hello world")
}
#+end_src

#+RESULTS:
: Hey world
```

## Install

Add `ob-awk-cmd.el` to your `load-path`, or use a package manager like `use-package` w/ `quelpa`:

```elisp
(use-package ob-awk-cmd
  :quelpa (ob-awk-cmd :fetcher github :repo "cxa/ob-awk-cmd"))
```
