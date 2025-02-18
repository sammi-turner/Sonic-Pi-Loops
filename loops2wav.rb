live_loop :muh_drone0 do
  sample :ambi_choir, rate: 0.2
  sleep 2
end

live_loop :muh_drone0 do
  sample :ambi_drone, rate: 0.6, amp: 0.5
  sleep 2
end
