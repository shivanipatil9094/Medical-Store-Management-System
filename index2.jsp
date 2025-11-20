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
      background-color: #eaf7f4;
      /* mint background */
      overflow-x: hidden;
    }

    .navbar {
      background-color: #009688;
      /* teal navbar */
      box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
    }

    .navbar-brand,
    .navbar-nav .nav-link {
      color: #fff;
    }

    .navbar-brand:hover,
    .navbar-nav .nav-link:hover {
      color: #ffd6c9;
      /* light coral hover */
    }

    /* Sidebar */
    .sidebar {
      background: #004d40;
      /* dark teal */
      backdrop-filter: blur(8px);
      border-right: 1px solid #80cbc4;
      /* aqua border */
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
      /* aqua scrollbar */
      border-radius: 3px;
    }

    .sidebar .nav-link {
      color: #b2dfdb;
      /* light teal text */
      font-weight: 500;
      padding: 10px 16px;
      border-radius: 50px;
      transition: 0.3s ease;
    }

    .sidebar .nav-link:hover {
      background-color: #26a69a;
      /* lighter teal hover */
      color: #fff;
      transform: translateX(5px);
    }

    .sidebar .nav-link.active {
      background-color: #ff7043;
      /* coral active */
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
      background: linear-gradient(135deg, #37474f, #263238);
      /* slate gradient */
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
      /* coral button */
      border: none;
    }

    .btn-dark:hover {
      background-color: #f4511e;
      /* darker coral hover */
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
          <a class="nav-link" href="#"><i class="fas fa-user-circle me-1"></i>Hello Staff!!</a>
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
          <a class="nav-link d-flex align-items-center gap-2 active" href="index2.jsp">
            <i class="fa-solid fa-money-bill"></i><span>Billing</span>
          </a>
        </li>
        <li class="nav-item mb-2">
          <a class="nav-link d-flex align-items-center gap-2" href="CM.jsp">
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
    <h2 class="mb-4 text-teal">💊 Billing Dashboard</h2>

    <!-- Billing Form -->
    <div class="card p-4 mb-4 shadow-sm">
      <h5 class="mb-3">Customer & Bill Details</h5>
      <form class="row g-3">
        <div class="col-md-4">
          <label class="form-label">Bill No.</label>
          <input type="text" class="form-control" placeholder="Auto-generated" readonly>
        </div>
        <div class="col-md-4">
          <label class="form-label">Date</label>
          <input type="date" class="form-control">
        </div>
        <div class="col-md-4">
          <label class="form-label">Customer Name</label>
          <input type="text" class="form-control" placeholder="Enter customer name">
        </div>
        <div class="col-md-4">
          <label class="form-label">Contact</label>
          <input type="text" class="form-control" placeholder="Enter phone number">
        </div>
        <div class="col-md-4">
          <label class="form-label">Payment Mode</label>
          <select class="form-select">
            <option>Cash</option>
            <option>Card</option>
            <option>UPI</option>
            <option>Credit</option>
          </select>
        </div>
      </form>
    </div>

    <!-- Medicine Table -->
    <div class="card p-4 shadow-sm">
      <h5 class="mb-3">Medicines</h5>
      <table class="table table-bordered align-middle">
        <thead class="table-success">
        <tr>
          <th>Medicine ID</th>
          <th>Medicine Name</th>
          <th>Batch No.</th>
          <th>Expiry Date</th>
          <th>Qty</th>
          <th>Price/Unit</th>
          <th>Discount (%)</th>
          <th>Total</th>
          <th>Action</th>
        </tr>
        </thead>
        <tbody>
        <tr>
          <td><input type="text" class="form-control" placeholder="ID"></td>
          <td><input type="text" class="form-control" placeholder="Medicine Name"></td>
          <td><input type="text" class="form-control" placeholder="Batch"></td>
          <td><input type="date" class="form-control"></td>
          <td><input type="number" class="form-control" placeholder="0"></td>
          <td><input type="number" class="form-control" placeholder="0.00"></td>
          <td><input type="number" class="form-control" placeholder="0"></td>
          <td><input type="text" class="form-control" readonly></td>
          <td><button class="btn btn-dark btn-sm"><i class="fa fa-trash"></i></button></td>
        </tr>
        </tbody>
      </table>
      <button class="btn btn-dark"><i class="fa fa-plus"></i> Add Medicine</button>
    </div>

    <!-- Bill Summary -->
    <div class="card p-4 mt-4 shadow-sm">
      <h5 class="mb-3">Bill Summary</h5>
      <div class="row g-3">
        <div class="col-md-4">
          <label class="form-label">Subtotal</label>
          <input type="text" class="form-control" value="0.00" readonly>
        </div>
        <div class="col-md-4">
          <label class="form-label">Tax (GST)</label>
          <input type="text" class="form-control" value="0.00" readonly>
        </div>
        <div class="col-md-4">
          <label class="form-label">Grand Total</label>
          <input type="text" class="form-control" value="0.00" readonly>
        </div>
      </div>
      <div class="mt-3">
        <button class="btn btn-dark"><i class="fa fa-save"></i> Save Bill</button>
        <button class="btn btn-dark"><i class="fa fa-print"></i> Print Bill</button>
      </div>
    </div>
  </div>
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
</script>
</body>

</html>
