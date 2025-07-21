pub type MutableRef(value)

@external(javascript, "./ffi/ref_ffi.mjs", "create")
pub fn create(value: value) -> MutableRef(value)

@external(javascript, "./ffi/ref_ffi.mjs", "get")
pub fn get(ref: MutableRef(value)) -> value

@external(javascript, "./ffi/ref_ffi.mjs", "set")
pub fn set(ref: MutableRef(value), value: value) -> value

pub fn update(ref: MutableRef(value), f: fn(value) -> value) -> value {
  let current_value = get(ref)
  let new_value = f(current_value)
  set(ref, new_value)
  new_value
}
