From: Brouard Nicolas <brouard@ined.fr>
In-Reply-To: <1064315989.6594.53.camel@homebrou>
References: <1064315989.6594.53.camel@homebrou>
Content-Type: multipart/alternative; boundary="=-rUDS+wjXtq/Foaye5WY8"
Message-Id: <1064330690.28267.110.camel@homebrou>
Mime-Version: 1.0
Subject: [linux-lvm] Re: [SuperRescue] LVM support on Mandrake CD 1
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
Date: Tue Sep 23 12:08:05 2003
List-Id: <linux-lvm.redhat.com>
To: superrescue@zytor.com
Cc: linux-lvm@sistina.com, vonhagen@vonhagen.org

--=-rUDS+wjXtq/Foaye5WY8
Content-Type: text/plain; charset="iso-8859-15"
Content-Transfer-Encoding: quoted-printable

Hi,
I have had problem with my root partition which is often (twice)
garbaged by e2fsck with dupplicated file names!
It may also affect the Logical Partitions (/usr, /var, /home, /tmp,
swap) if someone says Y for e2fsck. =20

So I wanted to have a backup of my root partition both as an additional
logical volume and as a backup (250 Mb) on a host from my network.

Doing the backup partition on a host with dd made me angry because I
spent time to mount root partition with NFS (see below) in order to
suppress the "access denied".

But the main purpose of my search was to have a rescue disk with LVM
loaded and ready to use. In a first step, I did not know how to do it
with Mandrake CD 1 (rescue disk) and moved to Superrescue which has been
described in Linux Planet as being able to do it
(http://www.linuxplanet.com/linuxplanet/reports/4294/9/, article from
Bill Von Hagen). But I did not found the lvm-mod modules neither the LVM
programs. So I wrote the enclosed mail to the Super-Rescue mailing list.

Meanwhile I looked at some archives of the LVM mailing list and tried
back to use the Mandrake CD 1.
This is the reason for I am sending this mail to the LVM mailing list
too. It is a very Newbie message but I spend a lot of time to get the
information.

Mandrake 9.1 allows you to directly setup a computer with LVM partitions
instead of separated fixed partitions (just do Advance when partitioning
or something like that) but the rescue mode is not documented in case of
a problem like I got.=20

Before entering Mandrake rescue details below, I also understood the
advantage of the multiuser mode with the SuperRescue disk (I was asking
the question). The advantage is that with this disk and a network, you
can have a complete KDE environment with google access for example, only
from the CD and without any mounted disk from your computer (So you can
boot Linux from a Windows XP PC or whatever PC OS if you are invited
somewhere without your laptop but only this CD!).

But back to the Mandrake 9.1 CD 1 (rescue). Here is how you can mount
your LVM partitions or restore them if you have had problem.

- Boot from CD 1 Mandrake
- Type F1
- at boot: type rescue
  loqdkeys fr # For french keyboard only
  modprobe lvm-mod # it is on the CD (I haven't found it on the
Superrescue disk).
 =20
- you must have access to vgscan and vgchange and their libraries. In my
case my root partition
  is still an ext3 native partition (/dev/hda3 for example) and is
working. So I only have to mount it.
  mkdir /mnt/root
  mount  -t ext3 /dev/hda3 /mnt/root

- then I can activate vgscan
  /mnt/root/sbin/vgscan
 and my Volume Group is recognized.
  /mnt/root/sbin/vgchange -ay
 and my Logical Volumes are recognized

Then I have to setup the network, mount the backup partition on a host
and restore (or backup) the partition.=20

Le mar 23/09/2003 =EF=BF=BD 13:19, Brouard Nicolas a =EF=BF=BDcrit :

> Hello,
>=20
> I have seen on Linux Planet that Superrescue manages LVM (Logical Volume
> Manager) partitions. Standard Mandrake 9.1 rescue mode does not seem to
> manage them. But I have some problems (I am a newbie) with the rescue
> disk.
>=20
> My purpose is to save (and restore) partitions and mainly LVM partitions
> through the network.
>=20
> PART A=20
>=20
> So I booted the rescue disk.
> I typed return to be in single mode.
>=20
>   loadkeys fr  # to get a French keyboard
>   mount # to verify that none of my disk were mounted!
>=20
> Then I setup the network with
>   ifconfig eth0 192.168.0.1 broadcast 192.168.0.255 netmask     =20
> 255.255.255.0
>   ping 192.168.0.2
>   mkdir /mnt/backup # To create a backup directory on RAM for mounting
>   mount -t nfs 192.168.0.2:/backup /mnt/backup=20
>=20
>   dd if=3D/dev/hda5 of=3D/mnt/backup/rootpartbackup bs=3D10M # to backup =
my
> root partition
>=20
> Ok, it worked. There are probably better solutions, but I haven't found
> them. In order to allow root nfs on the host server I spent sometime to
> get it work. It seems that the /etc/hosts.allow should
> include one of these lines (or group of lines for portmap)
> #mountd: LOCAL
> #ALL: 192.168.
> #portmap: 192.168.0.11
> #portmap: 192.168.0.0/255.255.255.0
>=20
> File /etc/exports should be very explictit with the IP.=20
> /backup  192.168.0.0/255.255.255.0(rw,no_root_squash,insecure,sync)
>=20
> Then exportfs -rv should be enough
> To unmount the backup either it can be suppressed from the exports file
> or
>   exportfs -u localhost:/backup
> otherwise it can be umounted.
>=20
> PART B
>=20
> Now I want to backup my LVM partitions
> but modprobe lvm-mod does not work
> and vgscan and vgchange -a y (which are the commands that I found in
> /etc/rc.d/rc.sysinit) do not work too.
>=20
> So I did a CTRL_D to get into multisuer mode.=20
> Then I discovered that I could do an "ifup" to get the network.
>=20
> But here I am stuck because I cant find any LVM module or programs.
> What is the advantage of the multisuer mode? To get X or something like
> that. Sorry but I haven't found a Superrescue Basic Howto.
>=20
> Thanks a lot for any comment.
>=20
> Nicolas Brouard
> brouard@ined.fr
> Paris
>=20
>=20
> _______________________________________________
> SuperRescue mailing list
> SuperRescue@zytor.com
> http://www.zytor.com/mailman/listinfo/superrescue
> Please do not send private replies to mailing list traffic.

--=-rUDS+wjXtq/Foaye5WY8
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 TRANSITIONAL//EN">
<HTML>
<HEAD>
  <META HTTP-EQUIV="Content-Type" CONTENT="text/html; CHARSET=UTF-8">
  <META NAME="GENERATOR" CONTENT="GtkHTML/1.1.10">
</HEAD>
<BODY>
Hi,<BR>
I have had problem with my root partition which is often (twice) garbaged by e2fsck with dupplicated file names!<BR>
It may also affect the Logical Partitions (/usr, /var, /home, /tmp, swap) if someone says Y for e2fsck.&nbsp; <BR>
<BR>
So I wanted to have a backup of my root partition both as an additional logical volume and as a backup (250 Mb) on a host from my network.<BR>
<BR>
Doing the backup partition on a host with dd made me angry because I spent time to mount root partition with NFS (see below) in order to suppress the &quot;access denied&quot;.<BR>
<BR>
But the main purpose of my search was to have a rescue disk with LVM loaded and ready to use. In a first step, I did not know how to do it with Mandrake CD 1 (rescue disk) and moved to Superrescue which has been described in Linux Planet as being able to do it (http://www.linuxplanet.com/linuxplanet/reports/4294/9/, article from Bill Von Hagen). But I did not found the lvm-mod modules neither the LVM programs. So I wrote the enclosed mail to the Super-Rescue mailing list.<BR>
<BR>
Meanwhile I looked at some archives of the LVM mailing list and tried back to use the Mandrake CD 1.<BR>
This is the reason for I am sending this mail to the LVM mailing list too. It is a very Newbie message but I spend a lot of time to get the information.<BR>
<BR>
Mandrake 9.1 allows you to directly setup a computer with LVM partitions instead of separated fixed partitions (just do Advance when partitioning or something like that) but the rescue mode is not documented in case of a problem like I got. <BR>
<BR>
Before entering Mandrake rescue details below, I also understood the advantage of the multiuser mode with the SuperRescue disk (I was asking the question). The advantage is that with this disk and a network, you can have a complete KDE environment with google access for example, only from the CD and without any mounted disk from your computer (So you can boot Linux from a Windows XP PC or whatever PC OS if you are invited somewhere without your laptop but only this CD!).<BR>
<BR>
But back to the Mandrake 9.1 CD 1 (rescue). Here is how you can mount your LVM partitions or restore them if you have had problem.<BR>
<BR>
- Boot from CD 1 Mandrake<BR>
- Type F1<BR>
- at boot: type rescue<BR>
&nbsp; loqdkeys fr # For french keyboard only<BR>
&nbsp; modprobe lvm-mod # it is on the CD (I haven't found it on the Superrescue disk).<BR>
&nbsp; <BR>
- you must have access to vgscan and vgchange and their libraries. In my case my root partition<BR>
&nbsp; is still an ext3 native partition (/dev/hda3 for example) and is working. So I only have to mount it.<BR>
&nbsp; mkdir /mnt/root<BR>
&nbsp; mount&nbsp; -t ext3 /dev/hda3 /mnt/root<BR>
<BR>
- then I can activate vgscan<BR>
&nbsp; /mnt/root/sbin/vgscan<BR>
 and my Volume Group is recognized.<BR>
&nbsp; /mnt/root/sbin/vgchange -ay<BR>
 and my Logical Volumes are recognized<BR>
<BR>
Then I have to setup the network, mount the backup partition on a host and restore (or backup) the partition. <BR>
<BR>
Le mar 23/09/2003 &#224; 13:19, Brouard Nicolas a &#233;crit :
<BLOCKQUOTE TYPE=CITE>
<PRE><FONT COLOR="#737373" SIZE="3"><I>Hello,

I have seen on Linux Planet that Superrescue manages LVM (Logical Volume
Manager) partitions. Standard Mandrake 9.1 rescue mode does not seem to
manage them. But I have some problems (I am a newbie) with the rescue
disk.

My purpose is to save (and restore) partitions and mainly LVM partitions
through the network.

PART A 

So I booted the rescue disk.
I typed return to be in single mode.

  loadkeys fr  # to get a French keyboard
  mount # to verify that none of my disk were mounted!

Then I setup the network with
  ifconfig eth0 192.168.0.1 broadcast 192.168.0.255 netmask      
255.255.255.0
  ping 192.168.0.2
  mkdir /mnt/backup # To create a backup directory on RAM for mounting
  mount -t nfs 192.168.0.2:/backup /mnt/backup 

  dd if=/dev/hda5 of=/mnt/backup/rootpartbackup bs=10M # to backup my
root partition

Ok, it worked. There are probably better solutions, but I haven't found
them. In order to allow root nfs on the host server I spent sometime to
get it work. It seems that the /etc/hosts.allow should
include one of these lines (or group of lines for portmap)
#mountd: LOCAL
#ALL: 192.168.
#portmap: 192.168.0.11
#portmap: 192.168.0.0/255.255.255.0

File /etc/exports should be very explictit with the IP. 
/backup  192.168.0.0/255.255.255.0(rw,no_root_squash,insecure,sync)

Then exportfs -rv should be enough
To unmount the backup either it can be suppressed from the exports file
or
  exportfs -u localhost:/backup
otherwise it can be umounted.

PART B

Now I want to backup my LVM partitions
but modprobe lvm-mod does not work
and vgscan and vgchange -a y (which are the commands that I found in
/etc/rc.d/rc.sysinit) do not work too.

So I did a CTRL_D to get into multisuer mode. 
Then I discovered that I could do an &quot;ifup&quot; to get the network.

But here I am stuck because I cant find any LVM module or programs.
What is the advantage of the multisuer mode? To get X or something like
that. Sorry but I haven't found a Superrescue Basic Howto.

Thanks a lot for any comment.

Nicolas Brouard
brouard@ined.fr
Paris


_______________________________________________
SuperRescue mailing list
SuperRescue@zytor.com</FONT>
<A HREF="http://www.zytor.com/mailman/listinfo/superrescue"><FONT SIZE="3">http://www.zytor.com/mailman/listinfo/superrescue</FONT></A>
<FONT COLOR="#737373" SIZE="3">Please do not send private replies to mailing list traffic.</I></FONT></PRE>
</BLOCKQUOTE>
</BODY>
</HTML>

--=-rUDS+wjXtq/Foaye5WY8--
