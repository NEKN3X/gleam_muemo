import gleeunit
import gleeunit/should
import muemo

pub fn main() -> Nil {
  gleeunit.main()
}

pub fn muemo_test() {
  use a <- muemo.new()
  muemo.set(a, "key1", "value1")
  muemo.get(a, "key1")
  |> should.equal(Ok("value1"))
}

fn fib(n, cache) {
  use <- muemo.open(cache, n)
  case n {
    1 | 2 -> 1
    n -> fib(n - 1, cache) + fib(n - 2, cache)
  }
}

pub fn fib_test() {
  {
    use cache <- muemo.new()
    fib(50, cache)
  }
  |> should.equal(12_586_269_025)
}
