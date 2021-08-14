\version "2.22.1"

\header {
  title = "Donut Plains"
  subtitle = "Super Mario World"
  composer = "Koji Kondo"
}

%{ global directives %}
global = {
  \key c \major
  \time 4/4
  \tempo 4 = 144
}

%{ musical phrases follow here %}
tripolet = {
  r8 c8 \tuplet 3/2 { <e g b>\staccato c <e g b>\staccato } r4 <c e a>
}

firstphrase = {
  \tripolet
  %\transpose c cis'' { \tripolet }
  r8 d8 \tuplet 3/2 { <f a c>\staccato d <f a c>\staccato } r4 <d f b>
  \tripolet
}
secondphrase = {
  \tuplet 3/1 { <f a c>4. a4. f4.}
  <<
    { e4 eeses4 }
    \absolute { <f' ces''>2 }
  >>
  r8
}
thirdphrase = {
  <<
    { d8. e16 f8. g16 r2 }
    %{ throw this  phrase in with a different voice %}
    \new Staff \with {
      instrumentName = "Flute"
      midiInstrument = "flute"
    } {
      \new Voice {
        r2 r8 g16 a g8\staccato r8
      }
    }
  >> \oneVoice
}

kalimba = \relative c'' {
  \global
  \clef treble
  % Music follows here.
  \firstphrase
  \secondphrase
  \firstphrase
  \thirdphrase
}

simplebassline = {
  c4 c'4 a,4 a'4
  d,4 d'4 g,,4 g'4
}

bassparttwo = {
  c,4 c'4 a,4 a'4
  d,4 r4 des~\tuplet 3/2 { des8 r4 }
}

bass = \relative c {
  \global
  \clef bass
  %\piano
  \simplebassline
  \bassparttwo

  \simplebassline
  \bassparttwo
}

\score {
  <<
    \repeat unfold 2 {
      s1 \noBreak s1 \noBreak
      s1 \noBreak s1 \break
    }

    \new StaffGroup  = "StaffGroup_Mario" <<
      \new Staff \with {
          instrumentName = "Kalimba"
          midiInstrument = "kalimba"
        } \kalimba

      \new Staff \with {
        instrumentName = "Acoustic Bass"
        midiInstrument = "acoustic bass"
      } \bass
    >>
  >>
  \layout {
    \context {
      \Staff \RemoveEmptyStaves
      \override VerticalAxisGroup.remove-first = ##t
    }
    indent = 20\mm
    line-width = 180\mm
    ragged-last = ##t

  }
  \midi {
    \tempo 4=144
  }
}
