Received: from [10.34.130.200] (dhcp130-200.brq.redhat.com [10.34.130.200])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id uA7AMqm7001109
	for <linux-lvm@redhat.com>; Mon, 7 Nov 2016 05:22:52 -0500
References: <582049AF.7010905@strike.wu.ac.at>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <6c916712-d43b-d456-9a4b-f8c801201639@redhat.com>
Date: Mon, 7 Nov 2016 11:22:51 +0100
MIME-Version: 1.0
In-Reply-To: <582049AF.7010905@strike.wu.ac.at>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] very slow sequential writes on lvm raid1 (bitmap?)
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

Dne 7.11.2016 v 10:30 Alexander 'Leo' Bergolth napsal(a):
> Hi!
>
> I am experiencing a dramatic degradation of the sequential write speed
> on a raid1 LV that resides on two USB-3 connected harddisks (UAS
> enabled), compared to parallel access to both drives without raid or
> compared to MD raid:
>
> - parallel sequential writes LVs on both disks: 140 MB/s per disk
> - sequential write to MD raid1 without bitmap: 140 MB/s
> - sequential write to MD raid1 with bitmap: 48 MB/s
> - sequential write to LVM raid1: 17 MB/s !!
>
> According to the kernel messages, my 30 GB raid1-test-LV gets equipped
> with a 61440 bit write-intent bitmap (1 bit per 512 byte data?!) whereas
> a default MD raid1 bitmap only has 480 bit size. (1 bit per 64 MB).
> Maybe the dramatic slowdown is caused by this much too fine grained
> bitmap and its updates, which are random IO?
>
> Is there a way to configure the bitmap size?
>


Hi


Can you please provide some results with  '--regionsize'  changes ?
While   '64MB' is quite 'huge'  for resync I guess 'the current' default
picked region size is likely very very small in same cases.

Regards

Zdenek
