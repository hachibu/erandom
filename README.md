![Image](example.png)

    $ cabal sandbox init
    $ cabal install -j4 --only-dependencies
    $ cabal build
    $ ./dist/build/erandom/erandom data/emojis.txt -o erandom &
    $ cat erandom
