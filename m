Return-Path: <dieter.woerz@debis.com>
Message-ID: <3A77EE78.131F24B5@debis.com>
Date: Wed, 31 Jan 2001 11:52:40 +0100
From: Dieter Woerz <dieter.woerz@debis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: [linux-lvm] Updating from Suse Linux 6.4 to Suse Linux 7.0 with LVM
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
To: suse-linux@suse.com, linux-lvm@sistina.com

Hello,

I am trying to update Suse Linux 6.4 to Suse Linux 7.0 Professional. I ha=
ve all
my file systems except /boot and / and swap under lvm.

When I try to use Suse's yast1, it doesn't recognize and mount my lvm bas=
ed file
systems. Suse writes on its support page, that the lvm version coming wit=
h the
7.0 does not recognize lvm partitions in an Win98 extended partition, whi=
ch is
the case with me and that I should install a newer version of lvm.

When I am trying to reimport the exported vg (vgimport vgxy /dev/hdaz) I =
always
get a read error -256 on that partition. Based on that I think that it is=
 still
using the old lvm library, even though I use the executables from the new
version of lvm.

Now my problem is, how do I make Linux Suse 7.0 on CD use that new lvm. W=
hen I
try to load liblvm.so e.g. by creating a ld.so.preload, I get an error ab=
out an
undefined symbols and I cannot do anything after that. I also get message=
s about
undefined symbols when I try to load the module lvm.o with insmod.

I am lost on how to mount my lvm partitions.=20

I do not want to install everyth8ing from scratch.

Thanks in advance

Dieter W=F6rz
--=20
Dieter W=F6rz                                        Tel: +49 711  17 497=
17
debis Systemhaus Industry                          Tel: +49 7031 90 81141
Engineering Data Management EDM/S                  Fax: +49 711  17 40331
Erich-Herion-Strasse 13                           =20
D 70736 Fellbach                                   Mail: Dieter.Woerz@deb=
is.com
