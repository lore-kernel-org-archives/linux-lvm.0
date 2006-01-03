Received: from agk.surrey.redhat.com (agk.surrey.redhat.com [172.16.10.74])
	by pobox.surrey.redhat.com (8.12.8/8.12.8) with ESMTP id k03EF3ws029073
	for <linux-lvm@redhat.com>; Tue, 3 Jan 2006 14:15:03 GMT
Received: from agk by agk.surrey.redhat.com with local (Exim 4.34)
	id 1EtmwJ-0001FH-Dv
	for linux-lvm@redhat.com; Tue, 03 Jan 2006 14:15:03 +0000
Date: Tue, 3 Jan 2006 14:15:03 +0000
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] vg not intact after other disks are exchanged
Message-ID: <20060103141503.GA4346@agk.surrey.redhat.com>
References: <20051230181808.GA15333@openlib.org>
	<20051231144230.GA8019@openlib.org>
	<20051231170056.GB8049@openlib.org>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20051231170056.GB8049@openlib.org>
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
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

> > It is strange that the scan does not find the /dev/hdd volume,
> > but the display manually finds the same data.
>   Actually, I found that using lvm.conf, I can tell it to 
>   scan for the disk, and then the disk is found, and the 
>   vg1 is created. This closes my problem. But it is still
>   bad that pvscan can't find the disk after other disks
>   have been exchanged. Maybe this is a bios problem.
 
Debian users in particular often report problems like this because 
of an incorrect symlink connecting /dev/cdrom to /dev/hdd and an 
lvm.conf filter ignoring cdrom.

Alasdair
-- 
agk@redhat.com
