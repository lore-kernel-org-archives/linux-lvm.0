Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l8JFQxA2014899
	for <linux-lvm@redhat.com>; Wed, 19 Sep 2007 11:26:59 -0400
Received: from postman.formosahost.com (postman.formosahost.com [203.190.4.19])
	by mx1.redhat.com (8.13.1/8.13.1) with ESMTP id l8JFQloh013015
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Wed, 19 Sep 2007 11:26:51 -0400
Received: from localhost (localhost [127.0.0.1])
	by postman.formosahost.com (Postfix) with ESMTP id 9870D8A264
	for <linux-lvm@redhat.com>; Wed, 19 Sep 2007 23:23:17 +0800 (CST)
Received: from postman.formosahost.com ([127.0.0.1])
	by localhost (postman.formosahost.com [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id 2XCd8F6p3gXV for <linux-lvm@redhat.com>;
	Wed, 19 Sep 2007 23:23:15 +0800 (CST)
Received: from [192.168.0.6] (61-56-145-65-adsl-tpe.STATIC.so-net.net.tw
	[61.56.145.65])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by postman.formosahost.com (Postfix) with ESMTP id D13998A263
	for <linux-lvm@redhat.com>; Wed, 19 Sep 2007 23:23:14 +0800 (CST)
Message-ID: <46F13FE5.6010905@ezpear.com>
Date: Wed, 19 Sep 2007 23:27:33 +0800
From: Hans <hans@ezpear.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] lvm HA problem with  file descriptor left open
References: <46E4F110.6040003@ezpear.com>
	<20070917213319.GV18444@agk.fab.redhat.com>
In-Reply-To: <20070917213319.GV18444@agk.fab.redhat.com>
Content-Type: multipart/alternative;
	boundary="------------060506060201070208030401"
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
To: LVM general discussion and development <linux-lvm@redhat.com>

This is a multi-part message in MIME format.
--------------060506060201070208030401
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Alasdair G Kergon wrote:
> On Mon, Sep 10, 2007 at 03:24:00PM +0800, hans wrote:
>   
>> File descriptor 5 left open File descriptor 6 left open File descriptor
>> 7 left open File descriptor 8 left open File descriptor 9 left open File
>> descriptor 10 left open File descriptor 11 left open File descriptor 12
>> left open 0 logical volume(s) in volume group "vg0_sites" now active
>> Is it possible to force LVM
>> to close descriptors?
>>     
>  
> Those are only harmless warnings - LVM2 does close the file descriptors.
> It is only fatal under some selinux configurations.
>
> Alasdair
>   

Thanks for answer.
But I don't think it is harmless. When my server shutdown , and my 
backup is up high availability doesn't work.
DRBD  doesn't start because of this error.
After I manual set up drbd active, I can not see files created on main 
machine .
After I again start main machine and start DRBD I can see all files.
I think it is problem with descriptors which cause errors in my HA.
I heard that I can use CLVM, but I don't know how it is compatible with LVM.

Regards,
Hans

--------------060506060201070208030401
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
  <meta content="text/html;charset=ISO-8859-1" http-equiv="Content-Type">
</head>
<body bgcolor="#ffffff" text="#000000">
Alasdair G Kergon wrote:
<blockquote cite="mid:20070917213319.GV18444@agk.fab.redhat.com"
 type="cite">
  <pre wrap="">On Mon, Sep 10, 2007 at 03:24:00PM +0800, hans wrote:
  </pre>
  <blockquote type="cite">
    <pre wrap="">File descriptor 5 left open File descriptor 6 left open File descriptor
7 left open File descriptor 8 left open File descriptor 9 left open File
descriptor 10 left open File descriptor 11 left open File descriptor 12
left open 0 logical volume(s) in volume group "vg0_sites" now active
Is it possible to force LVM
to close descriptors?
    </pre>
  </blockquote>
  <pre wrap=""><!----> 
Those are only harmless warnings - LVM2 does close the file descriptors.
It is only fatal under some selinux configurations.

Alasdair
  </pre>
</blockquote>
<br>
Thanks for answer.<br>
But I don't think it is harmless. When my server shutdown , and my
backup is up high availability doesn't work.<br>
DRBD&nbsp; doesn't start because of this error. <br>
After I manual set up drbd active, I can not see files created on main
machine .<br>
After I again start main machine and start DRBD I can see all files. <br>
I think it is problem with descriptors which cause errors in my HA. <br>
I heard that I can use CLVM, but I don't know how it is compatible with
LVM.<br>
<br>
Regards,<br>
Hans<br>
</body>
</html>

--------------060506060201070208030401--
