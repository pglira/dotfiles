python
import sys
sys.path.insert(0, '/home/philipp/scratch/gdb-printer')
from printers import register_eigen_printers
register_eigen_printers (None)
end