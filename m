From: Mike Williams <mike@gaima.co.uk>
Subject: Re: [linux-lvm] RAID 1 on Device Mapper - best practices?
References: <16272.19483.577313.115811@gargle.gargle.HOWL> <200310172128.10259.mike@gaima.co.uk> <16272.21933.838510.310433@gargle.gargle.HOWL>
In-Reply-To: <16272.21933.838510.310433@gargle.gargle.HOWL>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Message-Id: <200310172212.06301.mike@gaima.co.uk>
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
Date: Fri Oct 17 16:13:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: Text/Plain; charset="us-ascii"
To: linux-lvm@sistina.com

=2D----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On Friday 17 October 2003 21:48, John Stoffel wrote:
> Well, it could make more sense that way, but I was trying to get it do
> that I could move and expand/shrink the filesystems as needed on the
> various volumes.

Ahh, but that's the beauty of RAID and LVM, what you end up with is just=20
another block device. Which ever way you do it you'll get the same benefit.

> The other downside of the MD underneath LVM is that when a MD RAID
> goes bad, I need to resync the entire disk.  In my setup, if I don't
> have it mounted (or being used) and I corrupt it, there's less data to
> have to re-mirror.
>
> At least that was my goal.

That's certainly a very good idea.

> Yeah, I thinking I need to just tweak the scripts under debian as
> well, but I wanted to find out what people found to be the best way to
> do this.

=2D From what I've read LVM is only capable of linearing or striping, so RA=
ID=20
seems to be the only option.

=2D --=20
Mike Williams
=2D----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.3 (GNU/Linux)

iD8DBQE/kFsmInuLMrk7bIwRAp2WAKCO+zdHrAIYEQm/2ov+crkhCgcLxQCfe81i
0s7o0RZ1gCTf2I4deV4kRNk=3D
=3DNwaX
=2D----END PGP SIGNATURE-----
