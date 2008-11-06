Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id mA6HVJ9m022699
	for <linux-lvm@redhat.com>; Thu, 6 Nov 2008 12:31:19 -0500
Received: from mail.bucoks.com (wsip-70-167-48-6.ks.ks.cox.net [70.167.48.6])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id mA6HVFmP024170
	for <linux-lvm@redhat.com>; Thu, 6 Nov 2008 12:31:15 -0500
Received: from mail.bucoks.com (imss03.bucoks [127.0.0.1])
	by postfix.imss70 (Postfix) with ESMTP id 33ED2130105
	for <linux-lvm@redhat.com>; Thu,  6 Nov 2008 11:31:16 -0600 (CST)
Received: from EXCS01.BUCOKS (excs01.bucoks [192.168.0.40])
	by mail.bucoks.com (Postfix) with ESMTP id 2656A1300B1
	for <linux-lvm@redhat.com>; Thu,  6 Nov 2008 11:31:16 -0600 (CST)
Content-class: urn:content-classes:message
MIME-Version: 1.0
Date: Thu, 6 Nov 2008 11:31:14 -0600
Message-ID: <8D07631D47C3CB4F867AD7BCF07D5C2307F48A@excs01.bucoks>
From: "James A. Dinkel" <jdinkel@bucoks.com>
Content-Transfer-Encoding: quoted-printable
Subject: [linux-lvm] should I be concerned that pvdisplay shows PV Size is
	1024 when it's really 2047 GB?
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
Content-Type: text/plain; charset="iso-8859-1"
To: LVM general discussion and development <linux-lvm@redhat.com>

This is rather odd.  The partition is actually 2047 GB (full size of the di=
sk), but pvdisplay reports the PV Size as 1024.00 GB.  Another oddity is if=
 you take the PE Size and multiply it by the Total PE, then it comes out as=
 the correct 2047 GB.  It seems like something I could safely ignore, but t=
his is going to be a critical production server and I would like to hear fr=
om more experiences persons if I should be concerned about this:

  --- Physical volume ---
  PV Name               /dev/sde1
  VG Name               vg-samba-data1
  PV Size               1024.00 GB / not usable 8192.00 EB
  Allocatable           yes
  PE Size (KByte)       4096
  Total PE              524030
  Free PE               524030
  Allocated PE          0
  PV UUID               e3ubYN-DZtL-Ee1M-yaNC-mRif-KVB6-166mVR

Here is the version of lvm2 installed on RedHat EL 5:

[brazen@server2 ~]$ rpm -qa | grep lvm
lvm2-2.02.16-3.el5


thanks,
=EF=BF=BD
James Dinkel
