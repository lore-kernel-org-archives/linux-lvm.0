From: Goetz Bock <bock@blacknet.de>
Subject: Re: [linux-lvm] Re: LVM writes on raw disk of ATA RAID Mirror
Message-ID: <20030430011344.N16789@zealot.blacknet.de>
References: <freemyer@NorcrossGroup.com> <20030429224201.13E0AAE4F5@basilica.la.naos.co.nz>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20030429224201.13E0AAE4F5@basilica.la.naos.co.nz>; from ewen@naos.co.nz on Wed, Apr 30, 2003 at 10:42:01AM +1200
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Help: <mailto:linux-lvm-request@sistina.com?subject=help>
List-Post: <mailto:linux-lvm@sistina.com>
List-Subscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=subscribe>
List-Unsubscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=unsubscribe>
List-Archive: <http://lists.sistina.com/pipermail/linux-lvm/>
Date: Tue Apr 29 18:13:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Wed, Apr 30 '03 at 10:42, Ewen McNeill wrote:
> [ ... ]  Is that for the 3Ware 7000-2 card, which appears to be
> a 2-drive (single IDE channel?), [ ... ]
most likely for the 7000-2 card, what can only do raid0/1 and threfor
lakes the expensive raid5 engine. still i use it happily

> >Obviously, LVM and MD should still work together regardless.
> FWIW, my problem is with LVM and ata-raid [ ... ]
> Perhaps making LVM and ataraid work together properly is "too hard"
> [ ... ]
> But IMHO either LVM and ataraid should work properly, or it should be
> really really obvious that they won't work together
during my last/first/only time i had to deal with ataraid, and IIRC,
the promise IDE driver had a compile time flag where it would not touch
initialised raid arrays.
aktivating this flag would simply remove the offending disks from the
list of ide disks and make it available via ataraid only.

OTOH I might have had a too long day and my memory is all wrong.

lukily I don't have to deal with this box any more ;-) and therefor can
not check this.
-- 
Goetz Bock       (c) 2003 as     blacknet.de - Munich - Germany   /"\
IT Consultant    GNU FDL 1.1    secure mobile Linux everNETting   \ /
                                                                   X
 ASCII Ribbon Campaign against HTML email & microsoft attachments / \
