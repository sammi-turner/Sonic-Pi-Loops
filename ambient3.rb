use_bpm 90

# Piano Melody
define :melody do |n|
  count = 0
  loop do
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
    count += 1
    break if count == n
  end
end

# Ambient Drone
define :drone do |n|
  count = 0
  loop do
    with_fx :reverb, mix: 0.8, room: 1 do
      with_fx :slicer, phase: 8, wave: 0, mix: 0.3 do
        use_synth :dark_ambience
        play chord_play(:c2, '5'), attack: 8, release: 8, cutoff: 60, amp: 0.4
        sleep 16
      end
    end
    count += 1
    break if count == n
  end
end

# Harmonic Texture
define :texture do |n|
  count = 0
  loop do
    with_fx :reverb, mix: 0.9, room: 0.95 do
      with_fx :hpf, cutoff: 40, mix: 0.3 do
        use_synth :fm
        notes = [:c3, :eb3, :f3, :bb3, :a3].ring
        play notes.tick, attack: 4, release: 12, amp: 0.1, pan: -0.7
        sleep 8
        play notes.look, attack: 4, release: 12, amp: 0.1, pan: 0.7
        sleep 8
      end
    end
    count += 1
    break if count == n
  end
end

# Start loops
in_thread do
  melody(3)
end

in_thread do
  drone(6)
end

in_thread do
  texture(6)
end
