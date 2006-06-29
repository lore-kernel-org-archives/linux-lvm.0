Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k5T8I6gx020299
	for <linux-lvm@redhat.com>; Thu, 29 Jun 2006 04:18:06 -0400
Received: from conterra.de (vvv.conterra.de [212.124.44.162])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k5T8HrKK000478
	for <linux-lvm@redhat.com>; Thu, 29 Jun 2006 04:18:00 -0400
Received: from localhost (unknown [127.0.0.1])
	by conterra.de (-) with ESMTP id 09FAA1F4064
	for <linux-lvm@redhat.com>; Thu, 29 Jun 2006 10:17:47 +0200 (CEST)
Received: from conterra.de ([127.0.0.1])
	by localhost (vvv.conterra.de [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 06828-08 for <linux-lvm@redhat.com>;
	Thu, 29 Jun 2006 10:17:37 +0200 (CEST)
Message-ID: <44A38C9E.3020406@conterra.de>
Date: Thu, 29 Jun 2006 10:17:34 +0200
From: =?ISO-8859-1?Q?Dieter_St=FCken?= <stueken@conterra.de>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Uuid for unknown device blows up VolGroup00
References: <20060628190136.79139.qmail@web31413.mail.mud.yahoo.com>
In-Reply-To: <20060628190136.79139.qmail@web31413.mail.mud.yahoo.com>
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
> I recently tried to add an old 30 GB hard drive lying in my machine to
> my FC5 system.  I was trying to add the 30 GB to VolGroup00.  I failed
> somehow and now the entire VolGroup00 is inaccessible.  When booting I
> get a Kernel panic - not syncing: Attempted to kill init!  I think if I
> removed the offending Uuid from VolGroup00 things would go back to normal.
> ....
> When I do an lvm pvdisplay, it reveals that VolGroup00 has two uuid's in
> it. One is /dev/hdb3 with uuid M3CWKv-a2yK-b5Qu-rLzq-Aj27-lXxE-WzvkWE
> and the other is unknown device with uuid
> 8YsyEa-r5RX-2LLI-Zz7n-Xr8s-VksP-Mhs0Wi.

seems you did NOT fail adding the new disk. Have a look into your 
/etc/lvm/backup/VolGroup00 to find how your VG is composed.

It seems, you succeed in adding the disk, but you finally did
not use it and disconnected it. LVM however has registered
the new disk, even if you did not copy any data to it.

You should reconnect the formerly added disk and unregister
it from your volume group by "vgreduce". If you don't have the
disk any more or used it elsewhere, you may try the option
"vgreduce --removemissing".

> I failed somehow and now ...

can you tell us, why it did not work as you expected?

Dieter.
