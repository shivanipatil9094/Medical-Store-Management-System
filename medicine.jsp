<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Medicine Inventory Form</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" />
    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css2?family=Pacifico&display=swap" rel="stylesheet">

    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #eaf7f4;
            overflow-x: hidden;
        }

        .navbar {
            background-color: #009688;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
        }

        .navbar-brand,
        .navbar-nav .nav-link {
            color: #ffffff;
        }

        .navbar-brand:hover,
        .navbar-nav .nav-link:hover {
            color: #ffd6c9;
        }

        /* Sidebar */
        .sidebar {
            background: #004d40;
            border-right: 1px solid #80cbc4;
            height: 100vh;
            overflow-y: auto;
            transition: all 0.3s ease;
            z-index: 1050;
        }

        .sidebar::-webkit-scrollbar {
            width: 6px;
        }

        .sidebar::-webkit-scrollbar-thumb {
            background-color: #80cbc4;
            border-radius: 3px;
        }

        .sidebar .nav-link {
            color: #b2dfdb;
            font-weight: 500;
            padding: 10px 16px;
            border-radius: 50px;
            transition: 0.3s ease;
        }

        .sidebar .nav-link:hover {
            background-color: #26a69a;
            color: #fff;
            transform: translateX(5px);
        }

        .sidebar .nav-link.active {
            background-color: #ff7043;
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
            background: linear-gradient(135deg, #37474f, #263238);
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
            background-color: #ff7043;
            border: none;
        }

        .btn-dark:hover {
            background-color: #f4511e;
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
                    <a class="nav-link d-flex align-items-center gap-2" href="index.jsp">
                        <i class="fas fa-chart-line"></i><span>Dashboard</span>
                    </a>
                </li>
                <li class="nav-item mb-2">
                    <a class="nav-link d-flex align-items-center gap-2" href="form.jsp">
                        <i class="fa-solid fa-capsules"></i><span>Suppliers Form</span>
                    </a>
                </li>
                <li class="nav-item mb-2">
                    <a class="nav-link d-flex align-items-center gap-2 active" href="medicine.jsp">
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
    <main class="content">
        <div class="d-flex justify-content-between align-items-center pt-3 pb-2 mb-4 border-bottom rounded">
            <h1 class="h4">Medicine Inventory Form</h1>
            <p class="text-muted" id="currentDateTime"></p>
        </div>

        <!-- Stylish Medicine Inventory Form -->
        <div class="card shadow-sm p-4 rounded" style="background-color: #ffffff;">
            <form action="insertMedicine" method="post">
                <div class="row mb-3">
                    <div class="col-md-6">
                        <label for="medicineName" class="form-label">Medicine Name</label>
                        <input type="text" class="form-control" name="medicineName" id="medicineName" placeholder="E.g. Paracetamol"
                               required />
                    </div>
                    <div class="col-md-6">
                        <label for="batchNo" class="form-label">Batch No.</label>
                        <input type="text" class="form-control" name="batchNo" id="batchNo" placeholder="E.g. BATCH123"
                               required />
                    </div>
                </div>

                <div class="row mb-3">
                    <div class="col-md-4">
                        <label for="mfgDate" class="form-label">Mfg. Date</label>
                        <input type="date" class="form-control" name="mfgDate" id="mfgDate" required />
                    </div>
                    <div class="col-md-4">
                        <label for="expDate" class="form-label">Exp. Date</label>
                        <input type="date" class="form-control" name="expDate" id="expDate" required />
                    </div>
                    <div class="col-md-4">
                        <label for="quantity" class="form-label">Quantity</label>
                        <input type="number" class="form-control" name="quantity" id="quantity" placeholder="E.g. 100"
                               required />
                    </div>
                </div>

                <div class="row mb-3">
                    <div class="col-md-6">
                        <label for="supplier" class="form-label">Supplier Name</label>
                        <input type="text" class="form-control" name="supplier" id="supplier" placeholder="Enter supplier name"
                               required />
                    </div>
                    <div class="col-md-6">
                        <label for="price" class="form-label">Price (₹ per unit)</label>
                        <input type="number" class="form-control" name="price" id="price" placeholder="E.g. 20" required />
                    </div>
                </div>

                <div class="mb-3">
                    <label for="remarks" class="form-label">Remarks</label>
                    <textarea class="form-control" id="remarks" rows="3"
                              placeholder="Special notes about storage, side-effects etc."></textarea>
                </div>

                <button type="submit" class="btn btn-dark px-4 mt-2">
                    <i class="fas fa-plus-circle me-1"></i> Add Medicine
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

    // Hide sidebar when clicking outside (mobile)
    document.addEventListener('click', function (e) {
        const sidebar = document.getElementById('sidebarMenu');
        const toggle = document.getElementById('sidebarToggle');
        if (!sidebar.contains(e.target) && !toggle.contains(e.target)) {
            sidebar.classList.remove('show');
        }
    });

    // Date & Time update
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
    updateDateTime();
    setInterval(updateDateTime, 60000);
</script>
</body>

</html>
