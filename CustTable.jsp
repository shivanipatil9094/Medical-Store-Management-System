<%@ page import="Services.CustService" %>
<%@ page import="Configuration.JDBCConnection" %>
<%@ page import="java.util.List" %>
<%@ page import="Model.CustM" %>
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
    <main class="content">
        <div class="d-flex justify-content-between align-items-center pt-3 pb-2 mb-4 border-bottom rounded">
            <h1 class="h4">Add New Customer</h1>
            <p class="text-muted mb-0" id="currentDateTime"></p>
        </div>
        <div class="card shadow-sm p-4 rounded">
            <div class="d-flex justify-content-between align-items-center mb-4 flex-column flex-md-row gap-3">
                <h5 class="mb-0">Customer Table</h5>
                <input type="text" id="searchBoxCustomer" class="form-control w-100 w-md-50" placeholder="🔍 Search customers..." />
            </div>

            <table id="CustomerTable" class="table table-bordered table-hover">
                <thead class="table-dark">
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Age</th>
                    <th>Gender</th>
                    <th>Contact no</th>
                    <th>Address</th>
                    <th>Email</th>
                    <th>Added Date</th>
                    <th>Actions</th>
                </tr>
                </thead>
                <tbody>
                </tbody>
                <%
                    try{
                        CustService ps = new CustService(JDBCConnection.getConnection());
                        List<CustM> al = ps.allCustomer();
                        for(CustM rs : al){

                %>
                <tr>
                    <td><%= rs.getCustomerId() %></td>
                    <td><%= rs.getCustomerName() %></td>
                    <td><%= rs.getAge() %></td>
                    <td><%= rs.getGender() %></td>
                    <td><%= rs.getContact() %></td>
                    <td><%= rs.getAddress() %></td>
                    <td><%= rs.getEmail() %></td>
<%--                    <td><%= rs.getActions() %></td>--%>

                    <td>
                        <div class="d-flex gap-2">
                            <a href="updateCust.jsp?CustomerID=<%=rs.getCustomerId()%>" class="btn btn-sm btn-update px-3">
                                <i class="fas fa-edit me-1"></i> Update
                            </a>
                            <a href="delete?CustomerID =<%=rs.getCustomerId()%>" class="btn btn-sm btn-delete px-3">
                                <i class="fas fa-trash-alt me-1"></i>Delete
                            </a>
                        </div>
                    </td>
                </tr>
                <%
                    }
                    }catch(Exception e){
                            e.printStackTrace();
                }
                %>
            </table>
            <div class="d-flex justify-content-end gap-2 mt-4">
                <button class="btn btn-outline-danger" onclick="downloadPDFCustomer()">
                    <i class="fas fa-file-pdf me-1"></i> Export PDF
                </button>
                <button class="btn btn-outline-success" onclick="downloadExcelCustomer()">
                    <i class="fas fa-file-excel me-1"></i> Export Excel
                </button>
            </div>
        </div>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.17.5/xlsx.full.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.5.1/jspdf.umd.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/1.4.1/html2canvas.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
        <script>
            // Sidebar Toggle
            <script>
                // Sidebar Toggle
                document.getElementById('sidebarToggle').addEventListener('click', () => {
                document.getElementById('sidebarMenu').classList.toggle('show');
            });

                // Auto-hide sidebar on mobile
                document.addEventListener('click', (e) => {
                const sidebar = document.getElementById('sidebarMenu');
                const toggle = document.getElementById('sidebarToggle');
                if (!sidebar.contains(e.target) && !toggle.contains(e.target)) {
                sidebar.classList.remove('show');
            }
            });

                // Live Date/Time Display
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
                document.getElementById('currentDateTime').textContent = now.toLocaleString('en-IN', options);
            }
                updateDateTime();
                setInterval(updateDateTime, 60000);

                // Live Search in Customer Table
                document.getElementById('searchBoxCustomer').addEventListener('keyup', function () {
                const query = this.value.toLowerCase();
                const rows = document.querySelectorAll('#CustomerTable tbody tr');
                rows.forEach(row => {
                const rowText = row.innerText.toLowerCase();
                row.style.display = rowText.includes(query) ? '' : 'none';
            });
            });

                // Export Customer Table as PDF
                function downloadPDFCustomer() {
                const { jsPDF } = window.jspdf;
                const doc = new jsPDF('l', 'pt', 'a4');

                html2canvas(document.getElementById('CustomerTable')).then(canvas => {
                const imgData = canvas.toDataURL('image/png');
                const pdfWidth = doc.internal.pageSize.getWidth();
                const pdfHeight = (canvas.height * pdfWidth) / canvas.width;
                doc.addImage(imgData, 'PNG', 20, 20, pdfWidth - 40, pdfHeight);
                doc.save("customer_table.pdf");
            });
            }

                // Export Customer Table as Excel
                function downloadExcelCustomer() {
                const table = document.getElementById('CustomerTable');
                const wb = XLSX.utils.table_to_book(table, { sheet: "Customer" });
                XLSX.writeFile(wb, 'customer_table.xlsx');
            }
        </script>
    </main>
</div>
</body>
</html>
