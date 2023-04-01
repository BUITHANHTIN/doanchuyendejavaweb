<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: AN515-43
  Date: 3/28/2023
  Time: 3:07 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Property</title>
</head>
<body>
<div class="hero-wrap" style="background-image: url('images/bg_1.jpg');">
  <div class="overlay"></div>
  <div class="container">
    <div class="row no-gutters slider-text align-items-center justify-content-center">
      <div class="col-md-9 ftco-animate text-center">
        <p class="breadcrumbs"><span class="mr-2"><a href="index.html">Home</a></span> <span>Property</span></p>
        <h1 class="mb-3 bread">Property</h1>
      </div>
    </div>
  </div>
</div>

<section class="ftco-search">
  <div class="container">
    <div class="row">
      <div class="col-md-12 search-wrap">
        <h2 class="heading h5 d-flex align-items-center pr-4"><span class="ion-ios-search mr-3"></span> Search Property</h2>
        <form action="#" class="search-property">
          <div class="row">
            <div class="col-md align-items-end">
              <div class="form-group">
                <label for="#">Keyword</label>
                <div class="form-field">
                  <div class="icon"><span class="icon-my_location"></span></div>
                  <input type="text" class="form-control" placeholder="Keyword">
                </div>
              </div>
            </div>
            <div class="col-md align-items-end">
              <div class="form-group">
                <label for="#">Location</label>
                <div class="form-field">
                  <div class="icon"><span class="icon-my_location"></span></div>
                  <input type="text" class="form-control" placeholder="City/Locality Name">
                </div>
              </div>
            </div>
            <div class="col-md align-items-end">
              <div class="form-group">
                <label for="#">Property Type</label>
                <div class="form-field">
                  <div class="select-wrap">
                    <div class="icon"><span class="ion-ios-arrow-down"></span></div>
                    <select name="" id="" class="form-control">
                      <option value="">Type</option>
                      <option value="">Commercial</option>
                      <option value="">- Office</option>
                      <option value="">Residential</option>
                      <option value="">Villa</option>
                      <option value="">Condominium</option>
                      <option value="">Apartment</option>
                    </select>
                  </div>
                </div>
              </div>
            </div>
            <div class="col-md align-items-end">
              <div class="form-group">
                <label for="#">Property Status</label>
                <div class="form-field">
                  <div class="select-wrap">
                    <div class="icon"><span class="ion-ios-arrow-down"></span></div>
                    <select name="" id="" class="form-control">
                      <option value="">Type</option>
                      <option value="">Rent</option>
                      <option value="">Sale</option>
                    </select>
                  </div>
                </div>
              </div>
            </div>
            <div class="col-md align-items-end">
              <div class="form-group">
                <label for="#">Agents</label>
                <div class="form-field">
                  <div class="select-wrap">
                    <div class="icon"><span class="ion-ios-arrow-down"></span></div>
                    <select name="" id="" class="form-control">
                      <option value="">Any</option>
                      <option value="">Jonh Doe</option>
                      <option value="">Doe Mags</option>
                      <option value="">Kenny Scott</option>
                      <option value="">Emily Storm</option>
                    </select>
                  </div>
                </div>
              </div>
            </div>
          </div>

          <div class="row">
            <div class="col-md align-items-end">
              <div class="form-group">
                <label for="#">Min Beds</label>
                <div class="form-field">
                  <div class="select-wrap">
                    <div class="icon"><span class="ion-ios-arrow-down"></span></div>
                    <select name="" id="" class="form-control">
                      <option value="">1</option>
                      <option value="">2</option>
                      <option value="">3</option>
                      <option value="">4</option>
                      <option value="">5</option>
                    </select>
                  </div>
                </div>
              </div>
            </div>
            <div class="col-md align-items-end">
              <div class="form-group">
                <label for="#">Min Bathroom</label>
                <div class="form-field">
                  <div class="select-wrap">
                    <div class="icon"><span class="ion-ios-arrow-down"></span></div>
                    <select name="" id="" class="form-control">
                      <option value="">1</option>
                      <option value="">2</option>
                      <option value="">3</option>
                      <option value="">4</option>
                      <option value="">5</option>
                    </select>
                  </div>
                </div>
              </div>
            </div>
            <div class="col-md align-items-end">
              <div class="form-group">
                <label for="#">Min Price</label>
                <div class="form-field">
                  <div class="select-wrap">
                    <div class="icon"><span class="ion-ios-arrow-down"></span></div>
                    <select name="" id="" class="form-control">
                      <option value="">Min Price</option>
                      <option value="">$1,000</option>
                      <option value="">$5,000</option>
                      <option value="">$10,000</option>
                      <option value="">$50,000</option>
                      <option value="">$100,000</option>
                      <option value="">$200,000</option>
                      <option value="">$300,000</option>
                      <option value="">$400,000</option>
                      <option value="">$500,000</option>
                      <option value="">$600,000</option>
                      <option value="">$700,000</option>
                      <option value="">$800,000</option>
                      <option value="">$900,000</option>
                      <option value="">$1,000,000</option>
                    </select>
                  </div>
                </div>
              </div>
            </div>
            <div class="col-md align-items-end">
              <div class="form-group">
                <label for="#">Min Price</label>
                <div class="form-field">
                  <div class="select-wrap">
                    <div class="icon"><span class="ion-ios-arrow-down"></span></div>
                    <select name="" id="" class="form-control">
                      <option value="">Min Price</option>
                      <option value="">$5,000</option>
                      <option value="">$10,000</option>
                      <option value="">$50,000</option>
                      <option value="">$100,000</option>
                      <option value="">$200,000</option>
                      <option value="">$300,000</option>
                      <option value="">$400,000</option>
                      <option value="">$500,000</option>
                      <option value="">$600,000</option>
                      <option value="">$700,000</option>
                      <option value="">$800,000</option>
                      <option value="">$900,000</option>
                      <option value="">$1,000,000</option>
                      <option value="">$2,000,000</option>
                    </select>
                  </div>
                </div>
              </div>
            </div>
            <div class="col-md align-items-end">
              <div class="form-group">
                <label for="#">Min Area <span>(sq ft)</span></label>
                <div class="form-field">
                  <div class="icon"><span class="icon-my_location"></span></div>
                  <input type="text" class="form-control" placeholder="Min Area">
                </div>
              </div>
            </div>
            <div class="col-md align-items-end">
              <div class="form-group">
                <label for="#">Max Area <span>(sq ft)</span></label>
                <div class="form-field">
                  <div class="icon"><span class="icon-my_location"></span></div>
                  <input type="text" class="form-control" placeholder="Max Area">
                </div>
              </div>
            </div>
            <div class="col-md align-self-end">
              <div class="form-group">
                <div class="form-field">
                  <input type="submit" value="Search" class="form-control btn btn-primary">
                </div>
              </div>
            </div>
          </div>
        </form>
      </div>
    </div>
  </div>
</section>


<section class="ftco-section bg-light">
  <div class="container">
    <div class="row">
      <c:forEach var="item" items="${showAllBuilding}">
      <div class="col-md-4 ftco-animate">
        <div class="properties">
          <a href="property-single.html" class="img img-2 d-flex justify-content-center align-items-center" style="background-image: url(${item.avatar});">
            <div class="icon d-flex justify-content-center align-items-center">
              <span class="icon-search2"></span>
            </div>
          </a>
          <div class="text p-3">
            <span class="status sale">Sale</span>
            <div class="d-flex">
              <div class="one">
                <h3><a href="property-single.html">${item.address}</a></h3>
                <p>${item.type}</p>
              </div>
              <div class="two">
                <span class="price">$${item.rentPrice}</span>
              </div>
            </div>
            <p>${item.description}</p>
            <hr>
            <p class="bottom-area d-flex">
              <span><i class="flaticon-selection"></i>${item.floorArea} m²</span>
              <span class="ml-auto"><i class="flaticon-bathtub"></i> ${item.bathroom}</span>
              <span><i class="flaticon-bed"></i> ${item.bedroom}</span>
            </p>
          </div>
        </div>
      </div>
      </c:forEach>
    </div>
    <div class="row mt-5">
      <div class="col text-center">
        <div class="block-27">
          <ul>
            <li><a href="#">&lt;</a></li>
            <li class="active"><span>1</span></li>
            <li><a href="#">2</a></li>
            <li><a href="#">3</a></li>
            <li><a href="#">4</a></li>
            <li><a href="#">5</a></li>
            <li><a href="#">&gt;</a></li>
          </ul>
        </div>
      </div>
    </div>
  </div>
</section>
</body>
</html>