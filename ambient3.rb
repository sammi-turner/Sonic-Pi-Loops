use_bpm 90

# Piano Melody
live_loop :piano do
  sleep 16
  with_fx :reverb, mix: 0.8, damp: 1, room: 1 do
    use_synth :piano
    notes = [:c4, :eb4, :f4, :g4, :bb4, :a4, :g4, :f4]
    durations = [2, 1, 1, 2, 2, 1, 1, 2]
    notes.zip(durations).each do |n, d|
      play n, release: d * 1.5, amp: 0.05, pan: 0
      sleep d
    end
  end
end

# Ambient Drone
live_loop :drone do
  with_fx :reverb, mix: 0.8, room: 1 do
    with_fx :slicer, phase: 8, wave: 0, mix: 0.3 do
      use_synth :dark_ambience
      play chord(:c2, '5'), attack: 8, release: 8, cutoff: 60, amp: 0.4
      sleep 16
    end
  end
end

# Harmonic Texture (left and right alternation)
live_loop :texture do
  with_fx :reverb, mix: 0.9, room: 0.95 do
    with_fx :hpf, cutoff: 40, mix: 0.3 do
      use_synth :fm
      notes = [:c3, :eb3, :f3, :bb3, :a3].ring
      play notes.tick, attack: 4, release: 12, amp: 0.1, pan: -0.7 # Left side
      sleep 8
      play notes.look, attack: 4, release: 12, amp: 0.1, pan: 0.7 # Right side
      sleep 8
    end
  end
end

# Subtle Noise Layer (fixed slight left position)
live_loop :noise do
  with_fx :reverb, mix: 0.7, room: 0.8 do
    with_fx :lpf, cutoff: 90 do
      use_synth :gnoise
      play :c, attack: 2, release: 6, amp: 0.01, pan: -0.25
      sleep 8
    end
  end
end

