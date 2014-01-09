include_attribute 'deploy'
include_attribute 'opsworks_commons::default'

default[:bookr][:server] = "YOUR-DB-SERVER-IP"
default[:bookr][:api] = "http://YOUR-API-IP/"
default[:bookr][:isbndb] = "YOUR-ISBNDB-KEY"