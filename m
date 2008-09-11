Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m8BFiJcE018742
	for <linux-lvm@redhat.com>; Thu, 11 Sep 2008 11:44:19 -0400
Received: from mail-gx0-f15.google.com (mail-gx0-f15.google.com
	[209.85.217.15])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m8BFhZCo000449
	for <linux-lvm@redhat.com>; Thu, 11 Sep 2008 11:43:35 -0400
Received: by gxk8 with SMTP id 8so9633744gxk.3
	for <linux-lvm@redhat.com>; Thu, 11 Sep 2008 08:43:35 -0700 (PDT)
Message-ID: <779919740809110843x3b3e7853sd871427e6f5cfb24@mail.gmail.com>
Date: Thu, 11 Sep 2008 09:43:34 -0600
From: "Jeremy Lyon" <jerlyon@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/alternative; 
	boundary="----=_Part_37388_486811.1221147814470"
Subject: [linux-lvm] striping questions
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

------=_Part_37388_486811.1221147814470
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Howdy everyone,

I've got a couple questions regarding striping....

1. Is it possible to convert a LV from linear to striped mapping or would I
have to create a new LV with striped mapping and move data from the old LV
to the new?

2. Is it better to stripe with device-mapper or LVM or a combination of
both.  We have 77 33.1GB LUNs that we will be creating many GFS file systems
from.  Our current thought is to have all of the LUNs in one VG for easier
management.  I'm looking for pros and cons of striping with device-mapper
vs. LVM, for 1) performance and 2) manageability (adding future LUNs and
extending file systems, etc...).

TIA
Jeremy

------=_Part_37388_486811.1221147814470
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

<div dir="ltr">Howdy everyone,<br><br>I&#39;ve got a couple questions regarding striping....<br><br>1. Is it possible to convert a LV from linear to striped mapping or would I have to create a new LV with striped mapping and move data from the old LV to the new?<br>
<br>2. Is it better to stripe with device-mapper or LVM or a combination of both.&nbsp; We have 77 33.1GB LUNs that we will be creating many GFS file systems from.&nbsp; Our current thought is to have all of the LUNs in one VG for easier management.&nbsp; I&#39;m looking for pros and cons of striping with device-mapper vs. LVM, for 1) performance and 2) manageability (adding future LUNs and extending file systems, etc...).<br>
<br>TIA<br>Jeremy<br></div>

------=_Part_37388_486811.1221147814470--
