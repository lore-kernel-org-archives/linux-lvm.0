Date: Tue, 4 Sep 2001 16:21:36 +0200 (MSZ)
From: Thorsten Sauter <sar@viastore.de>
Subject: Re: [linux-lvm] SoftRaid and LVM
In-Reply-To: <3B94DF46.5070306@st-peter.stw.uni-erlangen.de>
Message-ID: <Pine.A32.4.33.0109041609090.42612-100000@as1.viastore.de>
MIME-Version: 1.0
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Hi,

sorry for these short description :-)!

Currently I'm using kernel 2.4.9 with the raidtools-0.90.
The md0 device is a simple RAID1-Mirroring between hda1 and hda2.

If I create a simple vg over these two disks and one disk goes bad, all of
my datas are lost, isn't it? So I think it would be a nice idee to create
a simple, minimum safety, mirror array and active the lvm over this array.
From now on, I have the flexibilty from the lvm and the safety from the
raid!?

I've found some patches for older lvm version in the internet (google,
...) and a patch on this list from october last year. But all these
patches (?) are for very old lvm versions (0.8x) so I tink they don't work
on newer lvm-versions.

The problem, as described below, is that I can't create a volume group on
a md-device.

Are these infos enought? I hope so.

Between my to mails I've created a new "blank" md-device (no old datas, no
old fdisk probs). But the problem is the same.
The lvm-howto and the raid-howtos doens't provide any informations for
interacting raid with lvm. :-(

Thanks for your help!

Thorsten Sauter
viastore systems GmbH


--
Your mouse has moved.
Windows NT must be restarted for the change to take effect.
Reboot now?  [OK]

On Tue, 4 Sep 2001, svetljo wrote:

> Hi
> where did you find this patches
> and what do you wont to do
>
> what kind of software RAID do you wont to use
> can you give us a bit more information
>
>
>
>
>
>
> Thorsten Sauter wrote:
>
> >Hello LVM-Gurus,
> >
> >I would like to create a volume group based on an sofraid device
> >(/dev/md0). I know, there are many emails about this topic, but I think no
> >one has the solution for this. I have found some code-patches for older
> >versions of the lvm for fix this problem. But, what is the current state
> >in the new lvm-1.0.1-rc2 version.
> >
> >The following things I have made before:
> >$ mkraid --realy-force /dev/md0
> >$ mkreiserfs /dev/md0
> >$ mount /dev/md0 /mnt
> >-> so I think, the raid device is ok
> >
> >$ pvcreate /dev/md0
> >
> >>pvcreate -- device "/dev/md0" has a partition table
> >>
> >
> >$ fdisk -l /dev/md0
> >
> >>Disk /dev/md0: 2 heads, 4 sectors, 2441880 cylinders
> >>Units = cylinders of 8 * 512 bytes
> >>
> >>    Device Boot    Start       End    Blocks   Id  System
> >>
> >$ uname -a
> >
> >>Linux lxclust1 2.4.9 #6 Mon Jan 3 19:52:54 CET 2000 i686 unknown
> >>
> >$ dmesg | grep -i lvm
> >
> >>LVM version 0.9.1_beta2  by Heinz Mauelshagen  (18/01/2001)
> >>lvm -- Driver successfully initialized
> >>
> >
> >LVM-Version: 1.0.1-rc2      -> why is this an other version as reported
> >by kernel?
> >
> >Does anyone know, how can I initialize the /dev/md0 device for te the lvm?
> >
> >Thanks for your help,
> >
> >Thorsten Sauter
> >viastore systems GmbH
> >
> >
> >--
> >Your mouse has moved.
> >Windows NT must be restarted for the change to take effect.
> >Reboot now?  [OK]
> >
> >
> >_______________________________________________
> >linux-lvm mailing list
> >linux-lvm@sistina.com
> >http://lists.sistina.com/mailman/listinfo/linux-lvm
> >read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
> >
>
>
>
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
>
