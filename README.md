# Homebrew Instant Client

A tap of Mac [Homebrew][] formulas for [Oracle Instant Client][] and related
downloads.

Due to difficulties downloading the files from [Instant Client Downloads page][]
the process can not be automated. However, if the files are downloaded manually
and put in the cache then Homebrew can do the rest. You will need at least the
`instantclient-basic` file downloaded to `$HOME/Library/Caches/Homebrew` and
then any additional files such as `sqlplus` related ones.

## Usage

```bash
$ brew install InstantClientTap/instantclient/<formula>
```

Where `<formula>` is one of the formulas listed in the `Formula/` directory. For
example `instantclient-sqlplus` would require

```bash
$ brew install InstantClientTap/instantclient/instantclient-sqlplus
```

You could also tap the repository before installing. This is equivalent to the
calls above:

```bash
$ brew tap InstantClientTap/instantclient
$ brew install <formula>
```

## Installing libraries which depend on Instant Client Basic Lite

When installing libraries which depend on Basic Lite you might need to specify
the `DYLD_LIBRARY_PATH` environment variable. E.g. in order to install
[ruby-oci8][] [older than 2.2.0][] you will need to execute

```bash
$ DYLD_LIBRARY_PATH=$(brew --prefix)/lib gem install ruby-oci8
```

You can also set `DYLD_LIBRARY_PATH` globally but this is
[discouraged](https://discussions.apple.com/thread/1108472) and is known to
break things.


# License

Homebrew Instant Client is licensed under the [MIT License][] (see [LICENSE][]).


[homebrew]: http://brew.sh
[Oracle Instant Client]: http://www.oracle.com/technetwork/database/features/instant-client/index-100365.html
[Instant Client Downloads page]: http://www.oracle.com/technetwork/topics/intel-macsoft-096467.html
[ruby-oci8]: https://github.com/kubo/ruby-oci8
[older than 2.2.0]: https://github.com/kubo/ruby-oci8/blob/master/docs/install-instant-client.md#os-x
[MIT License]: http://www.opensource.org/licenses/MIT
[LICENSE]: https://github.com/InstantClientTap/homebrew-instantclient
