Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i7BCYWa09972
	for <linux-lvm@redhat.com>; Wed, 11 Aug 2004 08:34:32 -0400
Received: from smtp.pspl.co.in (www.pspl.co.in [202.54.11.65] (may be forged))
	by mx1.redhat.com (8.12.10/8.12.10) with ESMTP id i7BCYUe1021491
	for <linux-lvm@redhat.com>; Wed, 11 Aug 2004 08:34:30 -0400
Received: from ps2181.persistent.co.in ([10.44.50.16]) (authenticated bits=0)
	by smtp.pspl.co.in (8.12.9/8.12.9) with ESMTP id i7BCYYD4014377
	for <linux-lvm@redhat.com>; Wed, 11 Aug 2004 18:04:34 +0530
From: sridhar surampudi <sridhar_surampudi@persistent.co.in>
Content-Type: multipart/mixed; boundary="=-wX8hHPaJ2cK9YIBF/SaT"
Message-Id: <1092227663.2155.10.camel@ps2181>
Mime-Version: 1.0
Date: 11 Aug 2004 18:04:23 +0530
Subject: [linux-lvm] problem in remounting the logical volume in 2.6.7 kernel
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
To: linux-lvm@redhat.com


--=-wX8hHPaJ2cK9YIBF/SaT
Content-Type: text/plain
Content-Transfer-Encoding: 7bit



--=-wX8hHPaJ2cK9YIBF/SaT
Content-Disposition: inline
Content-Description: Forwarded message - Returned mail: see transcript for
	details
Content-Type: message/rfc822

Return-Path: <>
Received: from mail5.intranet.persistent.co.in ([unix socket]) by mail5
	(Cyrus v2.1.12) with LMTP; Wed, 11 Aug 2004 17:58:25 +0530
X-Sieve: CMU Sieve 2.2
Received: from smtp.pspl.co.in (smtp.pspl.co.in [202.54.11.65]) by
	mail5.intranet.persistent.co.in (8.12.5/8.12.4) with ESMTP id
	i7BCSP91012458 for <sridhar_surampudi@mail5.intranet.persistent.co.in>; 
	Wed, 11 Aug 2004 17:58:25 +0530
Received: from localhost (localhost) by smtp.pspl.co.in (8.12.9/8.12.9) id
	i7BCSND3013792; Wed, 11 Aug 2004 17:58:23 +0530
Date: Wed, 11 Aug 2004 17:58:23 +0530
From: Mail Delivery Subsystem <MAILER-DAEMON@persistent.co.in>
Message-Id: <200408111228.i7BCSND3013792@smtp.pspl.co.in>
To: <sridhar_surampudi@persistent.co.in>
MIME-Version: 1.0
Content-Type: multipart/report; report-type=delivery-status;
	boundary="i7BCSND3013792.1092227303/smtp.pspl.co.in"
Subject: Returned mail: see transcript for details
Auto-Submitted: auto-generated (failure)

This is a MIME-encapsulated message

--i7BCSND3013792.1092227303/smtp.pspl.co.in
Content-Transfer-Encoding: 7bit

The original message was received at Wed, 11 Aug 2004 17:58:22 +0530
from [10.44.50.16]

   ----- The following addresses had permanent fatal errors -----
<linux-lvm@redhat>
    (reason: 550 Host unknown)

   ----- Transcript of session follows -----
550 5.1.2 <linux-lvm@redhat>... Host unknown (Name server: redhat: host not found)

--i7BCSND3013792.1092227303/smtp.pspl.co.in
Content-Type: message/delivery-status
Content-Transfer-Encoding: 7bit

Reporting-MTA: dns; smtp.pspl.co.in
Received-From-MTA: DNS; [10.44.50.16]
Arrival-Date: Wed, 11 Aug 2004 17:58:22 +0530

Final-Recipient: RFC822; linux-lvm@redhat
Action: failed
Status: 5.1.2
Remote-MTA: DNS; redhat
Diagnostic-Code: SMTP; 550 Host unknown
Last-Attempt-Date: Wed, 11 Aug 2004 17:58:23 +0530

--i7BCSND3013792.1092227303/smtp.pspl.co.in
Content-Type: message/rfc822

Return-Path: <sridhar_surampudi@persistent.co.in>
Received: from ps2181.persistent.co.in ([10.44.50.16]) (authenticated
	bits=0) by smtp.pspl.co.in (8.12.9/8.12.9) with ESMTP id i7BCSMD4013786
	for <linux-lvm@redhat>; Wed, 11 Aug 2004 17:58:22 +0530
Subject: problem in mounting a LVM in linux 2.6.7
From: sridhar surampudi <sridhar_surampudi@persistent.co.in>
To: linux-lvm@redhat
Content-Type: text/plain
Organization: 
Message-Id: <1092227291.2155.5.camel@ps2181>
Mime-Version: 1.0
X-Mailer: Ximian Evolution 1.2.2 (1.2.2-4) 
Date: 11 Aug 2004 17:58:11 +0530
X-Brightmail-Tracker: AAAAAQAAAAQ=
X-White-List-Member: TRUE
Content-Transfer-Encoding: 7bit

hi ,
 i am facing a problem while mounting a logical volume. I am able to
create volume group and logical volumes (LVM2) in linux 2.6.7 of type
ext3 and making entry in /etc/fstab and executed command mount -a.
mount is successfully working. but after rebooting the machine, it is
giving error 
  unable to mount may be the device is a swap device ....bla bla..

 i tried to mount it manually but it is not mounting again and it is
giving error /dev/volume-group1/lvm1" is not a valid block device.

what is the problem and how to come out from it???

please reply me..

regards
sridhar.


--i7BCSND3013792.1092227303/smtp.pspl.co.in--


--=-wX8hHPaJ2cK9YIBF/SaT--

--=-wX8hHPaJ2cK9YIBF/SaT--
