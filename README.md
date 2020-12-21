# ActiveNotebook

```
bundle add --group jupyter iruby ffi-rzmq awesome_print daru

jupyter kernelspec install $(jupyter kernelspec list --json | jq .kernelspecs.ruby.resource_dir -r) --user --name=foobar

{
  "argv": [
    "/home/fotios/.asdf/installs/ruby/2.6.5/bin/iruby",
    "kernel",
    "{connection_file}",
    "/home/fotios/notes/kernel.rb"
  ],
  "display_name": "Foobar",
  "language": "ruby"
}
```

# IDEAS

- Use as a railtie
- Register kernel itself
- Can kernels be dynamic?
