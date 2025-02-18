use_bpm 100
use_synth :bass_foundation

chords = [(chord :C, :minor7), (chord :Ab, :major7), (chord :Eb, :major7), (chord :Bb, "7")].ring
c = chords[0]

live_loop :melody do
  r = [0.25, 0.25, 0.5, 1].choose
  play c.choose, attack: 0, release: r
  sleep r
end

live_loop :keys do
  play c
  sleep 1
end

live_loop :bass do
  use_octave -2
  3.times do
    play c[0]
    sleep 1
  end
  play c[2]
  sleep 0.5
  play c[1]
  sleep 0.5
  c = chords.tick
end