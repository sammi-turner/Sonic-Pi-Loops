use_bpm 60

live_loop :kick do
  sample :bd_haus, rate: 1
  sleep 0.25
end

live_loop :snare do
  sleep 0.5
  sample :sn_dolf
  sleep 0.5
end

live_loop :hihat do
  sample :drum_cymbal_closed
  sleep 0.25
end

live_loop :bass do
  use_synth :prophet
  play :E2, release: 2
  sleep 8
end

live_loop :bleep do
  use_random_seed 123
  4.times do |i|
    16.times do
      use_synth :prophet
      play chord(:E3, :minor).choose, attack: 0, release: 0.1, cutoff: rrand_i(50, 90) + i * 10
      sleep 0.25
    end
  end
end

live_loop :chords do
  use_synth :prophet
  [1, 3, 6, 4].each do |d|
    (range -2, 2).each do |i|
      play_chord (chord_degree d, :e, :minor, 3, invert: i)
      sleep 2
    end
  end
end
