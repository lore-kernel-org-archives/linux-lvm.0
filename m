Message-ID: <3D62888B.1060203@birddog.com>
From: "Kirby C. Bohling" <kbohling@birddog.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] accidently formatted a physical volume...
References: <20020819192319.GB25631@grimlock> <284650000.1029786116@[192.168.200.4]> <1265620671.20020819224124@tnonline.net> <20020819205005.GA26781@grimlock> <3D6159EA.1070406@birddog.com> <20020820175543.GA8709@grimlock>
Content-Transfer-Encoding: 7bit
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
Date: Tue Aug 20 13:29:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com

	Okay, now I'm completely out of my league, and I'm making this up as I 
go.  The only way I'd now to salvage anything is to try and figure out 
the layout of the LVM and the physical extents, read them off into a big 
flat file and mount it loop on the loop back as extended two.

	Is there anyways to get pvscan to be incredibly verbose and list the 
starting offset, and ending offset on the physical disk for each 
physical extent?  Essentially, write fsck.lvm/debug_lvm the parameters 
would be the lv you want to salvage, and the target location you want to 
write it to.  The big trick will be identifying corrupt LVM metadata, 
and avoiding those blocks like the plauge.

	In the end, LVM is an abstraction for a block device.  So I'd create a 
file and connect a loopback that was the same size as the LV.  So pull a 
physical extent, figure out if it is associated with the lv you're 
recovering.  Take the lv extent offset it is, and seek the extent size * 
logical extent number and write it to the loopback device.  Throwing 
away the LVM metadata.  Now, you can take this big pile of bits to an 
ext2/3 guru, and ask them how to glean as much data as possible out of 
it.  If the LV was completely on one disk, it should just fsck and 
mount.  Assuming you didn't specify the sizes, and do a lot of resizing 
of the LV's that should be the case.  Possibly asking the ext2/3 guru 
what the holes should be filled in with, and put that there. I'd guess 
zero's.  This trick should work on both sets of disks, but it'll be 
easier to pull off with known good meta-data.

	It'd be a big pile of work, but if the data is worth it you might try it. 
  It's entirely possible this program exists and I'm unaware of it, but 
if it doesn't, somebody should take the time to write it for the current 
code.  I don't know LVM and the metadata, and I'm too busy to figure it 
out... Sorry.  Just think if you do it, you'll be famous...

	Thanks,
		Kirby





Adam McDaniel wrote:
> On Mon, Aug 19, 2002 at 03:49:46PM -0500, Kirby C. Bohling wrote:
> 
>>I'd imagine that doing a vgcfgrestore to the device, followed by 
>>mounting the filesystem without fsck'ing it will get you some data. 
> 
> 
> Unfortunatly, I don't have any data for vgcfgrestore to build upon.
> Here's the current status:
> 
> /dev/loop0 is pointing to /root/lvm/hde1
> /dev/loop1 is pointing to /root/lvm/hdf1
> (built via 'dd if=/dev/hd?1 of=/root/lvm/hd?1')
> 
> /dev/loop0 is the good image
> /dev/loop1 is the fubar'd one.
> 
> pvdisplay /dev/loop0:
> 
> ---
> PV Name               /dev/loop0
> VG Name               data
> PV Size               14.31 GB [30009357 secs] / NOT usable 1.01 MB [LVM: 135 KB]
> PV#                   2
> PV Status             available
> Allocatable           yes (but full)
> Cur LV                1
> PE Size (KByte)       4096
> Total PE              3663
> Free PE               0
> Allocated PE          3663
> PV UUID               3IRYim-Lpgb-2N1Y-6TPu-C8mZ-58hy-exlmBm
> ---
> 
> pvdisplay /dev/loop1:
> 
> ---
> PV Name               /dev/loop1
> VG Name               data
> PV Size               9.44 GB [19792017 secs] / NOT usable 4.07 MB [LVM: 130 KB]
> PV#                   1
> PV Status             available
> Allocatable           yes (but full)
> Cur LV                1
> PE Size (KByte)       4096
> Total PE              2415
> Free PE               0
> Allocated PE          2415
> PV UUID               P7xAxa-J36q-2C8i-2vKc-5KJO-2tQ6-H3eGiz
> ---
> 
> First I tried running pvscan:
> 
> ---
> pvscan -- reading all physical volumes (this may take a while...)
> pvscan -- inactive PV "/dev/loop0"  is associated to unknown VG "data" (run vgscan)
> pvscan -- inactive PV "/dev/loop1"  is associated to unknown VG "data" (run vgscan)
> pvscan -- total: 2 [23.75 GB] / in use: 2 [23.75 GB] / in no VG: 0 [0]
> ---
> 
> fair enough.. so I run vgscan -v:
> 
> ---
> vgscan -- removing "/etc/lvmtab" and "/etc/lvmtab.d"
> vgscan -- creating empty "/etc/lvmtab" and "/etc/lvmtab.d"
> vgscan -- reading all physical volumes (this may take a while...)
> vgscan -- scanning for all active volume group(s) first
> vgscan -- reading data of volume group "data" from physical volume(s)
> vgscan -- ERROR "vg_read_with_pv_and_lv(): current PV" can't get data of volume group "data" from physical volume(s)
> vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d" successfully created
> vgscan -- WARNING: This program does not do a VGDA backup of your volume group
> ---
> 
> ofcourse /etc/lvmtab and /etc/lvmtab.d/* are all blank/empty.
> 
> If anything, I'm just about at the point where the dead drive is a
> writeoff (/dev/loop1).. but I would like to try to salvage the data on
> /dev/loop0
> 
> Any ideas?
> 
> Thanks.
> 
