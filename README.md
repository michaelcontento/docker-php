# [michaelcontento/php][]

Docker images for PHP with a focus on:
- small footprint (based on alpine)
- basic security (see [our default header setup][1])

## Available tags

Please have a look at [dockerhub][] to see all available tags!

But to understand our naming scheme, here is a short overview:
- We support PHP **:7.2**, **:7.1** and **:7.0**.
- **7.2** is also tagged as **:7** and **:latest**
- Add **-debug** to the tag to get PHP with XDebug support
  - E.g. **7.2** becomes **7.2-debug**
- All variants with **-laravel** in their name include all extensions required by [Laravel][]


## License

    The MIT License (MIT)

    Copyright (c) 2017 Michael Contento

    Permission is hereby granted, free of charge, to any person obtaining a copy of
    this software and associated documentation files (the "Software"), to deal in
    the Software without restriction, including without limitation the rights to
    use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
    the Software, and to permit persons to whom the Software is furnished to do so,
    subject to the following conditions:

    The above copyright notice and this permission notice shall be included in all
    copies or substantial portions of the Software.

    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
    IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
    FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
    COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
    IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
    CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

  [1]: https://github.com/michaelcontento/docker-php/tree/master/7.2/etc/caddy/conf.d
  [michaelcontento/php]: https://hub.docker.com/r/michaelcontento/php/
  [Laravel]: https://laravel.com/
  [dockerhub]: https://hub.docker.com/r/michaelcontento/php/tags/