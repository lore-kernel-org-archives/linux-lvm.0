Date: Thu, 18 Oct 2001 22:23:17 +0200
From: Ulrich Wiederhold <U.Wiederhold@gmx.net>
Subject: Re: [linux-lvm] replace bad hard disc
Message-ID: <20011018222317.C13359@sky.net>
References: <110278234233.20011015163039@difi.de> <20011016105533.A4318@sistina.com> <55520025253.20011018113954@difi.de> <20011018115318.A2771@balu.kawo2.rwth-aachen.de>
Mime-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20011018115318.A2771@balu.kawo2.rwth-aachen.de>
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
Content-Type: text/plain; charset="iso-8859-1"
To: linux-lvm@sistina.com

* Markus Dobel <mdobel@kawo2.rwth-aachen.de> [011018 11:53]:
> On Thu, Oct 18, 2001 at 11:39:54AM +0200, Stefan Onken wrote:
> >=20
> > > pvcreate /dev/sde1
> > > vgextend Stonki2 /dev/sde1
> > > pvmove /dev/sdd1 /dev/sde1
> > > vgreduce Stonki2 /dev/sdd1
> >=20
> > stupid question: what about resizing the reiserfs file system ?
> > Is it not necessary ?

Oh, but this means in my example I will have to lower the filesystem
(xfs), because I will remove a hd and added all my scace to the vg and
lv=B4s, right?
Is it possible to lower an xfs.filesystem to remove a HD or is it
possible to remove a HD without resizing (no mount now), add a new
bigger HD, grow the filesystem, mount it?

Uli
--=20
'The box said, 'Requires Windows 95 or better', so i installed Linux - TKK 5
