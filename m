Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.11.6/8.11.6) with SMTP id i2J2fwM18319
	for <linux-lvm@redhat.com>; Thu, 18 Mar 2004 21:42:09 -0500
Received: from ms-smtp-01.rdc-kc.rr.com (ms-smtp-01.rdc-kc.rr.com
	[24.94.166.115])
	by mx2.redhat.com (8.11.6/8.11.6) with SMTP id i2J2G8A19657
	for <linux-lvm@redhat.com>; Thu, 18 Mar 2004 21:16:08 -0500
Date: Thu, 18 Mar 2004 20:41:53 -0600
Message-Id: <200403190241.i2J2frv17817@ecstasy1.winternet.com>
From: Ken Fuchs <kfuchs@winternet.com>
In-reply-to: <OF974FD75A.F94D719C-ONC1256E5B.004D008F-C1256E5B.004E504E@nl.ibm.com>
	(message from Rick van der Linde on Thu, 18 Mar 2004 15:15:23 +0100)
Subject: Re: [linux-lvm] lvm on software raid 5
References: <OF974FD75A.F94D719C-ONC1256E5B.004D008F-C1256E5B.004E504E@nl.ibm.com>
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

Rick van der Linde wrote:

>As I did something like this before I would like to know your experiences.
>I've (successfully) tried to install LVM on top of a RAID 5 volume
>consisting 4 disks of 80GB. However I switched back to simple ext3 volumes
>on RAID 5 due to performance problems. I've tried this on LVM 1.0.3 and
>the md-driver delivered with the 2.4.20 kernel. In this situation I
>experience a (LVM on RAID5) performance loss of approx 40-60% in comparison
>to the RAID5 performance.

That is a huge performance loss.  Usually the LVM extents will be
sequentially ordered within each logical volume providing good
performance.  Don't forget that the raw performance of the outer
cylinders of a drive can be double that of the inner cylinders.  Any
performance test setup that doesn't neutralize this variable has no
value period.  I'm not suggesting that this is the case, but only that
performance tests must be very carefully designed and executed.

I did some tests on LVM 1.0.8 (no RAID) using bonnie and noticed only a
few percent performance drop.

Sincerely,

Ken Fuchs <kfuchs@winternet.com>
