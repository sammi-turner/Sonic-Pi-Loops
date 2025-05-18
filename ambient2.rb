# Textures
live_loop :glitch_drones do
  use_synth :dark_ambience
  play [:c3, :ds3, :g3].choose, attack: 4, release: 10, cutoff: 60, amp: 0.3
  sleep 4
end

# Sub-bass Pulse
live_loop :sub_bass do
  with_fx :distortion, distort: 0.3 do
    use_synth :dpulse
    play :c1, attack: 2, release: 6, amp: 0.3, cutoff: 40
    sleep 5
  end
end

# Soothing Strings
live_loop :warm_strings do
  with_fx :reverb, mix: 0.8, room: 0.7 do
    use_synth :blade
    play_chord chord(:c4, :m7), attack: 6, release: 12, amp: 0.2, cutoff: 80
    sleep 16
  end
end
