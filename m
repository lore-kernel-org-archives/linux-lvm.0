Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id iAHNxxr02199
	for <linux-lvm@redhat.com>; Wed, 17 Nov 2004 18:59:59 -0500
Received: from www.austinlogistics.com (mail.austinlogistics.com
	[69.150.203.234])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id iAHNxveD016286
	for <linux-lvm@redhat.com>; Wed, 17 Nov 2004 18:59:57 -0500
In-Reply-To: <E1CUXmN-0001NS-00@grabki.3c.pl>
Subject: Re: [linux-lvm] LVM Config Files
Message-ID: <OFAC7594E7.50941D96-ON86256F4F.00823924-86256F4F.0083D4AE@austinlogistics.com>
From: Jetkins@austinlogistics.com
Date: Wed, 17 Nov 2004 17:59:57 -0600
MIME-Version: 1.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>


"Krzysztof" <kris@grabki.3c.pl>  wrote on 11/17/2004 03:54:26 PM:

> One of disk (hdb1) is showing errors, and smart show me that it will die.
Is
> there any chance to free _exacly_ all pe from hdb1, and only from this
disk

Doubtless others will correct me if I have this wrong, but I believe what
you want is:

      pvchange -x n /dev/hdb1
to prevent any new allocations on that PV, followed by
      pvmove /dev/hdb1
to move existing PE's from that PV to the others.

Check the manpages for options such as -v (verbose), and as always, having
a good backup is highly recommended.

> Ps. I know. My english isn't perfect. Sorry for that.

Your English is a darned sight better than my Polish! :)

Jon Etkins
IT Administration & Support
Austin Logistics, Inc
ph:  (512) 651-5641
fax: (512) 329-5625
