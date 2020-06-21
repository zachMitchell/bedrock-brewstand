from updateUtils import getVersionFromUrl
import sys

if __name__ == "__main__":
    print(getVersionFromUrl(sys.argv[1]))