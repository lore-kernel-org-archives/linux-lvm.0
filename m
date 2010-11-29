Received: from mx1.redhat.com (ext-mx04.extmail.prod.ext.phx2.redhat.com
	[10.5.110.8])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id oATIvmAl013170
	for <linux-lvm@redhat.com>; Mon, 29 Nov 2010 13:57:48 -0500
Received: from aspen.rjl.com (aspen.rjl.com [66.35.48.14])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id oATIvb0K010307
	for <linux-lvm@redhat.com>; Mon, 29 Nov 2010 13:57:37 -0500
Received: from penguin.rjl.com (173-16-200-99.client.mchsi.com [173.16.200.99])
	by aspen.rjl.com (vPostMaster) with ESMTP id 2FBF81D0229
	for <linux-lvm@redhat.com>; Mon, 29 Nov 2010 10:57:47 -0800 (PST)
Message-ID: <4CF3F7A0.2080108@rjl.com>
Date: Mon, 29 Nov 2010 10:57:36 -0800
From: Nataraj <incoming-redhat@rjl.com>
MIME-Version: 1.0
References: <AANLkTimTYse7vnqZydc1Z5z60vNuQw3juj7J_W7+bQEm@mail.gmail.com>
	<AANLkTimGkMJGiJC+7L+Pu3+yf-J_s0Ex3hM2-g-0+UqQ@mail.gmail.com>
In-Reply-To: <AANLkTimGkMJGiJC+7L+Pu3+yf-J_s0Ex3hM2-g-0+UqQ@mail.gmail.com>
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

hansbkk@gmail.com wrote:
>  - - - - - - My abject apologies to all for improper addressing in my
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
>
> HOWEVER - the use of LVM (and possibly RAID10) adds complexity to the
> filesystems, which makes disaster recovery from the detached disk sets
> much more difficult than regular partitions on physical disks.
>
>
> Theoretical solution:
>
> Use RAID1 on the "top layer" to mirror the data stored in an LVM (set
> of) disk(s) on the one hand (call it TopRAID1) to ***regular
> partitions*** on actual physical disks on the other (call this the
> TopRAID2 side).
>
>   
Your proposed solution is a bit confusing to understand, however raid1 
works for doing backups in the manner that you describe .  I use it 
myself and I have, over time read about others doing so as well.  Be 
sure to create your volumes with --bitmap=internal, that way when you 
swap in a drive, it won't need to replicate the entire drive, only the 
part that is changed.

If your not going to manage the drives yourself, you will need an 
operations staff that has a pretty good understanding of how raid works 
and/or possibly write a robust set of scripts to manage the drives, 
ensure that the correct volume is mounted, etc.  Also, I don't 
personally feel that disks are a suitable media for long term data 
archival, so if that is really your purpose, as opposed to a quick way 
to recover from a disk failure, then you might consider doing periodic 
tape or optical media backups as well.

Nataraj
