#!/bin/bash
#This file contain the code which helps to open firefox or website
echo "------------------------------------------------------------"
echo " 1.Google and it's few products "
echo " 2.Opening Blog edit page "
echo " 3.Opening Blogger help page "
echo " 4.Opening java API page "
echo " 5.Opening Android Documentation page "
echo " 6.Microsoft account home page"
echo " 7.view or edit unity game engine"
echo " 8.Whatsapp web"
echo " 9.GST Website"
echo " 10.code cousrse "
echo " 11.github "
echo " 12.LinkedIn "
echo " 13.Exit "
echo "------------------------------------------------------------"

read option

open()
{
    printf "\t \t Opening wait \n"
}

Google()
{
    echo "------------------------------------------------------------"
    echo " 1.search"
    echo " 2.Gmail"
    echo " 3.Drive"
    echo " 4.youtube"
    echo " 5.Admob"

    read option
    case $option in

     1)open;firefox www.google.com;;
     2)open;firefox https://mail.google.com/mail/u/0/'#inbox';;
     3)open;firefox https://drive.google.com/drive/my-drive ;;
     4)open;firefox https://www.youtube.com/ ;;
     5)open;firefox https://apps.admob.com/v2/home?_ga=2.73474070.526818933.1639743166-187211920.1639743166
     ;;
     *)echo "------------------------------------------------------------";exit;;
     esac
}

code_course(){
    echo "------------------------------------------------------------"
    echo " 1.Hacker Rank "
    echo " 2.Forge "
    echo " 3.Infosys"
    echo " 4.codechef "
    echo "------------------------------------------------------------" 

read option

case $option in
1)open;firefox https://www.hackerrank.com/auth/login;;
2)open;firefox https://www.theforage.com/dashboard?ref=rsKeQwcmAJF6jj3ct;;
3)open;firefox https://infyspringboard.onwingspan.com/web/en/page/home;;
4)open;firefox https://www.codechef.com/contests/?itm_medium=navmenu&itm_campaign=allcontests
;;
*)echo "------------------------------------------------------------";exit ;;
esac
echo "------------------------------------------------------------"

}

case $option in
1)Google ;;
2)open;firefox https://www.blogger.com/blog/posts/1075323307131268901;;
3)open;firefox https://support.google.com/blogger/?hl=en#topic=3339243;;
4)open;firefox https://docs.oracle.com/en/java/javase/14/docs/api/index.html;;
5)open;firefox https://developer.android.com/docs;;
6)open;echo " You can use MS Office using microsoft accoun in web "
firefox https://www.office.com/?auth=1;;
7)open;firefox https://id.unity.com/en/account/edit;;
8)open;firefox https://web.whatsapp.com/;;
9)open;firefox https://www.ewaybillgst.gov.in/login.aspx;;
10)code_course;;
11)open;firefox https://github.com/;;
12)open;firefox https://www.linkedin.com/feed/;;
*)echo "------------------------------------------------------------"
exit;;
esac
echo "------------------------------------------------------------"
unset -v option
