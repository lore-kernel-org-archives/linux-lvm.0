Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l77LiqjQ002073
	for <linux-lvm@redhat.com>; Tue, 7 Aug 2007 17:44:52 -0400
Received: from marge.panici.net (marge.panici.net [207.234.208.94])
	by mx1.redhat.com (8.13.1/8.13.1) with ESMTP id l77Lin0R018212
	for <linux-lvm@redhat.com>; Tue, 7 Aug 2007 17:44:49 -0400
Received: from marge.panici.net (localhost.localdomain [127.0.0.1])
	by marge.panici.net (8.13.8/8.13.8/Debian-3) with ESMTP id
	l77Ling1004210
	for <linux-lvm@redhat.com>; Tue, 7 Aug 2007 21:44:49 GMT
Received: (from paddy@localhost)
	by marge.panici.net (8.13.8/8.13.8/Submit) id l77LimNC004209
	for linux-lvm@redhat.com; Tue, 7 Aug 2007 21:44:48 GMT
Date: Tue, 7 Aug 2007 21:44:48 +0000
From: paddy@panici.net
Subject: Re: [linux-lvm] Best practice: metadata backup
Message-ID: <20070807214448.GD3732@localhost.localdomain>
References: <Pine.LNX.4.44.0708050009370.22952-100000@bmsred.bmsi.com>
	<20070807190153.GV2064@agk.fab.redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20070807190153.GV2064@agk.fab.redhat.com>
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
To: linux-lvm@redhat.com

On Tue, Aug 07, 2007 at 08:01:53PM +0100, Alasdair G Kergon wrote:
> > AIX treats the boot LV specially, and ensures
> > that its PEs are contiguous at the beginning of the disk(s).  
> 
> Nothing is stopping a linux installer doing that today:
>   --alloc contiguous and specify the extents.

(its been a long time but) last time I looked there was no facility
to flag an LV in a manner that would accord it treatment from the
various utilities appropriate to it's status as a boot volume
(such as, for example, not moving about). Of course, when I looked
there wasn't any functionality in the utilities that did anything
to worry about :-) (but user-space code is easier written than 
on-disk representations are changed)

(unless its already been done ...) by the time anyone gets around to it,
the various bios limitation of PCs, etc will all be just a memory.

> But if grub supports LVM2 properly (add a trivial mapping layer from LV
> extents to physical sectors, then populate it from the LVM2 metadata
> across an agreed interface from a library maintained as part of the lvm2
> package) it won't require anything like that of course - the hardest
> problem I think is actually for it to identify the right disks to use.

(and yet strangely we all manage to boot ... !?!? )

... or everyone uses a boot-loader that reads filesystems, and they all
learn to read LVM too :-)

Regards,
Paddy
