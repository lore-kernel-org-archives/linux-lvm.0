Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k5UAfvKT022001
	for <linux-lvm@redhat.com>; Fri, 30 Jun 2006 06:41:57 -0400
Received: from conterra.de (vvv.conterra.de [212.124.44.162])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k5UAfn5e002560
	for <linux-lvm@redhat.com>; Fri, 30 Jun 2006 06:41:50 -0400
Received: from localhost (unknown [127.0.0.1])
	by conterra.de (-) with ESMTP id BD7C61F421C
	for <linux-lvm@redhat.com>; Fri, 30 Jun 2006 12:41:41 +0200 (CEST)
Received: from conterra.de ([127.0.0.1])
	by localhost (vvv.conterra.de [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 32683-01 for <linux-lvm@redhat.com>;
	Fri, 30 Jun 2006 12:41:25 +0200 (CEST)
Message-ID: <44A4FFCB.7040309@conterra.de>
Date: Fri, 30 Jun 2006 12:41:15 +0200
From: =?ISO-8859-1?Q?Dieter_St=FCken?= <stueken@conterra.de>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Uuid for unknown device blows up VolGroup00
References: <20060630055107.87219.qmail@web31410.mail.mud.yahoo.com>
In-Reply-To: <20060630055107.87219.qmail@web31410.mail.mud.yahoo.com>
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

Teak Billard wrote:
> In my getting wise period I read that the problem with volume groups is
> that if one hard drive fails, the entire volume group is finished.  That
> to me is extremely dangerous.  Am I right to be concerned?

If one hard disk fails, all data on THAT disk has gone.
As long as you have several small LV which completely
fit on a single disk, they are not lost, if some other
disk fails. The advantage of using LVM instead of plain
partitions is, that the LVs have real names instead of
ugly names like "/dev/sdb3", they may be resized and they
may be moved easily between different disks, even while
in use!

If you use LVM to bundle several disks to get bigger LVs
which spread over several disks, you depend on the reliability
of each disk. But this is the price you have to pay for
the plus of flexibility. You may feel saver, to separate
both disk by using separate LVs for each. So if one disk
fails, you saved one half of your data. So is this only
half as worse to loose only one half of your data?

If you work with individual disks and partitions, the
risk of accidentally deleting or formatting the wrong
disk or partition is much higher than with LVM, where
your "partitions" have expressive names. Also the LVM
commands prevent you from accidentally performing
destructive actions.

If your data is important, you have to make backups anyway.
If you worry about your data, you should buy reliable disks
or use a raid5 setup.

Dieter
