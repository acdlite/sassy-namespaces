Sassy Namespaces
================

Sass 3.3 brought us maps, which are great for organizing related values into groups, but the syntax is a bit tedious. Sassy Namespaces offers pattern for creating and accessing namespaces using Sass maps.

Yes, it's essentially a wrapper around the excellent [Sassy Maps](https://github.com/Team-Sass/Sassy-Maps) extension.

The problem
-----------

In vanilla Sass, even single-level namespaces are a bit of hassle:

```scss
$color: ();
$color: $map-merge($color, (primary: red));

foo {
  bar: map-get($color, primary); // bar: red
}
```

You could define functions/mixins to streamline the process:

```scss
$color: ();

// Setter
@mixin set-color($key, $value) {
  $color: $map-merge($color, ($key: $value));
}

// Getter
@function color($key) {
  @return map-get($color, $key);
}

@include set-color(primary, red);
foo {
  bar: color(primary); // bar: red
}
```

But this quickly gets tiresome, especially once you try to create namespaces with more than one level of hierarchy.

Sass namespaces, minus the headaches
------------------------------------

Here's how you do it with Sassy Namespaces:

```scss
@include create-namespace(color);
@include namespace-set(color, primary, red);
foo {
  bar: namespace-get(color, primary); // bar: red;
}
```

Maps are created and used internally, but you don't ever have to deal with them.

It's still a good idea to create convenience functions/mixins. Pretty straightfoward:

```scss
@mixin set-color($args...) {
  @include namespace-set(color, $args...);
}

@function color($args...) {
  @return namespace-get(color, $args...);
}

@include set-color(primary, red);
foo {
  bar: color(primary); // bar: red
}
```


If you want to set multiple values at once, without calling `namespace-set()` over and over, you can pass a map of keys and values (instead of a single key and a single value):

```scss
$map: (primary: red, secondary: green)

@include namespace-set(color, $map);
foo {
  bar: namespace-get(color, primary); // bar: red
  baz: namespace-get(color, secondary); // baz: green
}
```

And, since Sassy Namespaces uses Sassy Maps internally, hierarchical namespaces are free:

```scss
@include namespace-set(color, text link hover, green);
foo {
  bar: namespace-get(color, text link hover); // bar: green
}
```

At any time, you can return the underlying namespace map:

```scss
@include namespace-set(color, primary, red);
$namespace-1: namespace(color);

@include namespace-set(color, secondary, green);
$namespace-2: namespace(color);

/*
  $namespace-1: (
    color: (
      primary: red
    )
  )

  $namespace-2: (
    color: (
      primary: red,
      secondary: green
    )
  )
*/
```