References: <a308600f-4a00-038c-1c6d-947564130712@wisi.se>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <1ba300a6-3d33-35d3-657a-3e4a35c87c5b@redhat.com>
Date: Mon, 30 Sep 2019 11:06:09 +0200
MIME-Version: 1.0
In-Reply-To: <a308600f-4a00-038c-1c6d-947564130712@wisi.se>
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
Subject: Re: [linux-lvm] vg activation without backup
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>, =?UTF-8?Q?Max_Halld=c3=a9n?= <max.hallden@wisi.se>

Dne 27. 09. 19 v 11:14 Max Halld=EF=BF=BDn napsal(a):
> Hi all,
>=20
> I'm running this command:
>=20
> root@(none):~# vgchange -A n -a y my_vg
>    -A option not necessary with -a option
>    Run `vgchange --help' for more information.
>=20
> It seems like activation (-a) implies autobackup (-A) since it doesn't ac=
cept the option to disable it. Is the backup really required when activatin=
g the group? I would rather skip it.
>=20

Hi

This looks like regression in argument parsing  -  please open BZ for this =

case. Use either the community BZ:

https://bugzilla.redhat.com/enter_bug.cgi?product=3DLVM%20and%20device-mapp=
er

or Fedora or RHEL one if you use those.

Thank you.

Zdenek
