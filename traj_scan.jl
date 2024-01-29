function main()
    ARGS
original_trajectory = open(ARGS[1], "r")

host_trajectory = open("host_trajectory.xyz", "w")
guest_trajectory = open("guest_trajectory.xyz", "w")

atom_number = parse(Int, readuntil(original_trajectory, " "))

for (linecounter, line) in enumerate(eachline(original_trajectory))
    counter = (linecounter - 1) % (atom_number + 2)
    if counter == 0
        println(host_trajectory, 424)
        println(guest_trajectory, atom_number - 424)
    end
    if counter == 1
        println(host_trajectory, line)
        println(guest_trajectory, line)
    end
    if 1 < counter <= 425
        println(host_trajectory, line)
    end
    if 425 < counter <= atom_number + 1
        println(guest_trajectory, line)
    end
end


close(original_trajectory)
close(host_trajectory)
close(guest_trajectory)

end

main()