Return-Path: <adilger@turbolinux.com>
From: Andreas Dilger <adilger@turbolinux.com>
Message-Id: <200102071810.f17IAmY14296@webber.adilger.net>
Subject: Re: [linux-lvm] Help! Problems finding VG after reboot.
In-Reply-To: <20010207172506.7555.qmail@fraggle.cs.uit.no> from "gobo@gimle.nu"
 at "Feb 7, 2001 06:25:06 pm"
Date: Wed, 7 Feb 2001 11:10:47 -0700 (MST)
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
List-Id: <linux-lvm.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Gobo writes:
> I tried viewing the output of pvdata as shown in that thread, and I think 
> that might be the source of my problems. At least if all the UUIDs are 
> supposed to be equal.
> 
> I have attached the results from that to this mail along with the results
> form running vgcfgrestore -ll. Please note that the pvdata outputs are
> taken after I had tried running vgcfgrestore on all the partitions.
> 
> I hope someone has a way/hack to get this VG back online. I would really
> appreciate getting my files back.

There are two ways to fix this:

1) comment out the UUID checking in pv_read_all_pv_of_vg(), recompile.
2) apply the UUID patch I posted to the list a few hours ago, recompile
   and re-run vgcfgrestore.  This patch will force creation of new UUIDs
   for all PVs which are missing them, and it will do it properly so
   that they are stored on all disks.

Cheers, Andreas
-- 
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
