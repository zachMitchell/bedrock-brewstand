def stdin():
    totalStr = ''
    try:
        while True:
            newline = ''
            if not totalStr == '':
                newline = '\n'

            totalStr = totalStr + newline + input()
    except EOFError:
        return totalStr