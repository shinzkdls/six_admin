<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style>
    #item_img{
        width:80px;
    }
    .card-body{
        text-align: center;
        align-items: center;
    }
</style>
<main>
    <div class="container-fluid px-4">
        <h1 class="mt-4">Items List</h1>
        <ol class="breadcrumb mb-4">
            <li class="breadcrumb-item"><a href="/">Dashboard</a></li>
            <li class="breadcrumb-item active">Item All</li>
        </ol>

        <div class="card mb-4">
            <div class="card-header">
                <i class="fas fa-table me-1"></i>
                Items
            </div>
            <div class="card-body">
                <table id="datatablesSimple">
                    <thead>
                    <tr>
                        <th>Pic</th>
                        <th>No.</th>
                        <th>Name</th>
                        <th>Price</th>
                        <th>Category</th>
                        <th>Small</th>
                        <th>Medium</th>
                        <th>Large</th>
                        <th>Registration Date</th>
                    </tr>
                    </thead>
                    <tfoot>
                    <tr>
                        <th>Pic</th>
                        <th>No.</th>
                        <th>Name</th>
                        <th>Price</th>
                        <th>Category</th>
                        <th>Small</th>
                        <th>Medium</th>
                        <th>Large</th>
                        <th>Registration Date</th>
                    </tr>
                    </tfoot>
                    <tbody>
                    <c:forEach var="obj" items="${clist}">
                        <tr>
                            <td>
                                <a href="#" data-toggle="modal" data-target="#target${obj.id}">
                                    <img id="item_img" src="/uimg/${obj.imgname}">
                                </a>
                            </td>
                            <td>${obj.id}</td>
                            <td>${obj.name}</td>
                            <td><fmt:formatNumber type="number" pattern="###,###원" value="${obj.price}"/></td>
                            <td>${obj.category}</td>
                            <td>${obj.size_s}</td>
                            <td>${obj.size_m}</td>
                            <td>${obj.size_l}</td>
                            <td><fmt:formatDate   pattern="yyyy-MM-dd" value="${obj.rdate}"/></td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</main>