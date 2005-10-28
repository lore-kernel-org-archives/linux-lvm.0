Received: from agk.surrey.redhat.com (agk.surrey.redhat.com [172.16.10.74])
	by pobox.surrey.redhat.com (8.12.8/8.12.8) with ESMTP id j9SLL2vl008173
	for <linux-lvm@redhat.com>; Fri, 28 Oct 2005 22:21:02 +0100
Received: from agk by agk.surrey.redhat.com with local (Exim 4.34)
	id 1EVbeo-0005mX-H7
	for linux-lvm@redhat.com; Fri, 28 Oct 2005 22:21:02 +0100
Date: Fri, 28 Oct 2005 22:21:02 +0100
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] pvresize patch pending
Message-ID: <20051028212102.GK11086@agk.surrey.redhat.com>
References: <1130518796.4362590c75cf0@webmail.volumehost.com>
	<20051028170130.GH11086@agk.surrey.redhat.com>
	<1130519874.43625d4253324@webmail.volumehost.com>
	<1130522152.436266287429e@webmail.volumehost.com>
	<20051028192752.GJ11086@agk.surrey.redhat.com>
	<436286B3.80604@cantab.net>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <436286B3.80604@cantab.net>
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

On Fri, Oct 28, 2005 at 09:14:43PM +0100, Zak Kipling wrote:
> Indeed. I've recently been working on an implementation myself 
> (primarily because I wanted to grow a live PV on my own system), which 
> I've attached in its current (somewhat rough, but seemingly working) 
> state as a patch against CVS HEAD.
 
Unless I've missed something while skimming through, I think the code 
still needs a preceding 'pvcreate --restorefile' equivalent to ensure 
the size of the device is set correctly in the label (for PVs in a VG).
(But since the 'Reinstate full PV size when removing from VG.' fix,
perhaps a code audit would show that we can safely override that label 
field with the one taken from the VG and allow it to remain wrong on disk.)

  https://www.redhat.com/archives/linux-lvm/2005-July/msg00033.html
  https://www.redhat.com/archives/linux-lvm/2005-July/msg00029.html
  pvs -o +dev_size

Apart from that and the process_each_pv() simplification, it 
looks pretty good!

> * Support for metadata formats other than format_text.

Let's just exclude them with a FMT_RESIZE_PV feature flag.
 
> * Support for more than one mda on a PV (I think it will currently 
> clobber ones at the end of the PV, since it assumes all space after 
> pe_start is available for extents).
 
Check the number of mdas on the PV and refuse to proceed if it exceeds 1.
We need to write separate new tools to add/remove/manipulate mdas.

Alasdair
-- 
agk@redhat.com
