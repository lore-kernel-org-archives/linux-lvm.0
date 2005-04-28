Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j3SGPQO24803
	for <linux-lvm@redhat.com>; Thu, 28 Apr 2005 12:25:26 -0400
Received: from mrz.swissptt.ch (outmail3.swisscom.com [138.190.3.30])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id j3SGPIvV018045
	for <linux-lvm@redhat.com>; Thu, 28 Apr 2005 12:25:19 -0400
Received: from mwdsp001.swissptt.ch (mwdsp001.swissptt.ch [10.221.40.203])
	by mrz.swissptt.ch with ESMTP id j3SGPEYN007059
	for <linux-lvm@redhat.com>; Thu, 28 Apr 2005 18:25:14 +0200 (MEST)
Received: from mwdsp001 (localhost [127.0.0.1])
	by mwdsp001.swissptt.ch (8.12.11/8.12.11) with SMTP id j3SGPBZj031503
	for <linux-lvm@redhat.com>; Thu, 28 Apr 2005 18:25:11 +0200
Date: Thu, 28 Apr 2005 18:25:06 +0200
From: Chris Osicki <osk@admin.swisscom-mobile.ch>
Message-ID: <20050428182506.31337b4f@mwdsp001>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Q: Howto regenerate device files
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


Hi

I created a volume group and few lvols. After a reboot I did a vgscan
which found my volume group. So far so good. Unfortunately the device
files for the lvols were gone, I'm using udev.
I tried to regenerate them using vgmknodes -v without success:

root # vgdisplay -v
    Finding all volume groups
    Finding volume group "stick"


My system is:

kernel 2.6.11-gentoo-r6

root # lvm version
  LVM version:     2.00.33 (2005-01-07)
  Library version: 1.00.19-ioctl (2004-07-03)
  Driver version:  4.4.0


Is there any way to recover?

Thanks for your time.

Regards,
Chris
