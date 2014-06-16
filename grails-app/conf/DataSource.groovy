dataSource {
    pooled = true
//    driverClassName = "org.h2.Driver"
//    username = "sa"
//    password = ""
    driverClassName = "com.mysql.jdbc.Driver"
    dialect = "org.hibernate.dialect.MySQL5InnoDBDialect"
}
hibernate {
    cache.use_second_level_cache = true
    cache.use_query_cache = true
    cache.region.factory_class = 'net.sf.ehcache.hibernate.EhCacheRegionFactory'
}
// environment specific settings
environments {
    development {
        dataSource {
            dbCreate = "update" // one of 'create', 'create-drop', 'update', 'validate', ''
//            url = "jdbc:h2:devDb;MVCC=TRUE"
            url = "jdbc:mysql://localhost/phr_db_dev?useUnicode=yes&characterEncoding=UTF-8"
            username = "root"
            password = ""
        }
    }
    test {
        dataSource {
            dbCreate = "update"
//            url = "jdbc:h2:mem:testDb;MVCC=TRUE"
            url = "jdbc:mysql://localhost/phr_db_prod?useUnicode=yes&characterEncoding=UTF-8"
            username = "root"
            password = ""
        }
    }
    production {
        dataSource {
            dbCreate = "update"
//            url = "jdbc:h2:prodDb;MVCC=TRUE"
            url = "jdbc:mysql://localhost/sec_treasurer_prod?useUnicode=yes&characterEncoding=UTF-8"
            username = "root"
            password = ""
            
            pooled = true
            properties {
               maxActive = -1
               minEvictableIdleTimeMillis=1800000
               timeBetweenEvictionRunsMillis=1800000
               numTestsPerEvictionRun=3
               testOnBorrow=true
               testWhileIdle=true
               testOnReturn=true
               validationQuery="SELECT 1"
            }
        }
    }
}
