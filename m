Return-Path: <jdomingo@crosswinds.net>
Date: Thu, 28 Jun 2001 20:13:46 +0000
From: =?iso-8859-1?Q?Jos=E9_Luis_Domingo_L=F3pez?= <jdomingo@internautas.org>
Subject: Re: [linux-lvm] HowTo: EIDE/ATA-100 + RAID 1 + LVM
Message-ID: <20010628201346.A1066@dardhal.mired.net>
Mime-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <03b201c0fff4$aa4007c0$01e6a8c0@oulx>
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
Content-Type: text/plain; charset="utf-8"
To: linux-lvm@sistina.com

On Thursday, 28 June 2001, at 18:06:25 +0100,
Emmanuel Blot wrote:

> Hi,
> 
> I don't know much about RAID and LVM.
> 
> I have to set up a server, and I'd like to know if it's possible -and reliable- to setup a server
> with RAID 1 (mirrored disk) with a pure software solution (not RAID controller) and LVM
> 
> * disks: two 40 GB IBM 60GXP (ATA-100).
> * motherboard: Asus with AMD760 + DDR (Athlon Thunderbird)
> * distribution: SuSE 7.2, with Linux kernel 2.4.4
> 
> - Are there some known issues/bugs with this configuration ?
> - Where can I start (documentation URL I should know, ...)
> - What is the installation order to follow (between software installation, RAID setup, LVM setup, ...)
> - Any other suggestion
> 
> As the server has to be mostly remote-administrated (from other countries...), reliability is a key.
> Is LVM stable enough with RAID-1 and Linux 2.4.x ?
> 
Lately I've been experimenting with layering Linux's softare RAID
implementation with LVM, both LVM on top of RAID and RAID on top of LVM
(the former seems to be more reasonable).

My test hardware is plain _shit_ (P75 with 16 MB RAM and two 6-year old
IDE disks, 400 MB and 800 MB), but was enough to test the aforementioned
configurations. I had no problems at all, and everything seemed to run OK.

However, layering LVM/RAID (or RAID/LVM) can mean a much greater overhead
on IO. My tests _seem_ to show noticeable slowdonws on raw throughput (both
dd and bonnie) and array reconstruction speeds. But a decent hardware
could show a much better behaviour than what I saw.

On the other hand, you must be very careful with designing the setup,
specially with RAID on top of LVM. If you are building a 2-"disk" RAID-1, 
and extents for both "disks" are taken from the same physical hard drive,
your mirror is quite unuseful in case a disk dies.

Another parameter to take into consideration is the filesystem you will be
using, the parameters used to create it, the usage pattern for this
filesystem, AND interaction with the unbderlying "block device". For
example, an ext2 filesystem with 4 KB blocks on top of a stripped LV built
from a 2-disk RAID-0 underlaying device with 32 KB stripe maybe is not
optimal in terms of troughput and/or IO latency.

To get all this working, download a "stable" kernel (2.4.4 gave me no
ptoblems), download LVM patches (version 0.9.1-beta7) and recompile. You
must enable LVM and RAID when using your favourite "make *config".
Although both can be compiled as modules, is not advisable to do so on a
production machine (I've experienced problems with RAID devices not
autostarting upon reboot, manual intervention required). Don't forget to
build LVM tools from the tarball you should have downloaded previously.
Download raidtools2 (version 0.9x) for your distribution.

RAID building and usage is quite well documented on several HOWTO, from
www.linuxdoc.org (mainly Software-RAID-HOWTO).

With respect to LVM, there is the LVM-HOWTO. Not very thorough, but
enough to make it work quickly.

Just one tip to ease your task: LVM on top of RAID is just a matter of
create the RAID device and then making a VG using /dev/md0 as the Physical
Device. Once you have a VG available, create LV (similar to partitions)
and create filesystems on them as usual.

PS: I'm currently trying to finish a HOWTO-like document about Linux's
software RAID usage, with some information about LVM and their mutual
relationships and combined usage and applications. The master document is
being written in Spanish, but as soon as I finish it, I've the intention
to translate it to English. The Spanish version should be ready during
July, and the English one maybe during August or September. Stay tuned :)

-- 
Jos� Luis Domingo L�pez
Linux Registered User #189436     Debian GNU/Linux Potato (P166 64 MB RAM)
 
jdomingo EN internautas PUNTO org  => � Spam ? Atente a las consecuencias
jdomingo AT internautas DOT   org  => Spam at your own risk
