<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Responsive Dashboard</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" />
    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css2?family=Pacifico&display=swap" rel="stylesheet">

    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #eaf7f4;   /* mint background */
            overflow-x: hidden;
        }

        .navbar {
            background-color: #009688;   /* teal navbar */
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
        }

        .navbar-brand,
        .navbar-nav .nav-link {
            color: #fff;
        }

        .navbar-brand:hover,
        .navbar-nav .nav-link:hover {
            color: #ffd6c9;   /* light coral hover */
        }

        /* Sidebar */
        .sidebar {
            background: #004d40;   /* dark teal */
            backdrop-filter: blur(8px);
            border-right: 1px solid #80cbc4;  /* aqua border */
            height: 100vh;
            overflow-y: auto;
            transition: all 0.3s ease;
            z-index: 1050;
        }

        .sidebar::-webkit-scrollbar {
            width: 6px;
        }

        .sidebar::-webkit-scrollbar-thumb {
            background-color: #80cbc4;   /* aqua scrollbar */
            border-radius: 3px;
        }

        .sidebar .nav-link {
            color: #b2dfdb;   /* light teal text */
            font-weight: 500;
            padding: 10px 16px;
            border-radius: 50px;
            transition: 0.3s ease;
        }

        .sidebar .nav-link:hover {
            background-color: #26a69a;   /* lighter teal hover */
            color: #fff;
            transform: translateX(5px);
        }

        .sidebar .nav-link.active {
            background-color: #ff7043;   /* coral active */
            color: #fff;
            font-weight: bold;
        }

        .sidebar h4 {
            color: #ffffff;
            font-size: 1.4rem;
            padding-left: 8px;
            margin-bottom: 24px;
        }

        /* Toggle button */
        #sidebarToggle {
            display: none;
            background: none;
            border: none;
            color: #fff;
            font-size: 1.25rem;
        }

        /* Responsive behavior */
        @media (max-width: 991.98px) {
            #sidebarToggle {
                display: block;
            }

            .sidebar {
                display: none;
                position: fixed;
                top: 56px;
                left: 0;
                width: 250px;
                height: calc(100vh - 56px);
                box-shadow: 2px 0 5px rgba(0, 0, 0, 0.5);
                transform: translateX(-100%);
                transition: transform 0.3s ease;
            }

            .sidebar.show {
                display: block;
                transform: translateX(0);
            }
        }

        .content {
            padding: 20px;
            width: 100%;
        }

        .card {
            border: none;
            transition: transform 0.3s, box-shadow 0.3s;
        }

        .card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.15);
        }

        .card.bg-dark {
            background: linear-gradient(135deg, #37474f, #263238); /* slate gradient */
            color: #fff;
        }

        .text-muted {
            font-size: 0.9rem;
        }

        .custom-logo-font {
            font-family: 'Times New Roman', 'Times, serif';
            font-size: 1.6rem;
            letter-spacing: 1px;
        }

        /* Button */
        .btn-dark {
            background-color: #ff7043;   /* coral button */
            border: none;
        }

        .btn-dark:hover {
            background-color: #f4511e;   /* darker coral hover */
        }
    </style>

</head>

<body>
<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-dark">
    <div class="container-fluid">
        <button id="sidebarToggle" class="btn btn-dark d-lg-none me-2">
            <i class="fas fa-bars"></i>
        </button>
        <a class="navbar-brand ms-2 custom-logo-font" href="#">Pharma Flow</a>

        <div class="collapse navbar-collapse justify-content-end">
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link" href="#"><i class="fas fa-user-circle me-1"></i>Hello Pharma!!</a>
                </li>
            </ul>
        </div>
    </div>
</nav>

<!-- Main layout with sidebar + content -->
<div class="d-flex">
    <!-- Sidebar -->
    <nav id="sidebarMenu" class="sidebar col-md-3 col-lg-2 d-md-block p-3">
        <div class="d-flex flex-column align-items-start gap-2">
            <h4 class="fw-bold">Pharma Flow</h4>
            <ul class="nav flex-column w-100">
                <li class="nav-item mb-2">
                    <a class="nav-link d-flex align-items-center gap-2 active" href="index.jsp">
                        <i class="fas fa-chart-line"></i><span>Dashboard</span>
                    </a>
                </li>
                <li class="nav-item mb-2">
                    <a class="nav-link d-flex align-items-center gap-2" href="form.jsp">
                        <i class="fa-solid fa-capsules"></i><span>Suppliers Form</span>
                    </a>
                </li>
                <li class="nav-item mb-2">
                    <a class="nav-link d-flex align-items-center gap-2" href="medicine.jsp">
                        <i class="fa-solid fa-prescription"></i><span>Medicine Inventory Form</span>
                    </a>
                </li>

                <li class="nav-item mb-2">
                    <a class="nav-link d-flex align-items-center gap-2" href="report.jsp">
                        <i class="fa-solid fa-table-list"></i><span>Table</span>
                    </a>
                </li>
                <li class="nav-item mb-2">
                    <a class="nav-link d-flex align-items-center gap-2 text-danger" href="Login.jsp">
                        <i class="fas fa-sign-out-alt"></i><span>Log out</span>
                    </a>
                </li>
            </ul>
        </div>
    </nav>

    <!-- Page Content -->
    <!-- Replace the <main> section inside your HTML file with this: -->


    <main class="content">
        <div class="d-flex justify-content-between align-items-center pt-3 pb-2 mb-4 border-bottom rounded">
            <h1 class="h4">Suppliers Information Form</h1>

            <p class="text-muted" id="currentDateTime"></p>

        </div>

        <!-- Stylish Responsive Form -->
        <div class="card shadow-sm p-4 rounded" style="background-color: #ffffff;">
            <form action="insertSupplier" method="post">
                <div class="row mb-3">
                    <div class="col-md-6">
                        <label for="itemName" class="form-label">Supplier Name</label>
                        <input type="text" class="form-control" name="supplierName" id="itemName" placeholder="E.g.Cipla Ltd."
                               required />
                    </div>
                    <div class="col-md-6">
                        <label for="category" class="form-label">Category</label>
                        <select class="form-select" name="category" id="category" required>
                            <option selected disabled>Choose...</option>
                            <option>Injection</option>
                            <option>Syrup</option>
                            <option>Ointment</option>
                            <option>Tablet/option>
                        </select>
                    </div>
                </div>

                <div class="row mb-3">
                    <div class="col-md-4">
                        <label for="price" class="form-label">Price (₹)</label>
                        <input type="number" class="form-control" name="price" id="price" placeholder="E.g. 120" required />
                    </div>
                    <div class="col-md-4">
                        <label for="status" class="form-label">Availability</label>
                        <select class="form-select" name="availability" id="status" required>
                            <option selected disabled>Choose...</option>
                            <option>Available</option>
                            <option>Out of Stock</option>
                        </select>
                    </div>
                    <div class="col-md-4">
                        <label for="image" class="form-label">Upload Image</label>
                        <input type="file" class="form-control" name="image" id="image" />
                    </div>
                </div>

                <div class="row mb-3">
                    <div class="row mb-3">
                        <div class="col-md-6">
                            <label for="contactNumber" class="form-label">Contact Number</label>
                            <input type="tel" class="form-control" name="contactNo" id="contactNumber"
                                   placeholder="E.g. +91 9876543210" required />
                        </div>
                        <div class="col-md-6">
                            <label for="address" class="form-label">Address</label>
                            <input type="text" class="form-control" name="address" id="address"
                                   placeholder="Enter Supplier Address" required />
                        </div>
                    </div>




                    <div class="mb-3">
                        <label for="desc" class="form-label">Description</label>
                        <textarea class="form-control" name="medicineDescription" id="desc" rows="3"
                                  placeholder="Enter item description..."></textarea>
                    </div>



                    <button type="submit" class="btn btn-dark px-4 mt-2">
                        <i class="fas fa-plus-circle me-1"></i> Add Item
                    </button>
            </form>
        </div>
    </main>

</div>





<!-- JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
<script>
    // Toggle sidebar
    document.getElementById('sidebarToggle').addEventListener('click', function () {
        document.getElementById('sidebarMenu').classList.toggle('show');
    });

    // Hide sidebar when clicking outside (optional for mobile)
    document.addEventListener('click', function (e) {
        const sidebar = document.getElementById('sidebarMenu');
        const toggle = document.getElementById('sidebarToggle');
        if (!sidebar.contains(e.target) && !toggle.contains(e.target)) {
            sidebar.classList.remove('show');
        }
    });


    function updateDateTime() {
        const now = new Date();
        const options = {
            weekday: 'long',
            year: 'numeric',
            month: 'long',
            day: 'numeric',
            hour: '2-digit',
            minute: '2-digit',
            hour12: true
        };
        const formattedDate = now.toLocaleString('en-IN', options);
        document.getElementById('currentDateTime').textContent = formattedDate;
    }

    // Initial call

    updateDateTime();

    // Optional: Update every minute
    setInterval(updateDateTime, 60000);
</script>
</body>

</html>