Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i1IGcCi22145
	for <linux-lvm@redhat.com>; Wed, 18 Feb 2004 11:38:12 -0500
Received: from mail3.unigiciel.com (route3.unigiciel.com [206.162.172.138])
	by mx1.redhat.com (8.11.6/8.11.6) with SMTP id i1IGcCb15844
	for <linux-lvm@redhat.com>; Wed, 18 Feb 2004 11:38:12 -0500
Received: from xeyrus.unigiciel.com (xeyrus.unigiciel.com [192.168.53.161])
	by mail3.unigiciel.com (8.12.8/8.12.8) with ESMTP id i1IGcAhc018412
	for <linux-lvm@redhat.com>; Wed, 18 Feb 2004 11:38:10 -0500
From: Daniel =?ISO-8859-1?Q?Ch=E9nard?= <dchenard@croesus.com>
Content-Type: multipart/alternative; boundary="=-Wa0jngYi7hy9tMsYPD65"
Message-Id: <1077122257.2134.12.camel@xeyrus>
Mime-Version: 1.0
Subject: [linux-lvm] LVM2: vgscan is long...
Sender: linux-lvm-admin@redhat.com
Errors-To: linux-lvm-admin@redhat.com
Reply-To: linux-lvm@redhat.com
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Post: <mailto:linux-lvm@redhat.com>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm/>
Date: Wed Feb 18 11:37:01 2004
List-Id: <linux-lvm.redhat.com>
To: LVM-MaillingList <linux-lvm@redhat.com>

--=-Wa0jngYi7hy9tMsYPD65
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mail3.unigiciel.com id i1IGcAhc018412

In my lvm.conf, I have set my filter=20

filter =3D [ "a|hda*|", "a|hdb*|", "a|hdc*|" ]
filter =3D [ "r|cdrom|", "r|hdd*|" ]

but, when I do=20

time lvm vgscan
  Reading all physical volumes.  This may take a while...
=20
real    3m41.199s
user    0m0.889s
sys     0m1.088s

and ps -ef show me many modprobe -q -- block_major*

So, in my rc.sysinit,  I do=20
"action $"Setting up Logical Volume Management:" /sbin/lvm vgscan
--mknodes && /sbin/lvm vgchange -a y"

So, 3m41.19 for a vgscan is too long for me.  Anybody could help me to
reduce this time??



Daniel Ch=E9nard=20
Croesus Finansoft Inc.
R=E9put=E9 pour cr=E9er de la richesse
=20
Croesus Finansoft Inc.
2 Place Laval, Suite 510
Laval, Quebec
Canada H7N 5N6
Site Web: www.croesus.com
=20
dchenard@croesus.com
Tel: +1 450-662-6101, 145
Fax: +1 450-662-3629

PS: The Light at the End of The Tunnel
     will be turned off until further
     notice due to budget cutbacks.
                             --The Management

--=-Wa0jngYi7hy9tMsYPD65
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 TRANSITIONAL//EN">
<HTML>
<HEAD>
  <META HTTP-EQUIV="Content-Type" CONTENT="text/html; CHARSET=UTF-8">
  <META NAME="GENERATOR" CONTENT="GtkHTML/3.0.9">
</HEAD>
<BODY>
In my lvm.conf, I have set my filter <BR>
<BR>
filter = [ &quot;a|hda*|&quot;, &quot;a|hdb*|&quot;, &quot;a|hdc*|&quot; ]<BR>
filter = [ &quot;r|cdrom|&quot;, &quot;r|hdd*|&quot; ]<BR>
<BR>
but, when I do <BR>
<BR>
time lvm vgscan<BR>
&nbsp; Reading all physical volumes.&nbsp; This may take a while...<BR>
 <BR>
real&nbsp;&nbsp;&nbsp; 3m41.199s<BR>
user&nbsp;&nbsp;&nbsp; 0m0.889s<BR>
sys&nbsp;&nbsp;&nbsp;&nbsp; 0m1.088s<BR>
<BR>
and ps -ef show me many modprobe -q -- block_major*<BR>
<BR>
So, in my rc.sysinit,&nbsp; I do <BR>
&quot;action $&quot;Setting up Logical Volume Management:&quot; /sbin/lvm vgscan --mknodes &amp;&amp; /sbin/lvm vgchange -a y&quot;<BR>
<BR>
So, 3m41.19 for a vgscan is too long for me.&nbsp; Anybody could help me to reduce this time??<BR>
<BR>
<BR>
<BR>
<TABLE CELLSPACING="0" CELLPADDING="0" WIDTH="100%">
<TR>
<TD>
<PRE>Daniel Ch&#233;nard 
Croesus Finansoft Inc.
R&#233;put&#233; pour cr&#233;er de la richesse
 
Croesus Finansoft Inc.
2 Place Laval, Suite 510
Laval, Quebec
Canada H7N 5N6
Site Web: www.croesus.com
 
dchenard@croesus.com
Tel: +1 450-662-6101, 145
Fax: +1 450-662-3629

PS: The Light at the End of The Tunnel
&nbsp;&nbsp;&nbsp;&nbsp; will be turned off until further
&nbsp;&nbsp;&nbsp;&nbsp; notice due to budget cutbacks.
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; --The Management</PRE>
</TD>
</TR>
</TABLE>

</BODY>
</HTML>

--=-Wa0jngYi7hy9tMsYPD65--
