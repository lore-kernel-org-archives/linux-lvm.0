Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i5AM7G019362
	for <linux-lvm@redhat.com>; Thu, 10 Jun 2004 18:07:16 -0400
Received: from localhost.localdomain (app.clientdynamics.net [66.45.103.235]
	(may be forged))
	by mx1.redhat.com (8.12.10/8.12.10) with ESMTP id i5AM7Fi5004277
	for <linux-lvm@redhat.com>; Thu, 10 Jun 2004 18:07:16 -0400
Received: from [127.0.0.1] (localhost.localdomain [127.0.0.1])
	by localhost.localdomain (8.12.11/8.12.8) with ESMTP id i5AM6GL4030239
	for <linux-lvm@redhat.com>; Thu, 10 Jun 2004 17:06:16 -0500
Message-ID: <40C8DB58.9090203@coremetrics.com>
Date: Thu, 10 Jun 2004 17:06:16 -0500
From: Austin Gonyou <austin@coremetrics.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Multipath without round-robin?
References: <20040610203309.GA18186@c9x.org>
In-Reply-To: <20040610203309.GA18186@c9x.org>
Content-Type: multipart/alternative;
	boundary="------------060102000600040105090602"
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
To: LVM general discussion and development <linux-lvm@redhat.com>

This is a multi-part message in MIME format.
--------------060102000600040105090602
Content-Type: text/plain; charset=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 7bit

You could just use the qlogic hba driver failover.

ql2xfailover=1 in your rmodules.conf

Jedi/Sector One wrote:

>   Hello.
>  
>   I'm trying to get multipath working with LVM2 (2.6.7-rc2-udm2 
> kernel) with
> an LSI storage array.
>
>   The array has two FC controllers, HBAs are two identical Qlogic 2340.
>  
>   On the array, "preferred" controllers are assigned to each LUN.
>  
>   Unfortunately, it looks like dm-multipath always does round-robin load
> balancing.
>
>   The result is that the array fills up the (SANtricity) error log with
> messages like "LUN was accessed through the wrong controller".
>
>   Is there any way to keep failover abilities without load balancing?
>  
>   Best regards,
>  
>        -Frank.
>       
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>


--------------060102000600040105090602
Content-Type: text/html; charset="iso-8859-15"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
  <meta content=3D"text/html;charset=3DISO-8859-15"
 http-equiv=3D"Content-Type">
  <title></title>
</head>
<body bgcolor=3D"#ffffff" text=3D"#000000">
You could just use the qlogic hba driver failover. <br>
<br>
ql2xfailover=3D1 in your rmodules.conf<br>
<br>
Jedi/Sector One wrote:
<blockquote cite=3D"mid20040610203309.GA18186@c9x.org" type=3D"cite">
  <meta http-equiv=3D"Content-Type" content=3D"text/html; ">
  <meta name=3D"Generator"
 content=3D"MS Exchange Server version 5.5.2653.12">
  <title>[linux-lvm] Multipath without round-robin?</title>
  <p><font size=3D"2">=EF=BF=BD Hello.</font>
  <br>
  <font size=3D"2">=EF=BF=BD </font>
  <br>
  <font size=3D"2">=EF=BF=BD I'm trying to get multipath working with LVM2
(2.6.7-rc2-udm2 kernel) with</font>
  <br>
  <font size=3D"2">an LSI storage array.</font>
  </p>
  <p><font size=3D"2">=EF=BF=BD The array has two FC controllers, HBAs are =
two
identical Qlogic 2340.</font>
  <br>
  <font size=3D"2">=EF=BF=BD </font>
  <br>
  <font size=3D"2">=EF=BF=BD On the array, "preferred" controllers are assi=
gned
to each LUN.</font>
  <br>
  <font size=3D"2">=EF=BF=BD </font>
  <br>
  <font size=3D"2">=EF=BF=BD Unfortunately, it looks like dm-multipath alwa=
ys
does round-robin load</font>
  <br>
  <font size=3D"2">balancing.</font>
  </p>
  <p><font size=3D"2">=EF=BF=BD The result is that the array fills up the
(SANtricity) error log with</font>
  <br>
  <font size=3D"2">messages like "LUN was accessed through the wrong
controller".</font>
  </p>
  <p><font size=3D"2">=EF=BF=BD Is there any way to keep failover abilities
without load balancing?</font>
  <br>
  <font size=3D"2">=EF=BF=BD </font>
  <br>
  <font size=3D"2">=EF=BF=BD Best regards,</font>
  <br>
  <font size=3D"2">=EF=BF=BD </font>
  <br>
  <font size=3D"2">=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD -=
Frank.</font>
  <br>
  <font size=3D"2">=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD <=
/font>
  <br>
  <font size=3D"2">_______________________________________________</font>
  <br>
  <font size=3D"2">linux-lvm mailing list</font>
  <br>
  <font size=3D"2"><a class=3D"moz-txt-link-abbreviated" href=3D"mailto:lin=
ux-lvm@redhat.com">linux-lvm@redhat.com</a></font>
  <br>
  <font size=3D"2"><a
 href=3D"https://www.redhat.com/mailman/listinfo/linux-lvm"
 target=3D"_blank">https://www.redhat.com/mailman/listinfo/linux-lvm</a></f=
ont>
  <br>
  <font size=3D"2">read the LVM HOW-TO at <a
 href=3D"http://tldp.org/HOWTO/LVM-HOWTO/" target=3D"_blank">http://tldp.or=
g/HOWTO/LVM-HOWTO/</a></font>
  </p>
</blockquote>
<br>
</body>
</html>

--------------060102000600040105090602--
