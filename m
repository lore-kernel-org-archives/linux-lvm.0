Return-Path: <tmdg@uksr.hp.com>
From: Tom Dawes-Gamble <tmdg@uksr.hp.com>
Message-Id: <200102051211.MAA02014@hpwine73.uksr.hp.com>
Subject: Re: [linux-lvm] lv extend
Date: Mon, 05 Feb 2001 12:11:45 GMT
In-Reply-To: <3A7E9408.58179E5@qis-systemhaus.de>; from "Dirk Heinrichs" at Feb 5, 101 11:52 am
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
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: linux-lvm@sistina.com

Hi,

	This seems a Frequent problem we get it on HP-UX LVM too.
People do an lvextend and then wonder why the filesystem has not grown
to fill the lvol.

	Perhaps a message like.

[root@ocalhost /root]# lvextend -l 256 /dev/vg01/lvol2
lvextend -- extending logical volume "/dev/vg01/lvol2" to 1 GB
lvextend -- doing automatic backup of volume group "vg01"
lvextend -- logical volume "/dev/vg01/lvol2" successfully extended

Note:  You need to run a resize utility such as ext2resize before
	the space is available in the file system.

[root@localhost /root]#

Or lvextend could check the mount table and offer to run ext2resize
for you.  If that seems like a neat idea I would be willing to write
the code.

Regards,
Tom.

>=20
> James wrote:
> >=20
> > Hello
> >=20
> > Is it normal after growing an LV not to see the change with df -h ? But=
 it
> > can be seen with vgdisplay -v ?
> Did you also resize the filesystem? df shows filesystem sizes. If so,
> maybe a remount of the filesystem could help.
>=20
> Bye...
>=20
> 	Dirk
> --=20
> Dirk Heinrichs		| Tel:	+49 (0)241 413 260
> QIS Systemhaus GmbH	| Fax:	+49 (0)241 413 2640
> J=EF=BF=BDlicher Str. 338b	| Mail:	heinrichs@qis-systemhaus.de
> D-52070 Aachen		| Web:	http://www.qis-systemhaus.de
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
>=20


--
 int/* PROCEDURE DIVISION.*>*/b,g,l,n=3D'/'/'/'<<2;extern void printf();int=
 main
 (int d,char**z){char*o,*c=3D"%.9s%.7s%.7s\n";l=3D*(c+d+d)-*(c+d);g=3D*c-d-=
l;b=3Dl+n++;
   o=3D"  DISPLAY'tmdg@uksr'    '.hp.com' *>"+g++;printf(c,o-b++,o+l,o);l=
=3D~++n;
   o=3D"  DISPLAY'http://www.itrc.hp.com/' *>"+g++;printf(c,o-b++,o+l,o);ex=
it();}
