From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] pv_move failed
Message-ID: <20030225161237.A832@sistina.com>
References: <3E5B382B.2090908@conterra.de>
Mime-Version: 1.0
In-Reply-To: <3E5B382B.2090908@conterra.de>; from stueken@conterra.de on Tue, Feb 25, 2003 at 10:32:27AM +0100
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
Date: Tue Feb 25 09:19:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-lvm@sistina.com

Dieter,

the first write to hda2 fails.
Could be a hardware installation problem with your new drive.

Have you tested if you can access hda2 fine without LVM ?

Regards,
Heinz    -- The LVM Guy --

On Tue, Feb 25, 2003 at 10:32:27AM +0100, Dieter Stueken wrote:
> I just got my new 240GB disk and want to move my VG to it.
> Unfortunately I get an unexpected error:
>=20
> lv: /dev/backup/mirror[2]  old_dev: 22:00  new_dev: 03:02
> old_pe_sector: 117703032  new_pe_sector: 357564792
> pvmove -- opening output physical volume "/dev/hda2"
> pvmove -- llseeking input physical volume "/dev/hdc"
> pvmove -- llseeking output physical volume "/dev/hda2"
> pvmove -- /dev/hdc [PE 897 [mirror [LE 2727]] -> /dev/hda2 [PE 2727] [1=
/247]
> pvmove -- locking physical extent 897 of "/dev/hdc" in kernel
> pvmove -- about to read input physical volume "/dev/hdc" and to write
> output physical volume "/dev/hda2"
> pvmove -- ERROR writing output physical volume "/dev/hda2" (still
> 12648448 bytes to write)
> pvmove -- ERROR "pv_move_pe(): writing output PE" moving physical exten=
ts
>=20
> this time I can not identify any reason an no messages on syslog.
> Any idea? What informations should I dump/post in addition?
>=20
> I'm using SuSE8.1 with kernel 2.4.20, the LVM-version is 1.0.5.
>=20
> ... and, sorry for my ill formed subject line from last week.
>=20
> Dieter
> --=20
> Dieter St=FCken, con terra GmbH, M=FCnster
>      stueken@conterra.de
>      http://www.conterra.de/
>      (0)251-7474-501
>=20
>=20
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

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
