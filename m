Return-Path: <bluca@comedia.it>
Date: Fri, 9 Feb 2001 10:38:46 +0100
From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] Installation question: SW RAID1 + LVM for boot and root
Message-ID: <20010209103846.C23155@colombina.comedia.it>
References: <EA63CEA50DF8D311ABAD00B0D0211732024BE020@hal9000.hermes.si>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <EA63CEA50DF8D311ABAD00B0D0211732024BE020@hal9000.hermes.si>; from luka.renko@hermes.si on Thu, Feb 08, 2001 at 09:39:49PM +0100
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-raid@vger.kernel.org, linux-lvm@sistina.com

On Thu, Feb 08, 2001 at 09:39:49PM +0100, Luka Renko wrote:
> 1. Is it possible to install OS directly on SW RAID1 + LVM?
> If not, how to do it in multiple steps (RAID HOWTO just mentions how to
> install OS on SW RAID1, but not using LVM on top of SW RAID)?

not yet, i used an extra disk to install the system on, then cpio-ed
everything.

> 2. Are there any known problems on LVM over SW RAID1 (I have seen some bug
> reports on that)?

no, if you use the 0.9.1betaX

> 3. RAID HOWTO talks about slow read performance with RAID1 and that it
> should be improved in new patches to come? Is this still true? Do I need to
> apply any patches for that?

i believe the code in 2.4 is optimized (but you better look for mikka's
patch and see if it applies to you, i use raid5 so i dinna check).

> 4. I have also seen some discussion about issues with putting swap on SW
> RAID? Is this still true?

with 2.2 it is problematic and cannot be fixed, it has been fixed in 2.4

> 5. Should I create one or two (system, user) md devices? Is there any
> difference?
> What about multiple LVM VGs and PVs? It seems to me, that it does not make
> any real difference...

1 md device, 1 pv, 1 vg (no way out with only 2 disks)
i dunno if the latest lilo can see LVM-OVER-RAID1, if not
1 small md device for /boot
1 big md for lvm

> 6. What version of kernel (2.2 or 2.4) is better for such configuration?
> What version of SW RAID and LVM should I use? Are there any additional
> patches I should apply?

2.4 (sw raid is included, lvm patches from cvs)

-- 
Luca Berra -- bluca@comedia.it
        Communication Media & Services S.r.l.
 /"\
 \ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
 / \
