import Dropdown from '@stimulus-components/dropdown'

export default class extends Dropdown {
  connect() {
    super.connect()
    console.log('Do what you want here.')
  }

  toggle(event) {
    super.toggle()
  }

  hide(event) {
    super.hide(event)
  }
}