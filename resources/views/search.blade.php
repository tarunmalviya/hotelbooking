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
            border-radius: 10px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }
        .room-card {
            border-radius: 10px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.1);
        }
        .sold-out {
            color: red;
            font-weight: bold;
        }
        .available {
            color: green;
            font-weight: bold;
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

            <div class="col-md-2">
                <label>Guests</label>
                <input type="number" name="guests" max="3" value="1" class="form-control">
            </div>

            <div class="col-md-2">
                <label>Meal Plan</label>
                <select name="meal_plan" class="form-control">
                    <option value="room_only">Room Only</option>
                    <option value="breakfast">Breakfast Included</option>
                </select>
            </div>

            <div class="col-md-2 d-flex align-items-end">
                <button class="btn btn-primary w-100">Search</button>
            </div>

        </form>
    </div>

    <!-- Results -->
    <div id="results" class="row"></div>

</div>

<script>
document.getElementById('searchForm').addEventListener('submit', function(e) {
    e.preventDefault();

    let formData = new FormData(this);
    let query = new URLSearchParams(formData).toString();

    fetch('/search?' + query)
        .then(res => res.json())
        .then(data => {

            let html = '';

            if (data.length === 0) {
                html = '<p class="text-center">No rooms available</p>';
            }

            data.forEach(room => {

                let status = room.available
                    ? '<span class="available">Available</span>'
                    : '<span class="sold-out">Sold Out</span>';

                let discountHtml = '';

                if (room.discounts.length > 0) {
                    discountHtml += '<ul>';
                    room.discounts.forEach(d => {
                        discountHtml += `<li>${d.type.replace('_',' ')}: ₹${d.amount}</li>`;
                    });
                    discountHtml += '</ul>';
                } else {
                    discountHtml = '<p>No discounts applied</p>';
                }

                html += `
                <div class="col-md-6 mb-4">
                    <div class="card room-card p-3">

                        <h4>${room.room_type}</h4>
                        <p>Status: ${status}</p>

                        <hr>

                        <p><strong>Base Price:</strong> ₹${room.base_price}</p>
                        <p><strong>Final Price:</strong> ₹${room.final_price}</p>
                        <p><strong>Per Night:</strong> ₹${room.price_per_night}</p>

                        <hr>

                        <h6>Discounts:</h6>
                        ${discountHtml}

                    </div>
                </div>
                `;
            });

            document.getElementById('results').innerHTML = html;
        });
});
</script>

</body>
</html>