with open("measure_changes.txt", 'r') as f:
    for line in f:
        line = line.strip().split(" ", 2)
        print(line)
        config_file = line[0]
        old_measure = line[1]
        new_measure = line[2]
        with open("acs-config/" + config_file, 'r+') as config_f:
            contents = config_f.read()
            contents.replace(old_measure, new_measure)
            config_f.write(contents)
