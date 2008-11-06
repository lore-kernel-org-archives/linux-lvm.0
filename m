Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id mA6MC706016088
	for <linux-lvm@redhat.com>; Thu, 6 Nov 2008 17:12:07 -0500
Received: from mail.bucoks.com (wsip-70-167-48-6.ks.ks.cox.net [70.167.48.6])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id mA6MBsQS030048
	for <linux-lvm@redhat.com>; Thu, 6 Nov 2008 17:11:54 -0500
Received: from mail.bucoks.com (imss03.bucoks [127.0.0.1])
	by postfix.imss70 (Postfix) with ESMTP id 01CC11300D7
	for <linux-lvm@redhat.com>; Thu,  6 Nov 2008 16:11:55 -0600 (CST)
Received: from EXCS01.BUCOKS (excs01.bucoks [192.168.0.40])
	by mail.bucoks.com (Postfix) with ESMTP id DDCFA130084
	for <linux-lvm@redhat.com>; Thu,  6 Nov 2008 16:11:54 -0600 (CST)
Content-class: urn:content-classes:message
MIME-Version: 1.0
Subject: RE: [linux-lvm] should I be concerned that pvdisplay shows PV
	Sizeis	1024 when it's really 2047 GB?
Date: Thu, 6 Nov 2008 16:11:53 -0600
Message-ID: <8D07631D47C3CB4F867AD7BCF07D5C232C8E@excs01.bucoks>
References: <8D07631D47C3CB4F867AD7BCF07D5C2307F48A@excs01.bucoks>
	<49132D61.7060604@redhat.com>
From: "James A. Dinkel" <jdinkel@bucoks.com>
Content-Transfer-Encoding: 8bit
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
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>

-----Original Message-----
From: Bryn M. Reeves
Sent: Thursday, November 06, 2008 11:46 AM

That's a pretty old release - the current package for RHEL 5 on RHN
should be lvm2-2.02.32-4.el5. There were some display bugs fixed in
older releases, so it's worth checking with the updated package.

Regards,
Bryn.
______________________________________________


Ok, yeah, I updated to the latest lvm2 package and now it reports
correctly 

James Dinkel
