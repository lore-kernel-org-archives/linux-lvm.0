Return-Path: <pwk.linuxfan@gmx.de>
From: Peter Kirk <pwk.linuxfan@gmx.de>
Subject: Re: [linux-lvm] Switching one of my disks to hdc from hdb
Date: Wed, 6 Jun 2001 23:46:59 +0200
References: <01060621061602.01075@notch> <20010606232620.B6704@dragon.blacknet.de>
In-Reply-To: <20010606232620.B6704@dragon.blacknet.de>
MIME-Version: 1.0
Message-Id: <01060623465900.02898@notch>
Content-Transfer-Encoding: 8bit
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
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Am Mittwoch,  6. Juni 2001 23:26 schrieben Sie:
> On Wed, Jun 06 '01 at 21:06, Peter Kirk wrote:
> > since some of you told me my Setup with two stripped disks on hda and hdb
> > was broken, I would like to put my second disk (/dev/hdb) on the second
> > Controler (/dev/hdc) instead of my DVD Drive. Now my question is: What do
> > I have to change, in order not to distroy my linux installation in the
> > process ??
>
> Well, as I don't know your current configuration to well, it's just
> pocking in the dark ...
Here it comes:
I have two disks, currently on hda and hdb.
hda:
10MB of /boot
1GB for SWAP
the lot (18GB) in LV with hdb

hdb:
19GB in LV with hda


The LV with 18GB+18GB has
{
	/
	/usr
	/home
	all of these are stripped, so they are like raid0 (or should be)
	/home/stuff is not stripped, because it is on hdb where hda has boot and swap
}
pwk@notch:~/transcendent/mki/unstable > cat /proc/lvm/global
LVM driver version 0.9.1_beta2 (18/01/2001)
 
Total:  1 VG  2 PVs  4 LVs (4 LVs open 4 times)
 
Global: 157993 bytes malloced   IOP version: 10   9:21:48 active
 
VG:  raid  [2 PV, 4 LV/4 open]  PE Size: 4096 KB
  Usage [KB/PE]: 38973440 /9515 total  38973440 /9515 used  0 /0 free
  PVs: [AA] hda3                  18964480 /4630    18964480 /4630           
0 /0
       [AA] hdb                   20008960 /4885    20008960 /4885           
0 /0
    LVs: [AWDS2 ] user                      26214400 /6400     1x open
         [AWDS2 ] home                       6291456 /1536     1x open
         [AWDS2 ] root                       5382144 /1314     1x open
         [AWDL  ] stuff                      1085440 /265      1x open

On hdc and hdd I currently have my DVD Drive, and my CD burner.

PS: Please try and keep your answer simple, as I am not very well skilled 
concerning LVM, allthough I am confident about my general Linux skills.

>
> If your drives are PVs in one VG, that's not the root system, all you
> need to do is:
> - do a clean shutdown
> - change drives
> - boot again
> - run vgscan (should find your PVs and pack them into one VG)  (*)
> - run vgchange -a y (should activate your VG)                  (*)
> - mount all LVs in the VG
>
> For me the two steps marked with (*) are done in a initrd and the system
> would even support changing the root's LV, as long as the /boot stays
> untouched.
>
> My setup is like this:
>
> /dev/hda1: 64MB /boot
> /dev/hda2: rest MD0 disk1 (raid 1)
>
> /dev/hdc1: 64MB unused
> /dev/hdc2: rest MD0 disk2 (raid 1)
>
> /dev/hde1: PV1
> /dev/hdg1: PV2
>
> /dev/hdi1: PV3
> /dev/hdk1: PV4
>
> /dev/md0: PV0
>
> VG0: PV0
> VG1: PV1 PV2
> VG2: PV3 PV4
>
> hda and hdc are 40GB IBM drives, hd[e-h] were 60GB Maxtor drives.
>
> I'm running a full system out of different LV in VG0 (even root is a LV,
> only /boot is extra, with inird)
>
> Lately I get a 3ware Escalade controller and moved hd[e-h] there. All I
> had to do was:
> - change initrd to load the 3ware driver (run lilo to install new
>   initrd)
> - shutdown, install card, move drives, (remove additional IDE
>   controllers), reboot
> - initrd detected all PVs and constructed all my VGs, system still ran
>   fine (you might to have to copy the newly detected configuration from
>   /initrd/etc/lvm to /etc/lvm after boot)
>
> (Actually I did it a little different: shutdown, install 6 new 80GB
> drives, make a RAID5 with this drives, shutdown, add two drives out of
> VG1, boot (VGs detected on sd[gh]), make PV5 out of RAID5 array, make
> VG3 with just this PV5, copy all the data from VG1's LV to LVs on VG3,
> shutdown, remove drives, add drives from VG2, do the same as with VG1,
> shutdown, remove drives, boot, migration done, system works, all fine.)
>
>     Goetz.

----------------------------------------
Content-Type: application/pgp-signature; charset="us-ascii"; name="Anhang: 1"
Content-Transfer-Encoding: 7bit
Content-Description: 
----------------------------------------
