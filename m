From: Heinz Mauelshagen <mauelsha@ez-darmstadt.telekom.de>
Message-Id: <200001291819.TAA03328@u9etz.ez-darmstadt.telekom.de>
Subject: Re: [linux-lvm] Question about order of drives in a lvm volume
In-Reply-To: <D1EC4320087FD311895100902773F43C393A3F@gsus.wineasy.se> from =?ISO-8859-1?Q?H=E5kan_Jettingstad?= at "Jan 29, 2000  3:34:49 pm"
Date: Sat, 29 Jan 2000 19:19:00 +0100 (MET)
Mime-Version: 1.0
Content-Transfer-Encoding: Quoted-Printable
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: =?ISO-8859-1?Q?H=E5kan?= Jettingstad <h.jettingstad@wineasy.se>
Cc: mge@ez-darmstadt.telekom.de, linux-lvm@msede.com


Hello H=E5kan,

please try "lvdisplay -v /dev/YourVG/YourLV | less" and have a look at the
information about distribution of the volume over the physical volumes.

Tell me if that answers your question.

BTW: if your RAID0 volume is spread over all the disks, you can't remove
     a disk because you can't remove a stripe without destroying the total
     volume.

Regards,
Heinz

> Hello,
>=20
> first I'd like to say a big thank you to Heinz for LVM, great work, keep =
it
> up!
>=20
> I have a hopefully simple question:
>=20
> I'm using quite a few ide-drives in a raid0 volume (hda -> hdh) and I cam=
e
> to think of that it would be good to know in which order I added the driv=
es
> to the volume in case I need to remove one from the volume, is there any =
way
> I can get the order in which the drives are placed in the raid0 volume? (=
in
> a list like hda, hdc, hdb, hdg, ... etc)
>=20
> Regards,
>=20
> H=E5kan
>=20


--=20

=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D=
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D=
-=3D-

Systemmanagement CS-TS                           T-Nova
                                                 Entwicklungszentrum Darmst=
adt
Heinz Mauelshagen                                Otto-Roehm-Strasse 71c
Senior Systems Engineer                          Postfach 10 05 41
                                                 64205 Darmstadt
mge@EZ-Darmstadt.Telekom.de                      Germany
                                                 +49 6151 886-425
                                                          FAX-386
=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D=
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D=
-=3D-
