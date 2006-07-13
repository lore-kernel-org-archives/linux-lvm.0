Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k6DHPlKt028992
	for <linux-lvm@redhat.com>; Thu, 13 Jul 2006 13:25:47 -0400
Received: from conterra.de (vvv.conterra.de [212.124.44.162])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k6DHPkii003233
	for <linux-lvm@redhat.com>; Thu, 13 Jul 2006 13:25:47 -0400
Received: from localhost (unknown [127.0.0.1])
	by conterra.de (-) with ESMTP id F3B601F41F2
	for <linux-lvm@redhat.com>; Thu, 13 Jul 2006 19:25:40 +0200 (CEST)
Received: from conterra.de ([127.0.0.1])
	by localhost (vvv.conterra.de [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 14985-02 for <linux-lvm@redhat.com>;
	Thu, 13 Jul 2006 19:25:26 +0200 (CEST)
Message-ID: <44B68206.60306@conterra.de>
Date: Thu, 13 Jul 2006 19:25:26 +0200
From: =?ISO-8859-1?Q?Dieter_St=FCken?= <stueken@conterra.de>
MIME-Version: 1.0
Subject: Re: [linux-lvm] lvm2 volumes not available on boot
References: <44B66C49.90500@cse.yorku.ca> <44B67177.4050404@conterra.de>
	<44B676F2.2070602@cse.yorku.ca>
In-Reply-To: <44B676F2.2070602@cse.yorku.ca>
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

Jason Keltz wrote:
> Before the vgscan is run, here are the loaded modules:
> 
> Module                  Size  Used by
> dm_mirror              28577  0
> dm_mod                 59717  1 dm_mirror
> joydev                 13953  0
> button                 10449  0
> battery                12741  0
> ac                      8773  0
> uhci_hcd               32729  0
> ehci_hcd               31813  0
> 3w_9xxx                35909  0
> e1000                  99757  0
> floppy                 57937  0
> ext3                  118729  1
> jbd                    60761  1 ext3
> ata_piix               13381  1
> libata                 57885  1 ata_piix
> sd_mod                 20417  2
> scsi_mod              116941  3 3w_9xxx,libata,sd_mod
> 
> ... so "dm_mod" is actually loaded, and as far as I know, that's the
> lvm2 module.  

I also have two 3w_9xxx since a few weeks, works great!

If it becomes /dev/sdb, have a look into /sys/block/sdb and
/proc/partitions if it appears correctly. Also, certain devices
may be excluded from scanning via /etc/lvm/lvm.conf.

Does hotplug create /dev/sdb dynamically and in time during boot?

In the beginning I got problems, as the 3ware controller
and my SATA backplane both may be configured to delay the
disk spinup. This caused some timeout trouble.

Dieter.
