MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Message-ID: <16272.19483.577313.115811@gargle.gargle.HOWL>
From: "John Stoffel" <stoffel@lucent.com>
Subject: [linux-lvm] RAID 1 on Device Mapper - best practices?
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
Date: Fri Oct 17 15:10:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Hi All,

I've just recently upgrade my home system to a fresh install of Debian
3.0/Unstable, and moved my data to a pair of 120gb disks.  My goal is
to mirror the disks so I don't have to worry as much about device
failures losing all my data (files and MPs, and junk).  Of course I'll
be doing backups, but this is more the first step.

Anyway, what I'd like to do is setup the disks using Device Mapper so
that I can grow and shrink volumes at need, along with the filesystems
mounted on top of those volumes.  So I now have it working, except
that reboots don't detect the RAID volumes on top of the Device Mapper
LVs properly on reboot.  

But first some background:

    Kernel:		2.4.22 (or .21)
    Device Mapper:      2.4.22-dm-1
    lvdisplay --version
	LVM version:     2.00.06 (2003-08-20)
	Library version: 1.00.05-ioctl-cvs (2003-09-01)
	Driver version:  4.0.1

Nor do I think I'm really doing this in the proper way.  Currently I
have one volume group per disk, left_vg and right_vg.  Each has a pair
of LVs on then, [left,right]_lv_[home,local] for a total of four LVs.  

Then I assemble these into MD volumes using mdadm, with each volume
having an LV from each of the VGs.  

Do I really need to use MD here, or can I build a mirrored LV to do
what I want?

Thanks,
John
   John Stoffel - Senior Unix Systems Administrator - Lucent Technologies
	 stoffel@lucent.com - http://www.lucent.com - 978-952-7548
