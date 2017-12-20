# go-minimal

`go-minimal` is a tiny Docker base image for running dynamic Go binaries.

Weighing in at just under 4MB, this image is even smaller than Alpine.  More
importantly, though, it includes the standard glibc, so it will work with normal
dynamic Go Linux-x64 binaries.

If possible, you should use a `FROM scratch` Docker images with a static Go
binary.  Unfortunately, sometimes that isn't possible or isn't practical. 

In particular, these are are the cases covered by this package:

  - TLS : for most TLS operations, Go still needs the public "trusted" TLS root
certificates.
  - Timezones : for timezone translation (such as those provided by the `time`
    package), we we need the timezone definitions.  These have a habit of being
    updated relatively often, so it is probably better to bind-mount these from
    a live system instead, if possible.
  - cGo : C bindings for Go need the C libraries.

This image is for any of those cases.

## Usage

You can use this image with two lines in your `Dockerfile`:

```
   FROM ulexus/go-minimal
   COPY myCompiledGoBinary /app
```

The entrypoint is configured to simply execute `/app`.  You are free, of course,
to override this.

One of the common reasons for building dynamic Go binaries is to facilitate
`cgo`-built binaries, where external dynalic libraries are linked in.  If such
is the case, make sure you copy those libraries into the image, as well:

```
   FROM ulexus/go-minimal
   COPY libm.so.6 /lib64/libm.so.6
   COPY myLibmLinkedGoBinary /app
```

Because Docker will not allow you to reference files from outside its build
context, you will need to copy affiliated libaries into the build directory,
first.  See the `build.sh` script for an example of how this may be
accomplished.

Make sure to check you Go binary to see what libraries it is linked against, if
in doubt:

```
   ldd myGoBinary
```


