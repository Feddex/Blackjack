<%-- 
    Document   : game
    Created on : 26-okt-2016, 17:45:04
    Author     : Anthony Lannoote
--%>

<%@page import="model.Card"%>
<%@page import="model.Dealer"%>
<%@page import="model.Game"%>
<%@page import="model.User"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>



        <%
            Game game = (Game) session.getAttribute("game");

            int turn = (Integer) (session.getAttribute("turn"));
            int userturn = (Integer) (session.getAttribute("userturn"));

            List<User> users = game.getUsers();
            Dealer dealer = game.getDealer();

        %>


        <form action="/Blackjack_Groep3/PlayGameServlet" method="post">
            <div id="tafel" style="position: absolute"> <img src="/Blackjack_Groep3/rescources/backgrounds/blackjacktable.png" width="1330" height="680"> </div>


            <div id="dealer" style="position: absolute; top: 30px; left: 580px;">

                <div id="dealericon" style="position: absolute; top: 50px; left: 160px;">
                    <img src="<%=dealer.getIcon().getLocation()%>" width="200" height="200"> 
                    <div id="dealername" style="position: absolute; top: 180px; left: 40px;">
                        <font color="white">Jabba The Dealer</font>

                        <font color="white"><% if (userturn == 10) {
                                out.print("value: " + dealer.getHand().getValue());
                            }%></font>
                    </div>
                </div>

                <%
                    List<Card> cardsDealer = dealer.getHand().getCards();
                    int positionleft = 0;
                    for (Card c : cardsDealer) {

                        out.print("<div style='position: absolute; top: 100px; left: " + positionleft + "px'>");

                        if (c.getVisable()) {
                            out.print("<img src='" + c.getCardImage() + "' width='70' height='100'/>");
                        } else {
                            out.print("<img src='" + c.getBackImage() + "' width='70' height='100'/>");
                        }

                        out.print("</div>");
                        positionleft += 20;
                    }

                %>

            </div>


            <div id="player1" style="position: absolute; top: 250px; left: 50px;">
                <%                    List<Card> cards = users.get(0).getHand().getCards();
                    positionleft = 0;
                    for (Card c : cards) {

                        out.print("<div style='position: absolute; top: 0px; left: " + positionleft + "px'>");
                        out.print("<img src='" + c.getCardImage() + "' width='70' height='100'/>");
                        out.print("</div>");
                        positionleft += 20;
                    }

                %>


                <div id="selectbet1" style="position: absolute; top: 110px; left: 0px;">
                    <input type="number" name="bet1" step="1" <%="value='" + users.get(0).getBet() + "'"%> min="1" <%= "max='" + users.get(0).getBalance() + "'"%> style="width: 40px;">
                </div>             
                <div id="icon1" style="position: absolute; top: 150px; left: 0px;">
                    <img src="<%=users.get(0).getIcon().getLocation()%>" alt="" width="100" height="100"/>
                    <div id="playername1" style="position: absolute; top: 110px; left: 30px;">
                        <font color="white"><%=users.get(0).getNickName()%></font>
                        <font color="white">value: <%=users.get(0).getHand().getValue()%></font>
                        <font color="white"><% if (users.get(0).getHand().getStatus() != null) {
                                out.print("HandStatus: " + users.get(0).getHand().getStatus());
                            }%></font>
                        <font color="white"><% if (users.get(0).getGameStatus() != null) {
                                out.print("GameStatus " + users.get(0).getGameStatus());
                            }%></font>
                    </div>
                </div>
                <div id="balance1" style="position: absolute; top: 120px; left: 110px;">
                    <img src="/Blackjack_Groep3/rescources/icons/currency.jpg" alt="" width="80" height="60"/>
                    <font color="white"><%=users.get(0).getBalance()%></font>
                </div>
            </div>  

            <div id="player2" style="position: absolute; top: 300px; left: 350px;">
                <%
                    cards = users.get(1).getHand().getCards();
                    positionleft = 0;
                    for (Card c : cards) {

                        out.print("<div style='position: absolute; top: 0px; left: " + positionleft + "px'>");
                        out.print("<img src='" + c.getCardImage() + "' width='70' height='100'/>");
                        out.print("</div>");
                        positionleft += 20;
                    }

                %>


                <div id="selectbet2" style="position: absolute; top: 110px; left: 0px;">
                    <input type="number" name="bet2" step="1" <%="value='" + users.get(1).getBet() + "'"%> min="1" <%= "max='" + users.get(1).getBalance() + "'"%> style="width: 40px;">
                </div>             
                <div id="icon2" style="position: absolute; top: 150px; left: 0px;">
                    <img src="<%=users.get(1).getIcon().getLocation()%>" alt="" width="100" height="100"/>
                    <div id="playername2" style="position: absolute; top: 110px; left: 30px;">
                        <font color="white"><%=users.get(1).getNickName()%></font>
                        <font color="white">value: <%=users.get(1).getHand().getValue()%></font>
                        <font color="white"><% if (users.get(1).getHand().getStatus() != null) {
                                out.print("HandStatus: " + users.get(1).getHand().getStatus());
                            }%></font>
                        <font color="white"><% if (users.get(1).getGameStatus() != null) {
                                out.print("GameStatus " + users.get(1).getGameStatus());
                            }%></font>
                    </div>
                </div>
                <div id="balance2" style="position: absolute; top: 120px; left: 110px;">
                    <img src="/Blackjack_Groep3/rescources/icons/currency.jpg" alt="" width="80" height="60"/>
                    <font color="white"><%=users.get(1).getBalance()%></font>
                </div>
            </div>  



            <div id="player3" style="position: absolute; top: 300px; left: 700px;">
                <%
                    cards = users.get(2).getHand().getCards();
                    positionleft = 0;
                    for (Card c : cards) {

                        out.print("<div style='position: absolute; top: 0px; left: " + positionleft + "px'>");
                        out.print("<img src='" + c.getCardImage() + "' width='70' height='100'/>");
                        out.print("</div>");
                        positionleft += 20;
                    }

                %>


                <div id="selectbet3" style="position: absolute; top: 110px; left: 0px;">
                    <input type="number" name="bet3" step="1" <%="value='" + users.get(2).getBet() + "'"%> min="1" <%= "max='" + users.get(2).getBalance() + "'"%> style="width: 40px;">
                </div>             
                <div id="icon3" style="position: absolute; top: 150px; left: 0px;">
                    <img src="<%=users.get(2).getIcon().getLocation()%>" alt="" width="100" height="100"/>
                    <div id="playername3" style="position: absolute; top: 110px; left: 30px;">
                        <font color="white"><%=users.get(2).getNickName()%></font>
                        <font color="white">value: <%=users.get(2).getHand().getValue()%></font>
                        <font color="white"><% if (users.get(2).getHand().getStatus() != null) {
                                out.print("HandStatus: " + users.get(2).getHand().getStatus());
                            }%></font>
                        <font color="white"><% if (users.get(2).getGameStatus() != null) {
                                out.print("GameStatus " + users.get(2).getGameStatus());
                            }%></font>
                    </div>
                </div>
                <div id="balance3" style="position: absolute; top: 120px; left: 110px;">
                    <img src="/Blackjack_Groep3/rescources/icons/currency.jpg" alt="" width="80" height="60"/>
                    <font color="white"><%=users.get(2).getBalance()%></font>
                </div>
            </div>  


            <div id="player4" style="position: absolute; top: 250px; left: 1000px;">
                <%
                    cards = users.get(3).getHand().getCards();
                    positionleft = 0;
                    for (Card c : cards) {

                        out.print("<div style='position: absolute; top: 0px; left: " + positionleft + "px'>");
                        out.print("<img src='" + c.getCardImage() + "' width='70' height='100'/>");
                        out.print("</div>");
                        positionleft += 20;
                    }

                %>


                <div id="selectbet4" style="position: absolute; top: 110px; left: 0px;">
                    <input type="number" name="bet4" step="1" <%="value='" + users.get(3).getBet() + "'"%> min="1" <%= "max='" + users.get(3).getBalance() + "'"%> style="width: 40px;">
                </div>             
                <div id="icon4" style="position: absolute; top: 150px; left: 0px;">
                    <img src="<%=users.get(3).getIcon().getLocation()%>" alt="" width="100" height="100"/>
                    <div id="playername4" style="position: absolute; top: 110px; left: 30px;">
                        <font color="white"><%=users.get(3).getNickName()%></font>
                        <font color="white">value: <%=users.get(3).getHand().getValue()%></font>
                        <font color="white"><% if (users.get(3).getHand().getStatus() != null) {
                                out.print("HandStatus: " + users.get(3).getHand().getStatus());
                            }%></font>
                        <font color="white"><% if (users.get(3).getGameStatus() != null) {
                                out.print("GameStatus " + users.get(3).getGameStatus());
                            }%></font>
                    </div>
                </div>
                <div id="balance4" style="position: absolute; top: 120px; left: 110px;">
                    <img src="/Blackjack_Groep3/rescources/icons/currency.jpg" alt="" width="80" height="60"/>
                    <font color="white"><%=users.get(3).getBalance()%></font>
                </div>
            </div>



            <%
                //controleren of de Playbutten moet worden verborgen of niet

                String visibility = "";
                if (turn != 0) {
                    visibility = "hidden";
                }
            %>


            <div id="playbutton" style="position: absolute; top: 500px; left: 1200px; visibility:<%=visibility%>;">
                <input type="image" src="/Blackjack_Groep3/rescources/icons/Yoda - 02.png" alt="submit" width="150" height="150">
                <font color="black"><%=turn%></font>
                <font color="blue"><%=userturn%></font>
            </div>

        </form>

        <%
            //vragen of de speler wil hitten of standen.

            visibility = "";
            if (turn < 1 || userturn == 10) {
                visibility = "hidden";
            }
        %>


        <form action="/Blackjack_Groep3/PlayGameHitStandServlet">
            <div style="position: absolute; top: 80px; left: 160px; visibility:<%=visibility%>;">
                <img src="/Blackjack_Groep3/rescources/backgrounds/backgroundHitStand.jpg" alt="" width="300" height="150"/>
                <div style="position: absolute; top: 50px; left: 50px;">
                    <input type="text" name="user" value="<% if (userturn < 10) {
                            out.print(users.get(userturn).getNickName());
                        }%>" readonly>
                    <div style="position: absolute; top: 40px; left: 0px;">
                        <input type="submit" name="action" value="stand">
                        <input type="submit" name="action" value="hit">
                    </div>
                </div>

            </div>
        </form>

        <%

            //vragen of de speler opnieuw wil spelen of met een andere selectie van spelers?
            visibility = "";
            if (userturn != 10) {
                visibility = "hidden";
            }
        %>


        <form action="/Blackjack_Groep3/PlayAgainServlet">
            <div style="position: absolute; top: 80px; left: 160px; visibility:<%=visibility%>;">
                <img src="/Blackjack_Groep3/rescources/backgrounds/backgroundHitStand.jpg" alt="" width="300" height="150"/>
                <div style="position: absolute; top: 50px; left: 50px;">
                    <div style="position: absolute; top: 40px; left: 0px;">
                        <button type="button" name="Spelers Kiezen" onclick="window.location = '/Blackjack_Groep3/ResetChoiceServlet';">Spelers Kiezen</button>
                        <input type="submit" value="Opnieuw Spelen">
                    </div>
                </div>

            </div>
        </form>


    </body>


</html>
