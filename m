Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id jB1FAxV21687
	for <linux-lvm@redhat.com>; Thu, 1 Dec 2005 10:10:59 -0500
Received: from mrz.swissptt.ch (outmail3.swisscom.com [138.190.3.30])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id jB1FAndB005731
	for <linux-lvm@redhat.com>; Thu, 1 Dec 2005 10:10:49 -0500
Received: from mwdsp001.swissptt.ch (mwdsp001.swissptt.ch [10.221.40.203])
	by mrz.swissptt.ch with ESMTP id jB1FAftI007303
	(using TLSv1/SSLv3 with cipher EDH-RSA-DES-CBC3-SHA (168 bits) verified
	NO) for <linux-lvm@redhat.com>; Thu, 1 Dec 2005 16:10:42 +0100 (MET)
Received: from mwdsp001 (localhost [127.0.0.1])
	by mwdsp001.swissptt.ch (8.13.4/8.12.11) with ESMTP id jB1FAhHM008916
	for <linux-lvm@redhat.com>; Thu, 1 Dec 2005 16:10:45 +0100
From: Chris Osicki <Krzysztof.Osicki@swisscom.com>
Subject: Re: [linux-lvm] Q: Howto regenerate device files
Message-ID: <20050429170220.209b7d56@mwdsp001>
In-Reply-To: <20050428182506.31337b4f@mwdsp001>
References: <20050428182506.31337b4f@mwdsp001>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
Date: Thu, 01 Dec 2005 15:10:59 -0000
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>

Hi

I created a volume group and few lvols. After a reboot I did a vgscan
which found my volume group. So far so good. Unfortunately the device
files for the lvols were gone, I'm using udev.
I tried to regenerate them using vgmknodes -v without success:


root # vgmknodes -v
  Finding all logical volumes
  /dev/stick: opendir failed: No such file or directory


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
