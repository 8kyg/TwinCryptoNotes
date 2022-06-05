<%@ page import="java.util.Random" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<% Random random = new Random(); %>

<!DOCTYPE html>
<html>
<head>
    <title>TwinCryptoNote</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<body>

<div class="container">
<!--
<header class="">
    <div class="navbar navbar-dark bg-dark box-shadow">
        <div class="container d-flex justify-content-between">
            <a href="#" class="navbar-brand d-flex align-items-center">
                <strong>TwinCryptoNote</strong>
            </a>

        </div>
    </div>
</header>
-->


    <header class="d-flex flex-wrap justify-content-center py-3 mb-4 border-bottom">
        <a href="/" class="d-flex align-items-center mb-3 mb-md-0 me-md-auto text-dark text-decoration-none">
            <svg class="bi me-2" width="40" height="32"><use xlink:href="#bootstrap"></use></svg>
            <span class="fs-4">Twin Crypto Notes</span>
        </a>

        <ul class="nav nav-pills">
            <li class="nav-item"><a href="#" class="nav-link active" aria-current="page">Home</a></li>
            <li class="nav-item"><a href="#" class="nav-link">Features</a></li>
            <li class="nav-item"><a href="#" class="nav-link">Pricing</a></li>
            <li class="nav-item"><a href="#" class="nav-link">FAQs</a></li>
            <li class="nav-item"><a href="#" class="nav-link">About</a></li>
        </ul>
    </header>


    <main role="main">
    <section class="px-4 py-5 my-5 text-center">
        <div class="form-group">
                <H2><%= "Make Note" %></H2>
                    <br>
                    <textarea class="form-control bg-light text-center" id="text2crypt" style="height: 228px" aria-describedby="textdatadesc" placeholder="PutYourTextHere">Put Your Text Here </textarea>
                    <br/><br>
                    <a class="btn btn-primary btn-lg px-4 me-md-2 fw-bold" role="button" id="btn-createlink">Create!</a><br/>
        </div>
    </section>
</main>

<!--
<footer class="text-muted">
    <div class="container">
    <p>&copy; Company 2017-2018</p>
        <a href="TwinCryptoNote?read&id=8PsIJZBueT7uNbXp8Abm&nocache<%= random.nextInt(10000) %>">Read</a>
        <a href="TwinCryptoNote?data=testdatapakagewithrandomvalue<%= random.nextInt(10000) %>">Write</a>
        <a href="servlet2/dynamic_url_<%= random.nextInt(10000) %>?&nocache<%= random.nextInt(10000) %>">TechDataAboutServer</a>
            <p class="float-right">
            <a href="#">BackToTop</a>
        </p>
        <p><h3>TwinCryptoNote</h3></p>
    </div>
</footer>
-->

<footer class="d-flex flex-wrap justify-content-between align-items-center py-3 my-4 border-top">

    <a href="TwinCryptoNote?read&id=8PsIJZBueT7uNbXp8Abm&nocache<%= random.nextInt(10000) %>">Read</a>
    <a href="TwinCryptoNote?data=testdatapakagewithrandomvalue<%= random.nextInt(10000) %>">Write</a>
    <a href="servlet2/dynamic_url_<%= random.nextInt(10000) %>?&nocache<%= random.nextInt(10000) %>">TechDataAboutServer</a>

    <p class="mb-1">&copy; 2017–2022 TwinCryptoNotes</p>
    <ul class="list-inline">
        <li class="list-inline-item"><a href="#">Privacy</a></li>
        <li class="list-inline-item"><a href="#">Terms</a></li>
        <li class="list-inline-item"><a href="#">Support</a></li>
    </ul>
</footer>
</div>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js" crossorigin="anonymous"></script>
<!--<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
--><script src="script.js?nocache=<%= random.nextInt(100000) %>"></script>

</body>
</html>