Return-Path: <josv@osp.nl>
Date: Mon, 30 Jul 2001 11:28:18 +0200
From: Jos Visser <josv@osp.nl>
Subject: Re: [linux-lvm] rw-snapshot as an addition for lvm
Message-ID: <20010730112818.F760@jadzia.josv.com>
References: <20010728182741.S13121@schlund.de> <20010730105726.E562@btconnect.com>
Mime-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20010730105726.E562@btconnect.com>; from thornber@btconnect.com on Mon, Jul 30, 2001 at 10:57:26AM +0100
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

The question I would have is whether rw-snapshots (or, snapshots in
general), should be implemented in LVM or as a separate driver/layer. In
that case, a snapshot could be taken of any block device, not only of a
logical volume.

Another interesting feature that I might add that would be handy here is
the "dynamic LV". This would be a LV that can extend dynamically if so
requested. The advantage of this would be that you could use the dynamic
LV as the buffer space of a snapshot. If the snapshot requires more
space, the LV could extend dynamically to allow for this....

++Jos

And thus it came to pass that Joe Thornber wrote:
(on Mon, Jul 30, 2001 at 10:57:26AM +0100 to be exact)

> On Sat, Jul 28, 2001 at 06:27:41PM +0200, Anders Henke wrote:
> > I think it's also quite interesting to have a rw-snapshot in which chan=
ges
> > of both real and snapshot are being written to a smaller bufferspace on=
 disk:
> > the snapshot always represents the state of the LV when taking the snap=
shot,
> > but permits changes on 'its copy'.
>=20
> See other thread in the last few days on rw snapshots;  Yes, it's an
> execellent idea.
>=20
> - Joe
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html

--=20
Im verzeihen des Unverzeihlichen ist der Mensch der gottlichen Liebe am n=
=EF=BF=BDchtsten.
