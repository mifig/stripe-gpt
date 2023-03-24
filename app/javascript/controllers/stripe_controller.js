import { Controller } from "@hotwired/stimulus"
import {loadStripe} from '@stripe/stripe-js'

// Connects to data-controller="stripe"
export default class extends Controller {

  // static targets = [ "cardElement", "cardErrors", "email" ]
  static values = { 
    publishableKey: String,
    sessionId: String
  }

  async connect() {
    this.stripe = await loadStripe(this.publishableKeyValue)
    // this.card = this.stripe.elements().create('card')
    // this.card.mount(this.cardElementTarget)
    // this.card.addEventListener('change', this.#displayErrors.bind(this))
  }

  checkoutSession() {
    this.stripe.redirectToCheckout({
      sessionId: this.sessionIdValue,
    })
  }


  // Previous Custom Stripe Element developmen:
  createSubscription(event) {
    event.preventDefault()

    this.stripe.createPaymentMethod({
      type: 'card',
      card: this.card,
      billing_details: { 
        email: this.emailTarget.value
      }
    })
      .then(result => {
        if (result.error) {
          this.cardErrorsTarget.textContent = result.error.message
        } else  {
          this.#stripePaymentHandler(result.paymentMethod)
        }
      })
  }

  #stripePaymentHandler(paymentMethod) {
    const form = this.element
    const hiddenInput = document.createElement('input')
    hiddenInput.setAttribute('type', 'hidden')
    hiddenInput.setAttribute('name', 'stripe_payment_method')
    hiddenInput.setAttribute('value', paymentMethod.id)
    form.appendChild(hiddenInput)
    form.submit()
  }

  #displayErrors(event) {
    if (event.error) {
      this.cardErrorsTarget.textContent = event.error.message
    } else {
      this.cardErrorsTarget.textContent = ''
    }
  }
}
