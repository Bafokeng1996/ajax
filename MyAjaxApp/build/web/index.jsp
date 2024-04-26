<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Auto-Completion using AJAX</title>
    <script type="text/javascript" src="javascript.js"></script>
    <style>
        body {
            font-family: Arial, sans-serif;
            line-height: 1.6;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }

        h1 {
            color: #333;
            text-align: center;
            margin-top: 50px;
        }

        p {
            color: #666;
            text-align: center;
        }

        form {
            margin: 30px auto;
            text-align: center;
        }

        table {
            margin: 0 auto;
            border-collapse: collapse;
            width: 80%;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        th, td {
            padding: 10px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        input[type="text"] {
            width: 90%;
            padding: 8px;
            border: 1px solid #ddd;
            border-radius: 4px;
        }

        #auto-completion-results {
            border: 1px solid #ddd;
            border-radius: 4px;
            padding: 10px;
            margin-top: 10px;
            background-color: #f9f9f9;
        }
    </style>
</head>
<body onload="init()">
    <h1>Auto-Completion using AJAX</h1>
    
    <p>This example shows how you can do real-time auto-completion using Asynchronous JavaScript and XML (Ajax) interactions.</p>

    <p>In the form below, enter a name. Possible names that will be completed are displayed below the form. For example, try typing in "Bach," "Mozart," or "Stravinsky," then click on one of the selections to see composer details.</p>

    <form name="autofillform" action="autocomplete" method="GET">
        <!-- Input field for composer name -->
        <table>
            <thead>
                <tr>
                    <th>Composer Name:</th>
                    <th>
                        <input type="text" size="40" id="complete-field" onkeyup="doCompletion();">
                        <!-- Hidden input fields for action and composer ID -->
                        <input type="hidden" name="action" id="action" value="complete">
                        <input type="hidden" name="id" id="composer-id" value="">
                    </th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td colspan="2">
                        <!-- This is where auto-completion results will be displayed -->
                        <div id="auto-completion-results"></div>
                    </td>
                </tr>
            </tbody>
        </table>
    </form>
</body>
</html>
