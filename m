Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i5AMC0020846
	for <linux-lvm@redhat.com>; Thu, 10 Jun 2004 18:12:01 -0400
Received: from localhost.localdomain (app.clientdynamics.net [66.45.103.235]
	(may be forged))
	by mx3.redhat.com (8.12.10/8.12.10) with ESMTP id i5AMBtXn022761
	for <linux-lvm@redhat.com>; Thu, 10 Jun 2004 18:11:55 -0400
Received: from [127.0.0.1] (localhost.localdomain [127.0.0.1])
	by localhost.localdomain (8.12.11/8.12.8) with ESMTP id i5AMAuTR030295
	for <linux-lvm@redhat.com>; Thu, 10 Jun 2004 17:10:56 -0500
Message-ID: <40C8DC70.7050404@coremetrics.com>
Date: Thu, 10 Jun 2004 17:10:56 -0500
From: Austin Gonyou <austin@coremetrics.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Multipath without round-robin?
References: <40C8DB58.9090203@coremetrics.com>
In-Reply-To: <40C8DB58.9090203@coremetrics.com>
Content-Type: multipart/alternative;
	boundary="------------090806080406000701020804"
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
--------------090806080406000701020804
Content-Type: text/plain; charset=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 7bit

Austin Gonyou wrote:

> You could just use the qlogic hba driver failover.
>
> ql2xfailover=1 in your rmodules.conf


One caveat, if you're not running with write cache mirroring on you your 
volumes, then no matter md or qla failover, you may get data corruption. 
Some apps don't run well with it on because of the performance hit.

> Jedi/Sector One wrote:
>
>>   Hello.
>>  
>>   I'm trying to get multipath working with LVM2 (2.6.7-rc2-udm2 
>> kernel) with
>> an LSI storage array.
>>
>>   The array has two FC controllers, HBAs are two identical Qlogic 2340.
>>  
>>   On the array, "preferred" controllers are assigned to each LUN.
>>  
>>   Unfortunately, it looks like dm-multipath always does round-robin load
>> balancing.
>>
>>   The result is that the array fills up the (SANtricity) error log with
>> messages like "LUN was accessed through the wrong controller".
>>
>>   Is there any way to keep failover abilities without load balancing?
>>  
>>   Best regards,
>>  
>>        -Frank.
>>       
>>


--------------090806080406000701020804
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
Austin Gonyou wrote:
<blockquote cite=3D"mid40C8DB58.9090203@coremetrics.com" type=3D"cite">
  <meta http-equiv=3D"Content-Type" content=3D"text/html; ">
  <title></title>
You could just use the qlogic hba driver failover. <br>
  <br>
ql2xfailover=3D1 in your rmodules.conf<br>
</blockquote>
<br>
One caveat, if you're not running with write cache mirroring on you
your volumes, then no matter md or qla failover, you may get data
corruption. Some apps don't run well with it on because of the
performance hit.<br>
<br>
<blockquote cite=3D"mid40C8DB58.9090203@coremetrics.com" type=3D"cite">Jedi=
/Sector
One wrote:
  <blockquote cite=3D"mid20040610203309.GA18186@c9x.org" type=3D"cite">
    <meta http-equiv=3D"Content-Type" content=3D"text/html; ">
    <meta name=3D"Generator"
 content=3D"MS Exchange Server version 5.5.2653.12">
    <title>[linux-lvm] Multipath without round-robin?</title>
    <p><font size=3D"2">=EF=BF=BD Hello.</font> <br>
    <font size=3D"2">=EF=BF=BD </font> <br>
    <font size=3D"2">=EF=BF=BD I'm trying to get multipath working with LVM2
(2.6.7-rc2-udm2 kernel) with</font> <br>
    <font size=3D"2">an LSI storage array.</font> </p>
    <p><font size=3D"2">=EF=BF=BD The array has two FC controllers, HBAs ar=
e two
identical Qlogic 2340.</font> <br>
    <font size=3D"2">=EF=BF=BD </font> <br>
    <font size=3D"2">=EF=BF=BD On the array, "preferred" controllers are as=
signed
to each LUN.</font> <br>
    <font size=3D"2">=EF=BF=BD </font> <br>
    <font size=3D"2">=EF=BF=BD Unfortunately, it looks like dm-multipath al=
ways
does round-robin load</font> <br>
    <font size=3D"2">balancing.</font> </p>
    <p><font size=3D"2">=EF=BF=BD The result is that the array fills up the
(SANtricity) error log with</font> <br>
    <font size=3D"2">messages like "LUN was accessed through the wrong
controller".</font> </p>
    <p><font size=3D"2">=EF=BF=BD Is there any way to keep failover abiliti=
es
without load balancing?</font> <br>
    <font size=3D"2">=EF=BF=BD </font> <br>
    <font size=3D"2">=EF=BF=BD Best regards,</font> <br>
    <font size=3D"2">=EF=BF=BD </font> <br>
    <font size=3D"2">=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=
 -Frank.</font> <br>
    <font size=3D"2">=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=
 </font> <br>
    <font size=3D"2"></font></p>
  </blockquote>
</blockquote>
<br>
</body>
</html>

--------------090806080406000701020804--
