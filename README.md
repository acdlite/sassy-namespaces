Sassy Namespaces
================

Sass 3.3 brought us maps, which are great for grouping related values, but the syntax is a bit tedious. Sassy Namespaces offers a pattern for creating and accessing namespaces using Sass maps.

Yes, it's essentially a wrapper around the excellent [Sassy Maps](https://github.com/Team-Sass/Sassy-Maps) extension.

The problem
-----------

In vanilla Sass, even single-level namespaces are a bit of a chore:

```scss
// Create "color" namespace
$color: ();
// Add key-value pair
$color: $map-merge($color, (primary: red));

output {
  foo: map-get($color, primary); // foo: red
}
```

A partial solution is to define wrapper functions/mixins that abstract away the ugliness:

```scss
// Create "color" namespace
$color: ();

@function color-set($key, $value) {
  @return $map-merge($color, ($key: $value));
}

// Setter
@mixin color-set($key, $value) {
  $color: color-set($key, $value);
}

// Getter
@function color($key) {
  @return map-get($color, $key);
}

// Add key-value pair
@include color-set(primary, red);
output {
  foo: color(primary); // foo: red
}
```

But this quickly gets tiresome, especially once you try to create namespaces with more than one level of hierarchy.

Namespaces, minus the headaches
------------------------------------

With Sassy Namespaces, maps are created and used internally. You don't ever have to deal with them directly. Easy as:

```scss
// Create a "color" namespace
@include namespace-create(color); // (This step can be skipped)
// Add key-value pair
@include namespace-set(color, primary, red);
ouput {
  foo: namespace-get(color, primary); // foo: red;
}
```

It's possible streamline to this even further. `namespace-set()` will create a namespace if it doesn't exist, so we can skip `namespace-create()`.

Also, instead of calling `namespace-set()` and `namespace-get()`, we can replace both with the wrapper function/mixin `namespace()`, which will either get or set as is appropriate. This comes in handy when creating wrapper functions/mixins:

```scss
// Alias color() to namespace(color)
@mixin color($args...) {
  $color: namespace(color, $args...);
}

@function color($args...) {
  @return namespace(color, $args...);
}

// Add key-value pair
@include color(primary, red);
output {
  foo: color(primary); // foo: red
}
```


If you want to set multiple values at once, without calling `namespace-set()` over and over, you can pass a map of keys and values (instead of a single key and a single value):

```scss
$map: (primary: red, secondary: green)

@include namespace-set(color, $map);
output {
  foo: namespace-get(color, primary); // foo: red
  bar: namespace-get(color, secondary); // bar: green
}
```

And, since Sassy Namespaces uses Sassy Maps internally, hierarchical namespaces are easy, too:

```scss
@include namespace-set(color, text link hover, green);
output {
  foo: namespace-get(color, text link hover); // foo: green
}
```

At any time, you can return the underlying namespace map:

```scss
@include namespace-set(color, primary, red);
$namespace-1: namespace-get(color);

@include namespace-set(color, secondary, green);
$namespace-2: namespace-get(color);

/*
  $namespace-1: (
    primary: red
  )

  $namespace-2: (
    primary: red,
    secondary: green
  )
*/
```