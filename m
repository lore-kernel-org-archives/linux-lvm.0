Message-ID: <3BFD5397.4080005@ednet.ns.ca>
From: Patrick Boutilier <boutilpj@ednet.ns.ca>
MIME-Version: 1.0
Subject: Re: [linux-lvm] resize reiserfs
References: <20011122203009.A557@sky.net>
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
Date: Thu Nov 22 13:34:01 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: linux-lvm@sistina.com

Why not just use the resize_reiserfs program from the reiserfsprogs=20
package available from=20
ftp://ftp.namesys.com/pub/reiserfsprogs/reiserfsprogs-3.x.0j.tar.gz   ?

Snip from manpage:


NAME
       resize_reiserfs - Reiserfs filesystem resizer

SYNOPSIS
       resize_reiserfs [ -s [+|-]size[K|M|G] ] [ -fqv ] device

DESCRIPTION
       The resize_reiserfs tool resizes an unmounted reiserfs file=20
system.  It enlarges or shrinks an reiserfs file system located on a=20
device so that it will have size bytes or size=3Dold_size +(-) size
       bytes if the + or - prefix is used.  If the -s option is not=20
specified, the filesystem will be resized to fill the given device.  The=20
size parameter may have one of the optional modifiers K,  M,
       G, which means the size parameter is given in kilo-, mega-,=20
gigabytes respectively.

       The  resize_reiserfs  program  does  not manipulate the size of=20
the device. If you wish to enlarge a filesystem, you must make sure you=20
expand the underlying device first. This can be done using
       cfdisk(8) for partitions, by deleting the partition and=20
recreating it with a larger size (assuming there is free space after the=20
partition in question).  Make sure you re-create it with the same
       starting disk cylinder as before!  Otherwise, the resize=20
operation will certainly not work, and you may lose your entire filesystem.

       The resize_reiserfs program allows to grow a reiserfs on-line if=20
there is a free space on block device.

       If  you  wish  to  shrink an reiserfs partition, first use=20
resize_reiserfs to shrink the file system. You may then use cfdisk(8) to=20
shrink the device. When shrinking the size of the device, make
       sure you do not make it smaller than the reduced size of the=20
reiserfs filesystem.



Ulrich Wiederhold wrote:

>Hi,
>I need to resize my lv /dev/store/data now.
>
>I already added the 2nd HD (/dev/hdc1) to the vg store using vgextend
>and extended the lv using lvextend.
>
>Now I need to extend the reiserfs I got on this lv. I seached the web
>and found the resize_reiserfs perl-script, but if I try it, I only get
>this msg:
>$#: ./resize_reiserfs --size +50G --lv /dev/store/data --dry-run          =

>
>  only 0 free PE's (0 K) left on VG store
>
>Sure, I already added the PE=EF=BF=BDs to the lv.
>What to do?
>
>Uli
>
