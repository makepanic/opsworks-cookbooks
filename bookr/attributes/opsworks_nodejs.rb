include_attribute 'deploy'
include_attribute 'opsworks_commons::default'

default[:bookr][:server] = "54.220.87.138:10102"
default[:bookr][:isbndb] = "YOUR-ISBNDB-KEY"