From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] disk failed
Message-Id: <20020205105606.A30823@sistina.com>
References: <A56A8E5E02CBD511881800306E002CCA04F002@mrspdc.mrs.com.cn>
MIME-Version: 1.0
In-Reply-To: <A56A8E5E02CBD511881800306E002CCA04F002@mrspdc.mrs.com.cn>;
    from carl.huang@mic.com.tw on Tue, Feb 05, 2002 at 05:33:35PM +0800
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
Date: Tue Feb  5 03:57:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-lvm@sistina.com

Hi Carl.

On Tue, Feb 05, 2002 at 05:33:35PM +0800, carl.huang [=FCS=BD=A8=E4h] wro=
te:
> hello,
>=20
> I'm new to lvm and sorry for my english.
>=20
> I have a question: if I create a lv on vg that consists of
> /dev/hdb,/dev/hdc,/dev/hdd. Now if disk /dev/hdb fails,will all the dat=
a on
> the lv be lost?  I make an experiment: if /dev/hdc or /dev/hdd fails, t=
he
> data will only
> lose on the failed disk, but if /dev/hdb fails ,the lv will not work. I

If your LV containing a filesystem is spread over all 3 PVs and one fails=
,
that part of your filesystem will not be accessable after you restored
the LVM metadata to a replacement drive.

> think the reason is the filesystem(ext2) metadata is stored on the firs=
t
> disk. If filesystem is reiserfs, the lv will also not work more no matt=
er
> what disk fails.

Filesystems typically spread their metadata and data over the underlying
device. So it depends on the fill degree and usage patterns how much data
you might lose with your drive.

>=20
> So it's really a risk to use multiple disks together?=20

If you don't have disk redundancy (RAID either with Linux MD or in Hardwa=
re),
grouping multiple drives together grows the likelyhood to lose data.

> How to avoid it or I make a mistake?

Use RAID to avoid losing data due to hardware flaws
and take backups.

>=20
> Thanks for any suggestion.
>=20
> Carl.
>=20
>=20
>=20
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html

--=20

Regards,
Heinz    -- The LVM Guy --

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
