import { Controller } from "@hotwired/stimulus"
import {loadStripe} from '@stripe/stripe-js'

// Connects to data-controller="stripe"
export default class extends Controller {

  static values = { 
    publishableKey: String,
    sessionId: String
  }

  async connect() {
    this.stripe = await loadStripe(this.publishableKeyValue)
  }

  checkoutSession() {
    this.stripe.redirectToCheckout({
      sessionId: this.sessionIdValue
    })
  }
}
