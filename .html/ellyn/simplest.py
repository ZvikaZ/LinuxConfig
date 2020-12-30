import sys
import os
sys.path.append("/home/cluster/users/%s/ellyn/ellyn" % os.environ['USER'])
from ellyn import ellyn
print (ellyn)
