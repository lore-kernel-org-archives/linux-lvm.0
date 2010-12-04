Received: from mx1.redhat.com (ext-mx09.extmail.prod.ext.phx2.redhat.com
	[10.5.110.13])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id oB4JcU7H015962
	for <linux-lvm@redhat.com>; Sat, 4 Dec 2010 14:38:30 -0500
Received: from mail09.linbit.com (mail09.linbit.com [212.69.161.110])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id oB4JcKGw027682
	for <linux-lvm@redhat.com>; Sat, 4 Dec 2010 14:38:21 -0500
Received: from soda.linbit (unknown [10.9.9.55])
	by mail09.linbit.com (LINBIT Mail Daemon) with ESMTP id D801610587CE
	for <linux-lvm@redhat.com>; Sat,  4 Dec 2010 20:38:19 +0100 (CET)
Date: Sat, 4 Dec 2010 20:38:17 +0100
From: Lars Ellenberg <lars.ellenberg@linbit.com>
Message-ID: <20101204193817.GE6034@barkeeper1-xen.linbit>
References: <201012042006.46803.d_baron@012.net.il>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <201012042006.46803.d_baron@012.net.il>
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
Content-Type: text/plain; charset="utf-8"
To: linux-lvm@redhat.com

On Sat, Dec 04, 2010 at 08:06:46PM +0200, David Baron wrote:
> I need more extents to move stuff off older, possibly failing IDE disks to my 
> new SATA terrabyter. However, not enough extents are available. The disk is 
> very sparsely populated.
> 
> Is there any way to "condense" physical volumes to recover/expose empty 
> extents in order to make use of them?

Does pvmove --alloc anywhere help?

Alternatively, you can specify exactly which extents go where,
like in "pvmove --test -n lvname.to.move /dev/pvold:20-27 /dev/pvnew:732-739".
obviously, remove --test, if it seems to do what you meant.

To see which what is where, and which extent ranges are free,
I tend to use variants of
pvs -o vg_name,lv_name,pv_name,pvseg_start,pvseg_size,seg_pe_ranges -Opv_name,pvseg_start
Note that pe_ranges are inclusive, (end of the range is: pvseg_start  + pvseg_size -1).

hth,

-- 
: Lars Ellenberg
: LINBIT | Your Way to High Availability
: DRBD/HA support and consulting http://www.linbit.com

DRBD� and LINBIT� are registered trademarks of LINBIT, Austria.
