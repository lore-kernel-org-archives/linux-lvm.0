From: Goetz Bock <bock@blacknet.de>
Subject: Re: [linux-lvm] Accessing VG in multiboot environment
Message-ID: <20030303115255.I13193@zealot.blacknet.de>
References: <200303031001.h23A127e010167@pcrz175.hrz.uni-marburg.de>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <200303031001.h23A127e010167@pcrz175.hrz.uni-marburg.de>; from gebhardt@HRZ.Uni-Marburg.DE on Mon, Mar 03, 2003 at 11:01:02AM +0100
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
Date: Mon Mar  3 04:53:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Mon, Mar 03 '03 at 11:01, Thomas Gebhardt wrote:
> I'd like to install several linux distributions on one disk
> in a multiboot environment, each of them accessing the data
> in a LVM 1.x volume group.
I did that with TSL1.5, TSL2.0 and RH8.0 on one box:

- partition harddrive:
    hda1: 256M  ext2 /boot
    hda2: 2G    ext2 /  # see below
    hda3: rest  LVM

- than I install TSL1.5 into hda2
- install the LVM tools
- pvcreate hda3
- vgcreate vg00 hda3
- lvcreate -n tsl15root -L 1G vg00
- move tsl1.5 into tsl15root
- fix initrd (I'v a special initrd that activates LVM/MD and comes with
  a busybox based rescue system)
- fix lilo
- shutdown, reboot new setup make sure it works

- install TSL2.0 into hda2
- install lvmtools
- vgscan
- vgchange -a y
- lvcreate -n tsl20root -L 1G vg00
- move tsl2.0 into tsl20root
- fix initrd
- fix lilo
- shutdown, reboot, test

- install TH80 into hda2
- install lvmtoold
- vgscan
- vgchange -a y
- lvcreate -n rh80root -L 1G vg00
- move rh80 into rh80root
- fix initrd
- fix lilo
- shutdown, reboot, test

quite simple. boot gets a little bit messy, but I like to have /boot on
a primary partition and not on LVM.
-- 
Goetz Bock       (c) 2003 as     blacknet.de - Munich - Germany   /"\
IT Consultant    GNU FDL 1.1    secure mobile Linux everNETting   \ /
                                                                   X
 ASCII Ribbon Campaign against HTML email & microsoft attachments / \
