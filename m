Return-Path: <lewis@sistina.com>
From: lewis@sistina.com
Date: Wed, 3 Jan 2001 12:24:24 -0600
Subject: Re: [linux-lvm] Another strange setup by a newbie, but strange oops resulted while trying vgextend/vgmerge!
Message-ID: <20010103122424.A7979@sistina.com>
References: <20010103.13131495@dmitzlaff2.botschendv.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="RnlQjJ0d97Da+TV1"
Content-Disposition: inline
In-Reply-To: <20010103.13131495@dmitzlaff2.botschendv.de>; from hackbyte@gmx.de on Wed, Jan 03, 2001 at 01:13:14PM +0000
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
To: linux-lvm@sistina.com

--RnlQjJ0d97Da+TV1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 03, 2001 at 01:13:14PM +0000, Daniel Mitzlaff wrote:
> First, i ran into the same problems as reported before here on the list,=
=20
> vgmerge and vgextend give me OOPS while extending the LE counter for the=
=20
> VG.

Joe has responded about this already.

> BUT, all my drives are filled up with data, there's NO BACKUP(!), and no=
=20
> way to take more than a single drive free for reformatting.

If this is a production system, you should really should have some backup.
There are plenty of things that can go wrong without even putting layers li=
ke
LVM into the picture.  I agree that upgrading LVM should not mess up you're
data, but if you have no backup, you are taking a lot of risks no
matter what. I do understand that for home systems backup is a difficult is=
sue,
but bad things do happen even with the most finely tuned systems.  CD burne=
rs
are a cheap and effective way to backup user data, and hard drives are cheap
enough now that you could buy a cheap external drive with large capacity to=
 do
backups to.  That said, it is very unlikely that you will loose data to LVM.
Even the issues that have come up on the list don't cause data corruption.

> So, i tried the patches sent by Heinz =96 not really knowing where to pat=
ch=20
> it =96 in the lvm-userland, recompiled =96 no change at all. Please, tell=
 me=20
> if it is correct to use the patch at the userland-tools instead of=20
> patching the kernel-parts. And, can you tell me (and others) in which=20
> order we have to see the patch?, plain patch for native LVM0.9, are there=
=20
> other patches? (CVS snapshots are no choice!)

Which patches are you talking about here?

> Ok, next ->
> What the heck are you guy's doing? I use a native RH6.2 installation w/o=
=20
> any updates/fixes (except for network security), using 2.2.17 and 2.2.18=
=20
> kernel-tarballs (the ..17 patches works well on ..18, only a few rejects=
=20
> which can easily inserted by hand;). But you CAN'T release a version that=
=20
> does not work w/o telling users if they had to look at some dependencies!=
=20
> (if there are some, remember i use a really clear RH6.2!)

First of all, if you are using the stock redhat packages, and they don't wo=
rk
with the new LVM stuff, please complain to RedHat.  They are the ones that
should deal with that.=20

Secondly, what are you talking about? --> "version that does not work"=20
What is this?  Are you using the RPMs off the sistina site?  Did you compile
the packages yourself?  If you used the sistina packages, make sure the lib=
lvm*
files are removed from /lib.  My initial packages installed into /usr/ inst=
ead
of root.  I will get new packages out shortly that correct this problem.  I
was hoping the transition issue would be resolved before I did this, but it
looks like I need to get new packages out first and then deal with that.
You can also look at
http://distro.conectiva.com.br/experimental/lvm/
for a version of the LVM packages that supports both the old (0.8.x) and the
new (0.9.x) interfaces.

> Ok, so please tell me where i can get a release that works on my server,=
=20
> it isn't uncool to me if i had to use an old but STABLE version =96 but=
=20
> tell the users in all your released files WHICH version IS definitively=
=20
> STABLE.

Define stable.  I don't know of any software package that is 100% stable.
There are always issues to track down.  Point releases, such as LVM 0.9 are
especially prone to that.  You should know that.  If you are concerned about
it, don't upgrade immediately.  Monitor the linux-lvm and lvm-devel mailing
lists and see what problems people have.  That's why we archive the mailing
lists.

> Yes, as you can see, i read the complete ML about this problem, i found=
=20
> reports and patches adressing this, but there's no help. And don't think=
=20
> all your users, who want to use LVM, are able to use CVS snapshots (i=20
> never use cvs snapshots on my server =96 release is release =96 features=
=20
> against bugs;).

Good, I'm glad you are reading the ML.  We are working on the issues.  Heinz
has been out of contact for a few weeks due to a move and other issues, whi=
ch
is delaying feedback.  Sorry about that.  :(

> Grmpf, ok all my frustration is left out, what can we do? ;)
> greetings, hackbyte -> hackbyte@gmx.de, IRCNet hackbyte @ #linux.de,=20
> +linux.de

I understand your frustration, but know that we are working on this.  As I
said earlier, most point releases have issues that need to be worked out,
and LVM 0.9 is no exception.  If you want a "stable" release, you
should probably use LVM 0.8.1 for now.  LVM 0.9.1 should be out soon, which
should have all the *known* bugs fixed.

Regards,
--=20
AJ Lewis
Sistina Software Inc.                  Voice:  612-379-3951
1313 5th St SE, Suite 111              Fax:    612-379-3952
Minneapolis, MN 55414                  E-Mail: lewis@sistina.com
http://www.sistina.com

Current GPG fingerprint =3D 3B5F 6011 5216 76A5 2F6B  52A0 941E 1261 0029 2=
648
Get my key at: http://www.sistina.com/~lewis/gpgkey
 (Unfortunately, the PKS-type keyservers do not work with multiple sub-keys)
-----Begin Obligatory Humorous Quote----------------------------------------
THE LESSER-KNOWN PROGRAMMING LANGUAGES #16:
C- This language was named for the grade received by its creator when he
submitted it as a class project in a graduate programming class.  C- is
best described as a "low-level" programming language.  In fact, the
language generally requires more C- statements than machine-code statements
to execute a given task.  In this respect, it is very similar to COBOL.
-----End Obligatory Humorous Quote------------------------------------------

--RnlQjJ0d97Da+TV1
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.4 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE6U25YpE6/iGtdjLERAhynAKCVvve8J+Yw8/1YRSWuB8UgR5miQACeM8fp
97IE/EC19ENceC6zs7qHC/Q=
=XiP0
-----END PGP SIGNATURE-----

--RnlQjJ0d97Da+TV1--
