<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>
<script type="text/javascript" language="javascript">
    var showOrHide = false;
    $(function () {
        $(".hideOver").click(function () {
            if (showOrHide == false) {
                showOrHide = true;
                $(this).css("overflow", "scroll");
                $(this).animate({
                    height: "150px"
                }, 300)


            } else {
                showOrHide = false;
                $(this).css("overflow", "hidden");
                $(this).animate({
                    height: "43px"
                }, 300)

            }
        });
    });
    </script>