<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Customer Management</title>

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
      color: #fff;
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
    <a class="navbar-brand ms-2" href="#">Pharma Flow</a>

    <div class="collapse navbar-collapse justify-content-end">
      <ul class="navbar-nav">
        <li class="nav-item">
          <a class="nav-link" href="#"><i class="fas fa-user-circle me-1"></i>Hello Staff!!</a>
        </li>
      </ul>
    </div>
  </div>
</nav>

<!-- Layout -->
<div class="d-flex">
  <!-- Sidebar -->
  <nav id="sidebarMenu" class="sidebar col-md-3 col-lg-2 d-md-block p-3">
    <div class="d-flex flex-column align-items-start gap-2">
      <h4 class="fw-bold">Pharma Flow</h4>
      <ul class="nav flex-column w-100">
        <li class="nav-item mb-2">
          <a class="nav-link d-flex align-items-center gap-2" href="index2.jsp">
            <i class="fa-solid fa-money-bill"></i><span>Billing</span>
          </a>
        </li>
        <li class="nav-item mb-2">
          <a class="nav-link d-flex align-items-center gap-2 active" href="CM.jsp">
            <i class="fa-regular fa-id-card"></i><span>Customer Management</span>
          </a>
        </li>
        <li class="nav-item mb-2">
          <a class="nav-link d-flex align-items-center gap-2 active" href="CustTable.jsp">
            <i class="fa-solid fa-table-columns"></i><span>Customer Table</span>
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

  <!-- Content Area -->
  <div class="content container-fluid">
    <h2 class="mb-4">👥 Customer Management</h2>

    <!-- Add Customer Form -->
    <div class="card p-4 mb-4 shadow-sm">
      <h5 class="mb-3">Add New Customer</h5>
      <form action="insertCustomer" method="post" class="row g-3">
        <div class="col-md-4">
          <label class="form-label">Customer Name</label>
          <input type="text" class="form-control" name="customerName" placeholder="Enter name">
        </div>
        <div class="col-md-4">
          <label class="form-label">Age</label>
          <input type="number" class="form-control" name="age" placeholder="Enter age">
        </div>
        <div class="col-md-4">
          <label class="form-label">Gender</label>
          <select class="form-select" name="gender">
            <option>Male</option>
            <option>Female</option>
            <option>Other</option>
          </select>
        </div>
        <div class="col-md-6">
          <label class="form-label">Contact</label>
          <input type="text" class="form-control" name="contactNo" placeholder="Phone number">
        </div>
        <div class="col-md-6">
          <label class="form-label">Address</label>
          <input type="text" class="form-control" name="address" placeholder="Enter address">
        </div>
        <div class="col-md-6">
          <label class="form-label">Email</label>
          <input type="email" class="form-control" name="email" placeholder="Enter email">
        </div>
        <div class="col-12">
          <button class="btn btn-dark"><i class="fa fa-save"></i> Save Customer</button>
        </div>
      </form>
    </div>

    <!-- Customer Records Table -->

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
