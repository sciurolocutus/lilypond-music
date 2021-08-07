# Lilypond Music

A collection of music written in the Lilypond musical typesetting language.

# Rendering
If you don't already have lilypond, install it.

e.g.
```sh
sudo pacman -S lilypond
```

From there, rendering is as simple as
```sh
lilypond lilyPondFile.ly
```

The output is by default pdf (and midi, depending on what the .ly file specifies).
See [Lilypond](https://lilypond.org/) for more details.

# Listening
Once your midi is produced, in case you don't have a midi player,
I can recommend `timidity` as simple default.

Install:
```sh
sudo pacman -S timidity
```

Run:
```sh
timidity lilyPondFile.midi
```
