<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script>
    $(function () {
        charts1.init();
        $('#month_val').change(function () {
            charts1.getdatasales();
        });
        charts2.init();
    })

    let charts1 = {
        init: function () {
            this.getdatasales();
        },
        getdatasales: function () {
            var month_val = $('#month_val').val();
            $.ajax({
                url: '/getdatasales',
                data: {month: month_val},
                success: function (result) {
                    charts1.display(result);
                }
            });
        },
        display: function (result) {
            Highcharts.chart('myAreaChart1', {
                chart: {
                    type: 'line'
                },
                title: {
                    text: 'Daily Sales'
                },
                xAxis: {
                    categories: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31]
                },
                yAxis: {
                    title: {
                        text: 'Daily Sales(won)'
                    }
                },
                plotOptions: {
                    line: {
                        dataLabels: {
                            enabled: true
                        },
                        enableMouseTracking: false
                    }
                },
                series: [{
                    name: 'Daily Sales',
                    data: result
                }]
            });
        }
    }

    let charts2 = {
        init: function () {
            this.getdatasales();
        },
        getdatasales: function () {
            $.ajax({
                url: '/getdatasalessum',
                success: function (result) {
                    charts2.display(result);
                }
            });
        },
        display: function (result) {
            Highcharts.chart('myBarChart2', {
                title: {
                    text: 'Monthly Sales by Gender',
                    align: 'left'
                },
                xAxis: {
                    categories: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec']
                },
                yAxis: {
                    title: {
                        text: 'Sales(million)'
                    }
                },
                tooltip: {
                    valueSuffix: ' million'
                },
                plotOptions: {
                    series: {
                        borderRadius: '25%'
                    }
                },
                series: [{
                    type: 'column',
                    name: 'Male',
                    data: result.Male
                }, {
                    type: 'column',
                    name: 'Female',
                    data: result.Female
                }, {
                    type: 'spline',
                    name: 'Total',
                    data: result.Sum,
                    marker: {
                        lineWidth: 2,
                        lineColor: Highcharts.getOptions().colors[3],
                        fillColor: 'white'
                    }
                }]
            });
        }
    }
</script>

<main>
    <div class="container-fluid px-4">
        <h1 class="mt-4">6 Shoppers Admin System</h1>
        <ol class="breadcrumb mb-4">
            <li class="breadcrumb-item active">Dashboard</li>
        </ol>
        <div class="row">
            <div class="col-xl-3 col-md-6">
                <div class="card bg-primary text-white mb-4">
                    <div class="card-body"><fmt:formatNumber type="number" value="${salesData.sum}"
                                                             pattern="###,###원"/></div>
                    <div class="card-footer d-flex align-items-center justify-content-between">
                        <a class="small text-white stretched-link" href="#">Cumulative Sales Revenue</a>
                        <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                    </div>
                </div>
            </div>
            <div class="col-xl-3 col-md-6">
                <div class="card bg-warning text-white mb-4">
                    <div class="card-body"><fmt:formatNumber type="number" value="${salesData.avg}"
                                                             pattern="###,###원"/></div>
                    <div class="card-footer d-flex align-items-center justify-content-between">
                        <a class="small text-white stretched-link" href="#">Average Daily Revenue</a>
                        <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                    </div>
                </div>
            </div>
            <div class="col-xl-3 col-md-6">
                <div class="card bg-success text-white mb-4">
                    <div class="card-body"><fmt:formatNumber type="number" value="${salesData.max}"
                                                             pattern="###,###원"/></div>
                    <div class="card-footer d-flex align-items-center justify-content-between">
                        <a class="small text-white stretched-link" href="#">Maximum Daily Revenue</a>
                        <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                    </div>
                </div>
            </div>
            <div class="col-xl-3 col-md-6">
                <div class="card bg-danger text-white mb-4">
                    <div class="card-body"><fmt:formatNumber type="number" value="${salesData.min}"
                                                             pattern="###,###원"/></div>
                    <div class="card-footer d-flex align-items-center justify-content-between">
                        <a class="small text-white stretched-link" href="#">Lowest Daily Revenue</a>
                        <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-xl-6">
                <div class="card mb-4">
                    <div class="card-header" style="display: flex; justify-content: space-between">
                        <div>
                            <i class="fas fa-chart-area me-1"></i>
                            Daily Sales
                        </div>
                        <div class="col-sm-1.5">
                            <select class="form-control" id="month_val" name="month_val" style="font-size: 8pt">
                                <option value="01">Jan</option>
                                <option value="02">Feb</option>
                                <option value="03">Mar</option>
                                <option value="04">Apr</option>
                                <option value="05">May</option>
                                <option value="06">Jun</option>
                                <option value="07">Jul</option>
                                <option value="08">Aug</option>
                                <option value="09">Sep</option>
                                <option value="10">Oct</option>
                                <option value="11">Nov</option>
                                <option value="12">Dec</option>
                            </select>
                        </div>
                    </div>
                    <div class="card-body">
                        <div id="myAreaChart1" width="100%" height="40"></div>
                    </div>
                </div>
            </div>
            <div class="col-xl-6">
                <div class="card mb-4">
                    <div class="card-header">
                        <i class="fas fa-chart-bar me-1"></i>
                        Monthly Sales by Gender
                    </div>
                    <div class="card-body">
                        <div id="myBarChart2" width="100%" height="40"></div>
                    </div>
                </div>
            </div>
        </div>
        <div class="card mb-4">
            <div class="card-header">
                <i class="fas fa-table me-1"></i>
                Customers
            </div>
            <div class="card-body">
                <table id="datatablesSimple">
                    <thead>
                    <tr>
                        <th>ID</th>
                        <th>NAME</th>
                        <th>ADDRESS</th>
                        <th>PHONE</th>
                        <th>GENDER</th>
                        <th>RESET PASSWORD</th>
                    </tr>
                    </thead>
                    <%--                    <tfoot>--%>
                    <%--                    <tr>--%>
                    <%--                        <th>Name</th>--%>
                    <%--                        <th>Position</th>--%>
                    <%--                        <th>Office</th>--%>
                    <%--                        <th>Age</th>--%>
                    <%--                        <th>Start date</th>--%>
                    <%--                        <th>Salary</th>--%>
                    <%--                    </tr>--%>
                    <%--                    </tfoot>--%>
                    <tbody>
                    <c:forEach var="obj" items="${custList}">
                        <tr>
                            <td>${obj.id}</td>
                            <td>${obj.name}</td>
                            <td>${obj.address}</td>
                            <td>${obj.phone}</td>
                            <td>${obj.gender}</td>
                            <td>
                                <a href="/cust/updateimpl/?id=${obj.id}" class="btn btn-danger" role="button">Reset</a>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</main>

