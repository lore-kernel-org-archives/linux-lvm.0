Return-Path: <adilger@turbolinux.com>
From: Andreas Dilger <adilger@turbolinux.com>
Message-Id: <200102082249.f18MnQB08316@webber.adilger.net>
Subject: Re: [linux-lvm] Installation question: SW RAID1 + LVM for boot and root
In-Reply-To: <EA63CEA50DF8D311ABAD00B0D0211732024BE020@hal9000.hermes.si> from
 Luka Renko at "Feb 8, 2001 09:39:49 pm"
Date: Thu, 8 Feb 2001 15:49:26 -0700 (MST)
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

Luka write:
> I would like to setup server with two SCSI disks of same size on two SCSI
> channels with software RAID1 (md) and would like to put LVM on top of it.
> This RAID1 will be used for root, boot, swap and should also have other user
> data on it (this is why I want some flexibility that LVM can provide). 
> 
> 1. Is it possible to install OS directly on SW RAID1 + LVM?
> If not, how to do it in multiple steps (RAID HOWTO just mentions how to
> install OS on SW RAID1, but not using LVM on top of SW RAID)?

Unless installer supports it, you will have some problems.  You also need
latest CVS LVM kernel code, and patched LILO (not yet available) to have
/boot on LVM.  Unfortunately, I haven't released my LILO LVM /boot patch
because at this time my system is broken...

> 2. Are there any known problems on LVM over SW RAID1 (I have seen some bug
> reports on that)?

Some problems, but I think they are fixed.

> 3. RAID HOWTO talks about slow read performance with RAID1 and that it
> should be improved in new patches to come? Is this still true? Do I need to
> apply any patches for that?

Ask on RAID mailing list.

> 4. I have also seen some discussion about issues with putting swap on SW
> RAID? Is this still true?

Ask on RAID mailing list.

> 5. Should I create one or two (system, user) md devices? Is there any
> difference?

Ask on RAID mailing list.

> What about multiple LVM VGs and PVs? It seems to me, that it does not make
> any real difference...

Depends if you are running a production system or not.  In many cases, you
want to prevent a bad process from filling the filesystem and causing
problems for other processes (i.e. /tmp, /var, /home, /).

> 6. What version of kernel (2.2 or 2.4) is better for such configuration?
> What version of SW RAID and LVM should I use? Are there any additional
> patches I should apply?

Depends on what you use it for.  2.2 patch gives same LVM code as 2.4.  If
you apply Ingo RAID patches on 2.2, it is basically the same as well.

> 7. Does any distribution on the market (RedHat, SuSE, Mandrake...) have good
> support for configuration I want? Or even is able to install on SW RAID1 +
> LVM?   

I'm working on this for Turbolinux, but not yet there...

Cheers, Andreas
-- 
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
