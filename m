Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l3GJ3oMx032201
	for <linux-lvm@redhat.com>; Mon, 16 Apr 2007 15:03:50 -0400
Received: from web36108.mail.mud.yahoo.com (web36108.mail.mud.yahoo.com
	[66.163.179.222])
	by mx1.redhat.com (8.13.1/8.13.1) with SMTP id l3GJ3mWq027185
	for <linux-lvm@redhat.com>; Mon, 16 Apr 2007 15:03:49 -0400
Date: Mon, 16 Apr 2007 14:03:42 -0400 (EDT)
From: Liviu Dan <nliviudan@yahoo.ca>
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="0-1981739239-1176746622=:10615"
Content-Transfer-Encoding: 8bit
Message-ID: <54501.10615.qm@web36108.mail.mud.yahoo.com>
Subject: [linux-lvm] LV striping
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@redhat.com

--0-1981739239-1176746622=:10615
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit

I hope this is the right way to post a message for the group.
   
  I have 2 RAID 5 arrays each with 9 HDs (3ware 9550SX controllers).  I have created a volume group and a LV to perform some write tests.  I am currently able to write on the LV at approx 113MB/sec.  I was hoping for something in the range of 400MB/sec considering the worse case scenario of a hard drive writing at 29MB/sec.  The most confusing part for me is that I get the 113MB/sec when I create the LV with one stripe and I only get aprox. 60MB.sec when I create the LV with 2 stripes.  From what I've been reading on the net, the LV should perform better when the number of stripes is equal with the number of physical volumes (2 in my case).  Has anyone encountered similar issues?
   
  I would appreciate any suggestions/answers.

       
---------------------------------
All new Yahoo! Mail  
---------------------------------
Get news delivered. Enjoy RSS feeds right on your Mail page.
--0-1981739239-1176746622=:10615
Content-Type: text/html; charset=iso-8859-1
Content-Transfer-Encoding: 8bit

<DIV>I hope this is the right way to post a message for the group.</DIV>  <DIV>&nbsp;</DIV>  <DIV>I have 2 RAID&nbsp;5 arrays each with 9 HDs (3ware 9550SX controllers).&nbsp; I have created a volume group and a LV to perform some write tests.&nbsp; I am currently able to write on the LV at approx 113MB/sec.&nbsp; I was hoping for something in the range of 400MB/sec considering the worse case scenario of a hard drive writing at 29MB/sec.&nbsp; The most confusing part for me is that I get the 113MB/sec when I create the LV with one stripe and I only get aprox. 60MB.sec when I create the LV with 2 stripes.&nbsp; From what I've been reading on the net, the LV should perform better when the number of stripes is equal with the number of physical volumes (2 in my case).&nbsp; Has anyone encountered similar issues?</DIV>  <DIV>&nbsp;</DIV>  <DIV>I would appreciate any suggestions/answers.</DIV><p>&#32;
      <hr size=1><a href="http://us.rd.yahoo.com/evt=40705/*http://mrd.mail.yahoo.com/try_beta?.intl=ca"><b>All new Yahoo! Mail </b></a> 
<hr size=1>Get news delivered. Enjoy RSS feeds right on your Mail page.
--0-1981739239-1176746622=:10615--
