<!DOCTYPE html>
<html>
<head>
    <title>Hotel Booking</title>

    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body {
            background: #f5f7fb;
        }
        .search-box {
            background: #fff;
            padding: 20px;
            border-radius: 12px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.08);
        }
        .room-card {
            border-radius: 16px;
            transition: 0.3s ease;
        }
        .room-card:hover {
            transform: translateY(-5px);
        }
    </style>
</head>

<body>

<div class="container mt-5">

    <h2 class="text-center mb-4">🏨 Hotel Booking Search</h2>

    <!-- Search Box -->
    <div class="search-box mb-4">
        <form id="searchForm" class="row g-3">

            <div class="col-md-3">
                <label>Check In</label>
                <input type="date" name="check_in" class="form-control" required>
            </div>

            <div class="col-md-3">
                <label>Check Out</label>
                <input type="date" name="check_out" class="form-control" required>
            </div>

            <div class="col-md-3">
                <label>Guests</label>
                <input type="number" name="guests" max="4" value="1" class="form-control">
            </div>

            <div class="col-md-3 d-flex align-items-end">
                <button class="btn btn-primary w-100">Search</button>
            </div>

        </form>
    </div>

    <!-- Results -->
    <div id="results" class="row"></div>

</div>

<script>

// Helper functions
function formatMealPlan(plan) {
    switch(plan) {
        case 'room_only': return 'Room Only';
        case 'breakfast': return 'Breakfast Included';
        case 'all_meals': return 'All Meals Included';
        default: return plan;
    }
}

function formatDiscountType(type) {
    switch(type) {
        case 'early_bird': return 'Early Bird Discount';
        case 'long_stay': return 'Long Stay Discount';
        default: return type;
    }
}

document.getElementById('searchForm').addEventListener('submit', function(e) {
    e.preventDefault();

    let formData = new FormData(this);
    let query = new URLSearchParams(formData).toString();

    fetch('/search?' + query)
    .then(res => {
        if (!res.ok) {
            throw new Error('API Error');
        }
        return res.json();
    })
    .then(data => {

            let html = '';

            if (data.length === 0) {
                html = '<p class="text-center">No rooms available</p>';
            }

            data.forEach(room => {

                html += `
                <div class="col-md-6 mb-4">
                    <div class="card shadow-sm border-0 p-3 room-card">

                        <!-- Header -->
                        <div class="d-flex justify-content-between align-items-center mb-2">
                            <h5 class="mb-0">${room.room_type}</h5>
                            <span class="badge ${room.available ? 'bg-success' : 'bg-danger'}">
                                ${room.available ? 'Available' : 'Sold Out'}
                            </span>
                        </div>

                        <!-- Rate Plan -->
                        <p class="text-muted mb-1">
                            <strong>Rate Plan:</strong> ${room.rate_plan}
                        </p>

                        <p class="text-muted mb-2">
                            <strong>Meal Plan:</strong> ${formatMealPlan(room.meal_plan)}
                        </p>

                        <hr>

                        <!-- Pricing -->
                        <div class="mb-2">
                            <p class="mb-1">
                                <strong>Base Price:</strong> 
                                <span class="text-decoration-line-through text-muted">
                                    ₹${room.base_price}
                                </span>
                            </p>

                            <p class="mb-1">
                                <strong>Final Price:</strong> 
                                <span class="fw-bold text-success">
                                    ₹${room.final_price}
                                </span>
                            </p>

                            <p class="mb-0 text-muted">
                                ₹${room.price_per_night} / night
                            </p>
                        </div>

                        <hr>

                        <!-- Discounts -->
                        <div>
                            <h6 class="mb-2">Discount Applied</h6>
                            ${
                                room.discounts && room.discounts.length > 0
                                ? room.discounts.map(d => `
                                    <div class="d-flex justify-content-between">
                                        <span>${formatDiscountType(d.type)}</span>
                                        <span class="text-success">-₹${d.amount}</span>
                                    </div>
                                `).join('')
                                : `<p class="text-muted mb-0">No discount</p>`
                            }
                        </div>

                    </div>
                </div>
                `;
            });

            document.getElementById('results').innerHTML = html;
        }).catch(error => {
    document.getElementById('results').innerHTML =
        '<p class="text-danger text-center">Something went wrong. Please try again.</p>';
});
});
</script>

</body>
</html>