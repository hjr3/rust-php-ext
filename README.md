# Rust and PHP Extension Example

## Rust

To build the Rust library:

```
$ cd rust
$ cargo build
```

## PHP

To build the PHP extension:

```
$ cd php-ext
$ phpize
$ ./configure --with-score=../rust/target/debug
$ make
```

You can optionally `make install` if you want to install the PHP extension shared object.

There are other ways to configure the PHP extension. My [blog post][blog post] has more details.

## Run Example

Once the Rust library is built and the PHP extension is compiled, you can see it in action using:

```
$ php -d extension=php-ext/modules/score.so -r "var_dump(score('vim', 'vi'));"
```

The `-d` option tells PHP that we are passing an ini option to look for the `score.so` shared object at the specified path. The `-r` option tells PHP to run the code within quotes.

[blog post]: http://hermanradtke.com/2015/08/03/creating-a-php-extension-to-rust.html
