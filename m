Return-Path: <russell@coker.com.au>
From: Russell Coker <bofh@coker.com.au>
Subject: Re: [linux-lvm] any way to locate vg's on, say, /etc?
Date: Sun, 7 Jan 2001 18:27:23 +1100
References: <3A57B052.FA0DFBB2@wrkhors.com>
In-Reply-To: <3A57B052.FA0DFBB2@wrkhors.com>
MIME-Version: 1.0
Message-Id: <0101071827230Q.05036@lyta>
Content-Transfer-Encoding: quoted-printable
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
To: linux-lvm@sistina.com, Steven Lembark <lembark@wrkhors.com>

On Sunday 07 January 2001 10:54, Steven Lembark wrote:
> currently have a choice:  LVM or devfs.  since devfs essentially
> wipes out any /dev/blah dir's created after boot when it is
> remounted using /dev/ w/ vgcreate causes pain.  short of hacking
> soft links or archiving the devices w/ cpio every boot, putting
> the vol group dir's outside dev seems like the easiest fix.
>
> personal guess would be /etc or /LVM as likely places.
>
> just wondering if "/dev" is hard-coded or configurable
> in the kernel headers somewhere...

You can mount devfs on another location...

But that's not the solution either.  Every kernel driver should have
#ifdef CONFIG_DEVFS_FS
and then some code to create device nodes at the time it registers it's u=
se=20
of the device numbers.
Device drivers that aren't devfs aware are buggy.
/etc is totally wrong, it's only supposed to have config files.  Doing=20
otherwise would make Linux as crappy as Solaris.

The best solution to these types of problems would be to make devfs manda=
tory=20
for LVM and then only use the devfs functionality.  Then device numbers s=
top=20
being a problem.

--=20
http://www.coker.com.au/bonnie++/     Bonnie++ hard drive benchmark
http://www.coker.com.au/postal/       Postal SMTP/POP benchmark
http://www.coker.com.au/projects.html Projects I am working on
http://www.coker.com.au/~russell/     My home page
