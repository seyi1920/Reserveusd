;; Define the collaterals map
(define-map collaterals
  { user: principal }
  { amount: uint }
)

;; Define the price variable
(define-data-var price uint u0)

;; Define the minimum collateral ratio in basis points
(define-data-var min-collateral-ratio-bps uint u0)

;; Define the liquidation ratio in basis points
(define-data-var liquidation-ratio-bps uint u0)

;; Define the liquidation bonus in basis points
(define-data-var liquidation-bonus-bps uint u0)

;; Define the debts map
(define-map debts
  { user: principal }
  { amount: uint }
)

;; returns (ok collateral_value_microUSD)
(define-read-only (collateral-value (user principal))
  (let ((c (unwrap-panic (map-get? collaterals {user: user}))))
    (let ((collateral-amount (get amount c))
          (p (var-get price)))
      ;; collateral_value = collateral_amount * price
      (ok (* collateral-amount p)))))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Read-only views
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Changed map-get to map-get? and fixed closing parenthesis
(define-read-only (get-collateral (user principal))
  (match (map-get? collaterals {user: user}) entry (ok (get amount entry)) (ok u0)))

;; Changed map-get to map-get? and fixed closing parenthesis
(define-read-only (get-debt (user principal))
  (match (map-get? debts {user: user}) entry (ok (get amount entry)) (ok u0)))

(define-read-only (get-price) (ok (var-get price)))

(define-read-only (get-params)
  (ok {min: (var-get min-collateral-ratio-bps), liq: (var-get liquidation-ratio-bps), bonus: (var-get liquidation-bonus-bps)})
)
