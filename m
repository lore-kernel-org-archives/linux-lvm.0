Return-Path: <james@fr.clara.net>
Date: Mon, 5 Feb 2001 13:24:35 +0100 (CET)
From: James <james@fr.clara.net>
Subject: Re: [linux-lvm] lv extend
In-Reply-To: <200102051211.MAA02014@hpwine73.uksr.hp.com>
Message-ID: <Pine.LNX.4.21.0102051324040.517-100000@munster.noc.fr.clara.net>
MIME-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
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
Content-Type: TEXT/PLAIN; charset="iso-8859-1"
To: linux-lvm@sistina.com

That would be great :-)

On Mon, 5 Feb 2001, Tom Dawes-Gamble wrote:

> Hi,
>=20
> =09This seems a Frequent problem we get it on HP-UX LVM too.
> People do an lvextend and then wonder why the filesystem has not grown
> to fill the lvol.
>=20
> =09Perhaps a message like.
>=20
> [root@ocalhost /root]# lvextend -l 256 /dev/vg01/lvol2
> lvextend -- extending logical volume "/dev/vg01/lvol2" to 1 GB
> lvextend -- doing automatic backup of volume group "vg01"
> lvextend -- logical volume "/dev/vg01/lvol2" successfully extended
>=20
> Note:  You need to run a resize utility such as ext2resize before
> =09the space is available in the file system.
>=20
> [root@localhost /root]#
>=20
> Or lvextend could check the mount table and offer to run ext2resize
> for you.  If that seems like a neat idea I would be willing to write
> the code.
>=20
> Regards,
> Tom.
>=20
> >=20
> > James wrote:
> > >=20
> > > Hello
> > >=20
> > > Is it normal after growing an LV not to see the change with df -h ? B=
ut it
> > > can be seen with vgdisplay -v ?
> > Did you also resize the filesystem? df shows filesystem sizes. If so,
> > maybe a remount of the filesystem could help.
> >=20
> > Bye...
> >=20
> > =09Dirk
> > --=20
> > Dirk Heinrichs=09=09| Tel:=09+49 (0)241 413 260
> > QIS Systemhaus GmbH=09| Fax:=09+49 (0)241 413 2640
> > J=FClicher Str. 338b=09| Mail:=09heinrichs@qis-systemhaus.de
> > D-52070 Aachen=09=09| Web:=09http://www.qis-systemhaus.de
> > _______________________________________________
> > linux-lvm mailing list
> > linux-lvm@sistina.com
> > http://lists.sistina.com/mailman/listinfo/linux-lvm
> >=20
>=20
>=20
> --
>  int/* PROCEDURE DIVISION.*>*/b,g,l,n=3D'/'/'/'<<2;extern void printf();i=
nt main
>  (int d,char**z){char*o,*c=3D"%.9s%.7s%.7s\n";l=3D*(c+d+d)-*(c+d);g=3D*c-=
d-l;b=3Dl+n++;
>    o=3D"  DISPLAY'tmdg@uksr'    '.hp.com' *>"+g++;printf(c,o-b++,o+l,o);l=
=3D~++n;
>    o=3D"  DISPLAY'http://www.itrc.hp.com/' *>"+g++;printf(c,o-b++,o+l,o);=
exit();}
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
>=20
