Received: from file.rdu.redhat.com (file.rdu.redhat.com [10.11.255.147])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m3I8Ocf7015400
	for <linux-lvm@RedHat.com>; Fri, 18 Apr 2008 04:24:38 -0400
Received: from o.ww.redhat.com (vpn-4-20.str.redhat.com [10.32.4.20])
	by file.rdu.redhat.com (8.13.1/8.13.1) with ESMTP id m3I8ObVm030346
	for <linux-lvm@RedHat.com>; Fri, 18 Apr 2008 04:24:37 -0400
Received: from o.ww.redhat.com (localhost [127.0.0.1])
	by o.ww.redhat.com (8.14.2/8.14.2) with ESMTP id m3I8OaSX004458
	for <linux-lvm@RedHat.com>; Fri, 18 Apr 2008 10:24:36 +0200
Received: (from mauelsha@localhost)
	by o.ww.redhat.com (8.14.2/8.14.2/Submit) id m3I8OarV004457
	for linux-lvm@redhat.com; Fri, 18 Apr 2008 10:24:36 +0200
Date: Fri, 18 Apr 2008 10:24:36 +0200
From: Heinz Mauelshagen <mauelshagen@redhat.com>
Subject: Re: [linux-lvm] snapshotting to a different volume group
Message-ID: <20080418082436.GA7331@redhat.com>
References: <chaz20080417145809.GA20413@artesyncp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <chaz20080417145809.GA20413@artesyncp.com>
Reply-To: mauelshagen@redhat.com,
	LVM general discussion and development <linux-lvm@redhat.com>
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
To: linux-lvm@redhat.com

On Thu, Apr 17, 2008 at 03:58:09PM +0100, Stephane Chazelas wrote:
> Hiya,
> 
> I hope you could help me on this:
> 
> 
> in short:
> 
> is it possible to create a snapshot LV of an original LV
> but in a different volume group?

No, not with LVM.

> 
> or alternatively, what's the best way to bring up a LV in a VG
> that is missing a PV (as in a disk crash) if that LV has all its
> extents on still sane PVs?

vgchange -P -ay

If you have 2 disks, you better mirror them to be completely
HA on the spindle side of things and avoid any such config hassle,
potentially leaving you with lost data.

Heinz

> 
> 
> in long:
> 
> basically, this is what I would like to do:
> 
> I have two disks, not as much as I would like, and I want:
>   - to have 100GB of data mirrored (using Linux software raid
>     (mdadm)) on 2 disks so that it survives disk crashs
>   - to make a number of frequent snapshots of that data to
>     be able to restore things in case of human errors.
>   - (and I also want to have some "striped" storage space for
>     worthless data).
> 
> BUT, I don't want to have the snapshot volumes mirrored.
> 
> My initial idea was to have 2 volume groups: a "safe" one with
> only one /dev/md0 PV and an "unsafe" one with the striped LVs
> and the snapshots.
> 
> However I couldn't find how to create snapshots of the LVs in
> "safe" into the "unsafe" VG. It seems to me that it should be
> possible, shouldn't it?
> 
> Anyway, then I merged the two "safe" and "unsafe" VGs into one
> "vol" VG. Now I can make snapshots of the LV physically located
> on /dev/md0 into the "unsafe" area.
> 
> But if one of the disks fails, /dev/md0 will still be available
> but the "vol" VG won't be able to come up because of the other
> missing PVs.
> 
> If such a thing happen, I can happily live with the missing
> snapshots and "unsafe" storage for a while until I buy a
> replacement HD, but how should I do about making sure that the
> /dev/md0 filesystem is still available in the mean time?
> 
> Or is there a more straightforward way to achieve this that I
> haven't thought of?
> 
> TIA,
> Stephane
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Heinz Mauelshagen                                 Red Hat GmbH
Consulting Development Engineer                   Am Sonnenhang 11
Storage Development                               56242 Marienrachdorf
                                                  Germany
Mauelshagen@RedHat.com                            PHONE +49  171 7803392
                                                  FAX   +49 2626 924446
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
