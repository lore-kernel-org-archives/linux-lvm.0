Subject: [Fwd: Re: [linux-lvm] Incorrect metadata area header checksum]
From: Eckhard Kosin <Eckhard.Kosin@online.de>
Date: Tue, 05 Feb 2008 14:26:36 +0100
Message-Id: <1202217996.12076.18.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: Alasdair G Kergon <agk@redhat.com>, linux-lvm@redhat.com

Hi Alasdair,

I'm sorry to mail directly to you,  but I tried three times without
success to post the below listed mail to linux-lvm@redhat.com , it
doesn't arrive their ;=3D{{  Perhaps you can check the reason, post my
mail to our thread in the list, and last but not least, do you have an
answer to my problem?

     Thank you very much, have a nice day

           Ecki=20


-------- Weitergeleitete Nachricht --------
> Von: Eckhard Kosin <Eckhard.Kosin@online.de>
> An: linux-lvm@redhat.com
> Betreff: Re: [linux-lvm] Incorrect metadata area header checksum
> Datum: Tue, 05 Feb 2008 12:52:16 +0100
>=20
> Am Montag, den 04.02.2008, 10:36 +0000 schrieb Alasdair G Kergon:
> > On Sun, Feb 03, 2008 at 07:06:48PM -0800, David Brown wrote:
> > > You'll probably find that there is a lvm2 label there.  I'm not sure =
of a
> > > safe way of elminiating it.
> Okay, there is a LVM label on hda7:
>=20
> ecki@uhu:~$ sudo dd if=3D/dev/hda7 bs=3D1k count=3D1 | hexdump -e '"%_p"'
> 1+0 records in
> 1+0 records out
> 1024 bytes (1,0 kB) copied, 6,4e-05 Sekunden, 16 MB/s
> .*
> LABELONE..*
> ..$. .*
> LVM2 0*
> 1EWhly9hF5TcIV1KyHfXVUQDBe7S1uf14.P.=3D..*
> ..*
> ..*
> ...*
>=20
> > =20
> > man pvremove
> I tried
>=20
> root@uhu:/home/ecki# umount -l /dev/hda7
> root@uhu:/home/ecki# pvremove /dev/hda7
>   /dev/hda7: Couldn't find device.  Check your filters?
>=20
> I changed my filter rule in /etc/lvm/lvm.conf from
>=20
> filter =3D [ "r|/dev/cdrom|", "r|^/dev/hda[1,6,7]$|" ]
>=20
> to
>=20
> filter =3D [ "r|/dev/cdrom|", "r|^/dev/hda[1,6]$|" ]
>=20
> but again no success:
>=20
> root@uhu:/home/ecki# pvremove /dev/hda7
>   Incorrect metadata area header checksum
>   Incorrect metadata area header checksum
>   Incorrect metadata area header checksum
>   Incorrect metadata area header checksum
>   Can't open /dev/hda7 exclusively.  Mounted filesystem?
>   Device '/dev/hda8' has been left open.
>   Device '/dev/hda9' has been left open.
>   Device '/dev/hda10' has been left open.
>   Device '/dev/hda10' has been left open.
>   Device '/dev/hda10' has been left open.
>   Device '/dev/hda8' has been left open.
>   Device '/dev/hda9' has been left open.
>   Device '/dev/hda8' has been left open.
>   Device '/dev/hda9' has been left open.
>   Device '/dev/evms/hda7' has been left open.
> root@uhu:/home/ecki# mount |grep hda
> root@uhu:/home/ecki#
>=20
> You see, /dev/hda7 isn't mounted:-(  The problem is "/dev/evms/hda7"?
> How to resolve it?  I append the output of "pvremove -vvvv /dev/hda7".
> Any suggestions?
>=20
>=20
> >=20
> > And you really should upgrade lvm2 - that's a 2-year old version with n=
umerous
> > known bugs in it.
> The version I use is the version supplied by my Ubuntu distribution 6.06
> (which is still supported).  I don't like to mix different versions as
> long as I'm not forced by a bug to do so.
>=20
>     Thanks for your help
>=20
>          Ecki
>=20
> >=20
> > Alasdair
--=20
  Eckhard Kosin
  Kaspar-Kerll-Str. 41
D-81245 M=C3=BCnchen, Germany
  Tel.: (+49)(+89) 88 88 479
  Tel., Fax: (+49)(+89) 835 844
  mailto:Eckhard.Kosin@online.de
