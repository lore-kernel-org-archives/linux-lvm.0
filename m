From: Vincent AE Scott <linux.lvm@codex.net>
Subject: Re: [linux-lvm] is devfs required?
Message-Id: <20020222214037.A28086@majestic.ukshells.co.uk>
References: <20020221143602.F328@majestic.ukshells.co.uk>
    <20020222201251.GG30259@colombina.comedia.it>
MIME-Version: 1.0
In-Reply-To: <20020222201251.GG30259@colombina.comedia.it>
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
Date: Fri Feb 22 15:40:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Luca Berra(bluca@comedia.it)@Fri, Feb 22, 2002 at 09:12:51PM +0100:
> On Thu, Feb 21, 2002 at 02:36:02PM +0000, Vincent AE Scott wrote:
> > i'm using LVM on a 2.4.17-19mdk kernel patched up to 1.0.3
> > it *appears* that when i boot up without devfs support, i frequently
> > cant create/extened/mount filesystems.  but when i boot up with devfs
> > support it seems to work.
> > 
> > is devfs required to use LVM?
> i am also using 2.4.17-19mdk + LVM
> the issue is not with the kernel portion but with the tools portion
> if you start using lvm with devfs you are stuck with it and vice-versa.
> i proposed a workaround about 13 months ago, but never actually got
> to code it. :(

errr, are you saying that it's not possible to switch between devfs and
non-devfs, as soon as you use the former?

i thought i'd actually done exactly that, i.e. rebooted without devfs
mounted.  but i could be wrong.


 
> > without it, ive seen lvcreate SEGV when attempting to create a new
> > volume.  
> which version of the tools are u using?

i started off with 1.0.1-rc4ish, which came from lvm-1.0.1-1mdk.
but since then, i've upgraded kernel+tools to 1.0.3


> if it is current can you provide a debug output?


alas, not anymore, but i did strace the binaries a few times.
each time it looked like they were enumerating devices on the system,
going thru ide devices, and then loopback ones.  it was when going thru
the loopback devices that it consistantly crashed.  each time it was the
same one, loop8 IIRC.  altho, i think it was probably more todo with
going thru a certain *number* of devices.

i did build debug binaries, and again, IIRC, i think the SEGV was in
either:

	vg_status_with_pv_and_lv.c
or	vg_setup_pointers_for_snapshots.c


if it sounds like something which has already been fixed, then please
ignore me.  but if it's not, then i can always revert the
binaries/kernel and provide more in depth information.


> if you want to build an rpm for recent tools fetch spec and
> patch from http://www.comedia.it/bluca/lvm and adapt it
> to 1.0.3 (will upgrade the site soon)
> the mkinitrd stuff does not work with 2.4.17-19mdk and xfs

ahh, not a problem, i'm not using xfs for anything apart from testing,
as it doesnt appear to be that stable - for me anyway.


> 
> > or are there any known problems with using LVM on an SMP host?  i cant
> > think of anything else that might be causing these strange problems.
> no known issues.


oh, i've just thought of one other thing, that maybe? caused a problem:
i did create a LV and copied my entire /fs into it, then rebooted into
it to see if it all worked.  havent used it since tho.

is it possible that the data in /etc/lvm* on the original and LVM copied
partitions were not quite in sync with what was on disk?


regards,
-vince

-- 
PGP key:  http://codex.net/pgp/pgp.asc

 War is God's way of teaching Americans geography
 -- Paul Rodriguez
