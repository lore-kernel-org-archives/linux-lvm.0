References: <247479609.632.1531229415513.JavaMail.zimbra@karlsbakk.net>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <1fa6a7fd-ca41-2cc8-8d16-65edef58f124@redhat.com>
Date: Sun, 15 Jul 2018 21:39:42 +0200
MIME-Version: 1.0
In-Reply-To: <247479609.632.1531229415513.JavaMail.zimbra@karlsbakk.net>
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
Subject: Re: [linux-lvm] Removing/reinstalling lvmcache
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
Content-Type: text/plain; charset="windows-1252"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>, Roy Sigurd Karlsbakk <roy@karlsbakk.net>

Dne 10.7.2018 v 15:30 Roy Sigurd Karlsbakk napsal(a):
> Hi all
>=20
> I beleive I've removed the old lvmcache, but attempting to install a new =
one after a reinstall seems not to work.
>=20
> # lvs -a
>    LV         VG   Attr       LSize  Pool Origin Data%  Meta%  Move Log C=
py%Sync Convert
>    data       data -wi-ao---- 13,67t
>    data_corig data vwi-a-v--- 13,67t
>    root       sys  -wi-ao---- 82,45g
>    swap       sys  -wi-ao----  3,72g
>    swap2      sys  -wi-ao----  8,00g
>=20
> Can I safely remove data_corig without risking losing my stuff? I don't q=
uite understand how it all fits here=E2=80=A6


Hi

I don't quite understand how did you get into this situation.

Were you manipulating metadata yourself with 'vi' editor and vgcfgrestore ?

What is the lvm2 version in use ?

What were the previous commands/errors before you ended in this state ?




Regards

Zdenek
