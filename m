From: Theo Van Dinter <felicity@kluge.net>
Subject: Re: [linux-lvm] Mandrake 8.1 and LVM
Message-ID: <20011130114912.K26718@kluge.net>
References: <Pine.LNX.4.21.0111291649440.435-100000@sol.rune.org> <Pine.LNX.4.33.0111291608480.4437-100000@lx1.daboard.com> <20011129190920.B23998@kluge.net> <20011130020118.C17482@wookimus.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-md5;
	protocol="application/pgp-signature"; boundary="envbJBWh7q8WU6mo"
Content-Disposition: inline
In-Reply-To: <20011130020118.C17482@wookimus.net>; from chewie@wookimus.net on Fri, Nov 30, 2001 at 02:01:18AM -0600
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
Date: Fri Nov 30 10:47:01 2001
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

--envbJBWh7q8WU6mo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 30, 2001 at 02:01:18AM -0600, Chad C. Walstrom wrote:
> Reason #1:  Mount /usr as read-only.  There is only one reason why you
> should mount /usr read/write: to install software.  Upon completion of
> this one task, remount the drive as read-only.  Lock it down with kernel
> capabilities tools, and be done with it.  [apt-get has a nice way to
> auto-remount the drive in apt.conf(5) when installing/upgrading
> software.]

That depends on how paranoid you are regarding security.  My feeling
is that if someone can get enough access to write to pieces of / and
/usr that they shouldn't, they will likely have enough access to damage
the system anyway (fdisk/dd/lilo/grub/etc.)  So you really only protect
yourself from accidental damage (which shouldn't happen on a properly
configured box) and attackers who aren't creative.  ;)

I don't know much about the kernel capabilities facility, but if you
can mount the partition read-write to install apps without rebooting,
you haven't bought yourself anything.  If you can't (I assume that's
the benefit,) then you'll have to take a downtime whenever you want to
upgrade something which may or may not be a problem in your environment.

The "no reason" bit was more aimed at the carry-over from OSes like
SunOS where it was suggested (although I forget why at the moment) that
/ and /usr be on different partitions.  I think it was something about
partition location on disk, but that's another discussion.  :)

> Reason #2:  With LVM, you don't have to worry about exceeding the
> standard "allowed" harddrive partitions.  So, create logical volumes to
> your heart's (*ahem*) extent.  With filesystem and logical volume
> resizing, the flexibility and convenience outweight the small
> "overhead."

You're right about the exceeding available space, but /usr in LVM also
means that given a problem with LVM, you're unlikely to be able to get
your box to single-user mode.  Even if you do (I haven't tested this),
you're going to find a very limited environment without /usr.

With / on LVM, you're definately unable to boot if LVM has problems.

This is a problem I've seen a number of times on HPUX.  The OS disk is
under LVM in vg00.  People want more disk space and so they add another
disk to vg00 and go make new logical volumes (or worse, extend OS lvs.)
It's not a problem until this new disk fails (or isn't powered on before
bootup, or ...)  Then the volume group can't be started and the machine
won't boot.  If you've extended a core OS lv (/, /usr, /var, etc,) you've
just won yourself a restore/reinstall.  All that while having the main OS
disk still running perfectly.

At least with / and /usr outside of LVM, it'd likely be easier to recover
from the failure.

> Reason #3: It's just plain strange to have / share space with /usr.

Matter of opinion. :)

> Reason #4: For someone new to Linux, LVM provides you with the
> opportunity to correct a mistake without having to reinstall your system
> because you'd prefer a different harddrive partition layout.

True, but it also adds more complexity to setting up and maintaining the
system.

> Experiment, have fun.  With LVM, you can afford to play in order to find
> that "perfect" balance of partitioning and practicality.

:)

--=20
Randomly Generated Tagline:
"UNIX was not designed to stop you from doing stupid things, because
 that would also stop you from doing clever things." - Larry Wall

--envbJBWh7q8WU6mo
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE8B7iIAuOQUeWAs2MRAq7cAJ9iJJh3Op+n7+oimwUAOkuzim3D2QCfVbtt
1vLSbnEgQHJ2KnYqL9XCGFQ=
=wB4g
-----END PGP SIGNATURE-----

--envbJBWh7q8WU6mo--
