From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] Howto Make LVM Work With NBD/ENBD?
Message-Id: <20020430155338.D4879@sistina.com>
References: <00e301c1e7b2$4f501d90$f42cb69d@cerc.wvu.edu>
    <1020086556.3ccd491c5efd7@mail.holanyi.hu>
MIME-Version: 1.0
In-Reply-To: <1020086556.3ccd491c5efd7@mail.holanyi.hu>; from
    csani@lme.linux.hu on Mon, Apr 29, 2002 at 03:22:36PM +0200
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
Date: Tue Apr 30 08:56:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-lvm@sistina.com

On Mon, Apr 29, 2002 at 03:22:36PM +0200, Csan (Ja'nos Hola'nyi) wrote:
> Hi Ning,
>=20
> I had similar problems with exactly the same ERROR message.
> I figure this is lvm10...?
> In that case, please check if _noprocdir[] and _devdir[] sections in
> LVM/1.0.3/tools/lib/lvm_dir_cache.c contain the line:
>=20
>         LVM_DIR_PREFIX "nb",

FYI: have replaced that nasty hard-coded device spec in LVM1 CVS by
     an environment variable configurable approach.

export LVM_DEVICES=3D"sdb;sdc;nb:0"

will just use /dev/sd[bc]* (16 partitions by default)
and /dev/nb* (0 partitions).

Without that environment variable, defaults like in earlier versions
are used.

Regards,
Heinz    -- The LVM Guy --

>=20
> If not, insert, make (in LVM/1.0.3/), make install and it should work.
>=20
> If you're on Debian, you could also check out the APT archives at
>=20
> deb http://people.debian.org/~patrick unstable main
>=20
> and install lvm10 from there (they're OK also for Debian 3.0 woody). Th=
at
> package already contains these fixes.
>=20
> (BTW, I am actually building a HA cluster with DRBD+LVM. DRBD uses nbd.
> Currently there are some issues on the standby node - LV detection not =
working
> yet -, but we're slowly getting there. The active node has ext3fs on th=
e LV, and
> the replication works great... so far.)
>=20
> Best regards,
>=20
> Csan
>=20
> PS: thanks for the above fixes go to "ejt" and "pjc" guys on #lvm
> (irc.openprojects.net)
> Please CC: me if you're replying as I am not subscribed to the list.
>=20
> Quoting Ning Ye <nye@csee.wvu.edu>:
>=20
> > Hi!,
> >=20
> >     I want to make them work together, which makes me crazy these day=
s.=20
> >=20
> >=20
> >     I can initialize the disks and partitions exported by ENBD, but w=
hen
> > trying to create a volume group on it, vgcreate fails.
> > # vgcreate my_volume /dev/ndb
> > vgcreate -- ERROR "pv_read(): read" reading physical volumes
> >     After examine the debug output, it looks to me lvm trying to
> > enumerate all physical disks present to the system.  These disks incl=
ude
> > SCSI disks(sda...), IDE disks(hda...) and loops(loop0...).  However, =
the
> > LVM will not recognize the exported disk as a physical one.
> >=20
> >     Did any one ever make it work before?  I would like to know befor=
e I
> > am trying to look into the code.  Combining these two great packages
> > would be wonderful.  But how?  Help needed.  Thanks.
> >=20
> >                 Ning
> >=20
> >=20
>=20
>=20
>=20
> Csan
>=20
> J=E1nos Hol=E1nyi
> Association of Hungarian Linux Users
> Email: csani@lme.linux.hu
>=20
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html

*** Software bugs are stupid.
    Nevertheless it needs not so stupid people to solve them ***

=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D=
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=
=3D-=3D-

Heinz Mauelshagen                                 Sistina Software Inc.
Senior Consultant/Developer                       Am Sonnenhang 11
                                                  56242 Marienrachdorf
                                                  Germany
Mauelshagen@Sistina.com                           +49 2626 141200
                                                       FAX 924446
=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D=
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=
=3D-=3D-
