<?php
function table($heading, $text, $url)
{
  echo "<table border='0' cellpadding='1' bgcolor='#000000' width='600'>
  <tr>
    <td>
      <table border='0' cellpadding='0' cellspacing='0' bgcolor='#334455' width='600'>
        <tr>
          <td>
            <font color='#ffffff'><b>
                <li>$heading
              </b></font>
          </td>
        </tr>
        <tr>
          <td bgcolor='#eaeaea'> $text<br><a href='$url'>$url</a></td>
        </tr>
      </table>
    </td>
  </tr>
</table><br>\n";
}

table("Linux Operating system", "Linux, developed by a student who is Linus Torvalds. For More Information..", "https://www.linux.org/");
table("PHP", "PHP is an open source code which is used to develop websites.", "http://www.php.org");
