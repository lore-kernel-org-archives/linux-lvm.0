Received: from mx1.redhat.com (ext-mx08.extmail.prod.ext.phx2.redhat.com
	[10.5.110.12])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id oATGS8sS031692
	for <linux-lvm@redhat.com>; Mon, 29 Nov 2010 11:28:08 -0500
Received: from mail09.linbit.com (mail09.linbit.com [212.69.161.110])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id oATGRv1Q019095
	for <linux-lvm@redhat.com>; Mon, 29 Nov 2010 11:27:58 -0500
Received: from soda.linbit (unknown [10.9.9.55])
	by mail09.linbit.com (LINBIT Mail Daemon) with ESMTP id DB9E01058940
	for <linux-lvm@redhat.com>; Mon, 29 Nov 2010 17:27:56 +0100 (CET)
Date: Mon, 29 Nov 2010 17:27:56 +0100
From: Lars Ellenberg <lars.ellenberg@linbit.com>
Message-ID: <20101129162756.GN16420@barkeeper1-xen.linbit>
References: <AANLkTimTYse7vnqZydc1Z5z60vNuQw3juj7J_W7+bQEm@mail.gmail.com>
	<AANLkTimGkMJGiJC+7L+Pu3+yf-J_s0Ex3hM2-g-0+UqQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <AANLkTimGkMJGiJC+7L+Pu3+yf-J_s0Ex3hM2-g-0+UqQ@mail.gmail.com>
Subject: Re: [linux-lvm] Q: LVM over RAID,
 or plain disks? A:"Yes" = best of both worlds?
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
Content-Type: text/plain; charset="utf-8"
To: linux-lvm@redhat.com

On Sun, Nov 28, 2010 at 10:31:51PM +0700, hansbkk@gmail.com wrote:
> �- - - - - - My abject apologies to all for improper addressing in my
> previous messages (thanks to all those who set me straight :)
> 
> Hope you're all still willing to consider my request for feedback.
> Start with a bit of context:
> 
> - SAN/NAS (call it FILER-A) hosting say a dozen TB and servicing a few
> dozen client machines and servers, mostly virtual hosts. Another,
> larger (FILER-B - still just tens of TB) host's drives are used for
> storing backup sets, via not only Amanda, but also filesystems
> comprising gazillions of hard-linked archive sets created by (eg)
> rdiff-backup, rsnapshot and BackupPC. We're on a very limited budget,
> therefore no tape storage for backups.
> 
> - I plan to run LVM over RAID (likely RAID1 or RAID10) for IMO an
> ideal combination of fault tolerance, performance and flexibility.
> 
> - I am not at this point overly concerned about performance issues -
> reliability/redundancy and ease of recovery are my main priorities.
> 
> 
> Problem:
> 
> For off-site data rotation, the hard-linked filesystems on FILER-B
> require full filesystem cloning with block-level tools rather than
> file-level copying or sync'ing. My current plan is to swap out disks
> mirrored via RAID, marking them as "failed" and then rebuilding using
> the (re-initialized) incoming rotation set.

Did you consider DRBD?

Use DRBD, protocol A, potentially with drbd-proxy in between to mitigate
impact on primary site performance due to high latency connection to the
desaster recovery site.
At your option have it replicate continuously, or cron-job triggered
sync it up every "rotation interval", then disconnect again.

Depending on what you want, you can have one DRBD on top of
each LV, or have one DRBD by the PV of a VG.

Depending on what you do to the devices on the DR site,
you will likely be able to always do an incremental resync only
(ship only blocks that changed).

If you want to discuss that further, feel free to followup here,
on drbd-user, on freenode #drbd, or contact LINBIT directly.

-- 
: Lars Ellenberg
: LINBIT | Your Way to High Availability
: DRBD/HA support and consulting http://www.linbit.com

DRBD� and LINBIT� are registered trademarks of LINBIT, Austria.
