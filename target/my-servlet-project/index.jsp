<!DOCTYPE html>
<html>
<head>
    <title>Servlet Example</title>
    <style>
        body {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            font-family: Arial, sans-serif;
            background-color: #f0f0f0;
        }
        .container {
            text-align: center;
        }
        .button {
            display: inline-block;
            padding: 20px 40px;
            margin: 20px;
            font-size: 20px;
            color: white;
            background-color: #007bff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }
        .button:hover {
            background-color: #0056b3;
        }
        .button:active {
            background-color: #004080;
        }
        #result {
            margin-top: 20px;
            font-size: 20px;
        }
    </style>
</head>
<body>
    <div class="container">
        <button class="button" onclick="fetchData('/my-servlet-project/hello')">Hello World</button>
        <button class="button" onclick="fetchData('/my-servlet-project/hello-v2')">Hello World Version 2</button>
        <div id="result"></div>
    </div>
    <script>
        async function fetchData(endpoint) {
            try {
                const response = await fetch(endpoint);
                if (!response.ok) {
                    throw new Error('Network response was not ok');
                }
                const data = await response.json();
                document.getElementById('result').innerText = data.content;
            } catch (error) {
                document.getElementById('result').innerText = 'Error fetching data';
            }
        }
    </script>
</body>
</html>
