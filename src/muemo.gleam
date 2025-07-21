import gleam/dict.{type Dict}
import internal/js/ref

pub type Cache(k, v) =
  ref.MutableRef(Dict(k, v))

pub fn new(f: fn(Cache(a, b)) -> c) -> c {
  dict.new() |> ref.create |> f
}

pub fn get(cache: Cache(k, v), key: k) -> Result(v, Nil) {
  cache |> ref.get |> dict.get(key)
}

pub fn set(cache: Cache(k, v), key: k, value: v) -> Nil {
  ref.update(cache, fn(d) { dict.insert(d, key, value) })
  Nil
}

pub fn open(cache: Cache(k, v), key: k, f: fn() -> v) -> v {
  case get(cache, key) {
    Ok(value) -> value
    Error(_) -> {
      let result = f()
      set(cache, key, result)
      result
    }
  }
}
