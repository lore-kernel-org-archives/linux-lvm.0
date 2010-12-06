Received: from mx1.redhat.com (ext-mx03.extmail.prod.ext.phx2.redhat.com
	[10.5.110.7])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id oB6CYQvx022231
	for <linux-lvm@redhat.com>; Mon, 6 Dec 2010 07:34:26 -0500
Received: from mtaout20.012.net.il (mtaout20.012.net.il [80.179.55.166])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id oB6CYEoa014404
	for <linux-lvm@redhat.com>; Mon, 6 Dec 2010 07:34:15 -0500
Received: from conversion-daemon.a-mtaout20.012.net.il by
	a-mtaout20.012.net.il (HyperSendmail v2007.08) id
	<0LD000F00AWRO200@a-mtaout20.012.net.il> for
	linux-lvm@redhat.com; Mon, 06 Dec 2010 14:34:12 +0200 (IST)
Received: from dovidhalevi ([87.70.40.209]) by a-mtaout20.012.net.il
	(HyperSendmail v2007.08) with ESMTPA id
	<0LD000DSZAX021F0@a-mtaout20.012.net.il> for
	linux-lvm@redhat.com; Mon, 06 Dec 2010 14:34:12 +0200 (IST)
Received: from localhost ([127.0.0.1] helo=dovidhalevi.homelinux.net)	by
	dovidhalevi with esmtp (Exim 4.72)	(envelope-from
	<d_baron@012.net.il>)	id 1PPaGh-0003uK-OK	for
	linux-lvm@redhat.com; Mon, 06 Dec 2010 14:34:11 +0200
Date: Mon, 06 Dec 2010 14:34:11 +0200
From: David Baron <d_baron@012.net.il>
In-reply-to: <mailman.7913.1291608602.9820.linux-lvm@redhat.com>
Message-id: <201012061434.11302.d_baron@012.net.il>
MIME-version: 1.0
Content-transfer-encoding: 7bit
References: <mailman.7913.1291608602.9820.linux-lvm@redhat.com>
Subject: Re: [linux-lvm] "Condensing" Physical Volumes
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
Content-Type: Text/Plain; charset="us-ascii"
To: linux-lvm@redhat.com

On Monday 06 December 2010 06:10:02 linux-lvm-request@redhat.com wrote:
> > I need more extents to move stuff off older, possibly failing IDE disks
> > to my  new SATA terrabyter. However, not enough extents are available.
> > The disk is very sparsely populated.
> >
> > 
> >
> > Is there any way to "condense" physical volumes to recover/expose empty 
> > extents in order to make use of them?
>
>     Is your situation actually the following?:
> 
> The volume group is nearly full, meaning that most all
> of the extents are used by logical volumes.
> 
> On those logical volumes you have file systems.
> 
> Those file systems have free space.
> 
> If the above three conditions hold, you'd need to:
> 
> reduce the size of the file systems, perhaps using ex2resize.
> 
> Once each file system is reduced, you would then be able to reduce
> the logical volume which contains that filesystem.
> 
> That will mean there are free extents in the volume group, so you can
> then use pvmove to move the extents off of the chosen physical
> volumes.
That's about it.

Reducing the size of logical volumes was the first thing I thought of but it 
wants to umount them to do this--not so cool if they are /usr and stuff like 
that. I suppose this could be done using the Debian live CD.

Either /usr or /home could easily be shrunk leaving plenty of extents for the 
pieces still on an IDE disk.

> 
> Does pvmove --alloc anywhere help?
> 
> Alternatively, you can specify exactly which extents go where,
> like in "pvmove --test -n lvname.to.move /dev/pvold:20-27
> /dev/pvnew:732-739". obviously, remove --test, if it seems to do what you
> meant.
> 
> To see which what is where, and which extent ranges are free,
> I tend to use variants of
> pvs -o vg_name,lv_name,pv_name,pvseg_start,pvseg_size,seg_pe_ranges
> -Opv_name,pvseg_start Note that pe_ranges are inclusive, (end of the range
> is: pvseg_start  + pvseg_size -1).

I am not really conversant in the CLI tools so I do not know how to do this.

The only free exents are on a PV I created out of a partition which I had 
intended for another use. I pmoved the stuff from one of the IDE disks to this 
PV. A bit scary but worked fine despite problems with that IDE disk (which was 
then removed, thankfully).
