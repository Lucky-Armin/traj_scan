function main()

    if length(ARGS) != 1
        println("Usage: julia traj_scan.jl hybrid_trajectory.xyz")
        return
    end

    original_trajectory = open(ARGS[1], "r")
    host_trajectory     = open("host_trajectory.xyz", "w")
    guest_trajectory    = open("guest_trajectory.xyz", "w")

    atom_number = parse(Int, readuntil(original_trajectory, " "))
    close(original_trajectory)
    original_trajectory = open(ARGS[1], "r")

    for (linecounter, line) in enumerate(eachline(original_trajectory))
        counter = (linecounter - 1) % (atom_number + 2)

        if counter == 0
            println(host_trajectory, "424" * line[(ndigits(atom_number) + 1):lastindex(line)])
            println(guest_trajectory, string(atom_number - 425) * line[(ndigits(atom_number) + 1):lastindex(line)])
        elseif counter == 1
            println(host_trajectory)
            println(guest_trajectory)
        elseif counter == 2

        elseif counter <= 426
            println(host_trajectory, line)
        else
            println(guest_trajectory, line)
        end
    end

    close(original_trajectory)
    close(host_trajectory)
    close(guest_trajectory)

end

main()
