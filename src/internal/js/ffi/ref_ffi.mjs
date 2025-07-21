class Ref {
  constructor(value) {
    this.value = value;
  }
}

export function create(value) {
  return new Ref(value);
}

export function get(ref) {
  return ref.value;
}

export function set(ref, newValue) {
  ref.value = newValue;
  return newValue;
}
