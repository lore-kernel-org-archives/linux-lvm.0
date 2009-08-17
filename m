Received: from alatyr.englab.brq.redhat.com (alatyr.englab.brq.redhat.com
	[10.34.33.30])
	by ns3.rdu.redhat.com (8.13.8/8.13.8) with ESMTP id n7H90Goo016255
	for <linux-lvm@redhat.com>; Mon, 17 Aug 2009 05:00:16 -0400
Message-ID: <4A891C58.6090409@redhat.com>
Date: Mon, 17 Aug 2009 11:01:12 +0200
From: Peter Rajnoha <prajnoha@redhat.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] /dev/dm-* or /dev/mapper/*
References: <1250467733.18434.1330126635@webmail.messagingengine.com>
In-Reply-To: <1250467733.18434.1330126635@webmail.messagingengine.com>
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
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>

On 08/17/2009 02:08 AM, Edward Siefker wrote:
> I originally set up raid-luks-lvm on this machine with debian's
> installer tool, now I am trying to add another encrypted raid1 device to
> the existing volume group.  I already have the raid device set up and
> encrypted, that's no problem.  Now the linux gazette
> (http://linuxgazette.net/140/pfeiffer.html) tells me I should run
> 'pvcreate' on the device in /dev/mapper.  However, if I examine my
> existing physical volumes with 'pvscan' I get the following:
> 
> iblis:/home/hatta# pvscan
>   PV /dev/dm-0   VG iblis-volumes   lvm2 [931.32 GB / 0    free]
>   Total: 1 [931.32 GB] / in use: 1 [931.32 GB] / in no VG: 0 [0   ]

..also, try to look at devices/preferred_names setting in lvm.conf.
This one should give priority to scanned devices and prioritize them..

Peter
