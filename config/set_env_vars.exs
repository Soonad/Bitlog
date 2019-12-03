set = &System.put_env(&1, System.get_env("SET_#{&1}", &2))

set.("PUBLIC_HOST", "localhost")
set.("PUBLIC_PATH", "/")
set.("PUBLIC_PORT", "4000")
set.("PUBLIC_SCHEME", "http")

set.("DATABASE_URL", "postgresql://postgres:postgres@localhost/bitlog_#{Mix.env()}")
set.("DATABASE_POOL_SIZE", "2")
set.("PORT", "4000")
