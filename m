Received: from mx1.redhat.com (ext-mx04.extmail.prod.ext.phx2.redhat.com
	[10.5.110.8])
	by int-mx03.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id n8B9FEFX003134
	for <linux-lvm@redhat.com>; Fri, 11 Sep 2009 05:15:14 -0400
Received: from smtp003.apm-internet.net (smtp003.apm-internet.net
	[85.119.248.52])
	by mx1.redhat.com (8.13.8/8.13.8) with SMTP id n8B9F1qn024627
	for <linux-lvm@redhat.com>; Fri, 11 Sep 2009 05:15:02 -0400
Received: from bernoulli.globalphasing.com (bernoulli.globalphasing.com
	[192.168.131.101])
	by mailserv1.globalphasing.com (Postfix) with ESMTP id D515E16686
	for <linux-lvm@redhat.com>; Fri, 11 Sep 2009 10:14:53 +0100 (BST)
Date: Fri, 11 Sep 2009 10:14:54 +0100 (BST)
From: Peter Keller <pkeller@globalphasing.com>
Subject: Re: [linux-lvm] Snapshots
In-Reply-To: <20090910152510.20691nc1e7608sm8@www.destar.net>
Message-ID: <alpine.LNX.2.00.0909110943080.27665@bernoulli.globalphasing.com>
References: <20090910152510.20691nc1e7608sm8@www.destar.net>
MIME-Version: 1.0
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
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

Hi Jon,

You seem to be right that there isn't much written down about how snapshots 
work under the bonnet in the LVM context, but the same ideas have been used 
for other snapshot implementations for years. You could try searching for 
filesystem snapshot technology in general, rather than anything 
LVM-specific. For example, this article explains some of the basic concepts:

   http://www.ibm.com/developerworks/tivoli/library/t-snaptsm1/index.html

LVM uses the copy-on-write method (this is what "COW" stands for).

On Thu, 10 Sep 2009, jonr@destar.net wrote:

> Hello List,
>
> I don't get it!
>
> I have a xen system that has a DomU of FC11 with a 20GB LV for the disk. I 
> created a snapshot using this command:
>
> lvcreate -L +10G -s -n s_cgate-be1 /dev/xenvg/cgate-be1
>
> This is the output of an 'lvdisplay' of the snapshot LV:
>
> lvdisplay /dev/xenvg/s_cgate-be1
> --- Logical volume ---
> LV Name                /dev/xenvg/s_cgate-be1
> VG Name                xenvg
> LV UUID                7c1kEs-xYoO-Qxem-2E2M-hlee-pc4Q-zm6TZ5
> LV Write Access        read/write
> LV snapshot status     active destination for /dev/xenvg/cgate-be1
> LV Status              available
> # open                 2
> LV Size                20.00 GB
> Current LE             5120
> COW-table size         10.00 GB
> COW-table LE           2560
> Allocated to snapshot  0.11%
> Snapshot chunk size    4.00 KB
> Segments               1
> Allocation             inherit
> Read ahead sectors     auto
> - currently set to     256
> Block device           253:15
>
> I then shutdown the DomU and pointed the 'Disk...' line in the config file 
> for the DomU to the snapshot. It boots.
>
> OK, I must be missing the simple answer because I cannot seem to grasp the 
> concept of snapshots.
>
>
> 1. How can I have a 20GB LV as a disk and the snapshot be 10GB and boot the 
> entire OS?

Because the snapshot only stores copies of the disk blocks that have been 
modified on the original volume since the snapshot was taken (the blocks 
that would otherwise be overwritten if you hadn't created the snapshot). 
When you read from the snapshot, LVM uses never-modified blocks from the 
original volume and pre-modification copies of blocks from the snapshot as 
needed.

If the original volume became corrupt, the snapshot would also be unusable.

> 2. Can I create a DomU and then snapshot the LV and use the snapshot to 
> create other DomU's?

Yes - there are articles around about how to do this. If you intend to run 
the DomU's on the same network, you should boot the copies into single-user 
mode initially to modify their network identities so that they don't 
conflict with each other. (Maybe you can find some other way of doing this 
without booting the DomU's: I know that you can do this with VMWare, at 
least for Linux guest OS's.)

> 3. If 2 is yes, would I want to continue using the snapshot as the disk or is 
> there something else that should be done, i.e. dd the drive to a new LV?
>
> In the 'lvdisplay' of the snapshot I have these extra lines:
> LV snapshot status     active destination for /dev/xenvg/cgate-be1
> # open                 2
> COW-table size         10.00 GB
> COW-table LE           2560
> Allocated to snapshot  0.11%
> Snapshot chunk size    4.00 KB

You can continue use the snapshot in principle, although you might like to 
make the snapshot the same size as the original volume in that case to make 
sure that it never fills up. In your example, when the accumulated changes 
on the original volume since the snapshot was taken reach 10Gb, the snapshot 
will be full and go invalid and you won't be able to use it.

If your aim is to have a single starting point to create more than one DomU, 
you should copy the data out and keep it safe somewhere. You can then use 
that copy to create further copies as needed. Personally, I would only boot 
up the first copy (or the snapshot) to keep the OS up to date (which will 
save you having to update every copy that you make from it).

> 4. Does the 0.11% mean that the 10GB snapshot file is only using .11% of the 
> 10GB LV?

Yes, that's right.

> If there is a good doc out there explaining all of this could someone just 
> post a link. I don't mind reading but am not getting the answers to the 
> above. I have found lots of docs explaining how to do it but nothing going 
> much further than that.
>
> Thanks for any help,

Have fun,
Peter.
