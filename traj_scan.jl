original_trajectory = open("perylene_both_traj.xyz", "r")

host_trajectory = open("host_trajectory.xyz", "w")
guest_trajectory = open("guest_trajectory.xyz", "w")

atom_number = parse(Int, readuntil(original_trajectory, " "))
linecounter = -1

for line in eachline(original_trajectory)
    linecounter += 1
    linecounter = linecounter % (atom_number + 2)
    if linecounter == 0
        println(host_trajectory, 424)
        println(guest_trajectory, atom_number - 424)
    elseif linecounter == 1
        println(host_trajectory)
        println(guest_trajectory)
    elseif linecounter <= 425
        println(host_trajectory, line)
    else
        println(guest_trajectory, line)
    end
end


close(original_trajectory)
close(host_trajectory)
close(guest_trajectory)