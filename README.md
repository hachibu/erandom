![Image](example.png)

    $ cabal sandbox init
    $ cabal install -j4 --only-dependencies
    $ cabal build
    $ cabal run -- data/emojis.txt -o erandom &
    $ cat erandom
