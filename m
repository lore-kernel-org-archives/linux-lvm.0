Message-ID: <00a701c171f3$aece6cc0$0a298dc3@madjik>
From: =?iso-8859-1?Q?S=E9bastien_Riccio?= <bastian@web-services.com>
References: <3BF8E5DE.ABAEB618@LTUtech.com> <20011119125632.A12388@sistina.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] vgcfgrestore error !
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
Date: Tue Nov 20 12:40:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Hello !

I  got strang stuff going on with my lvm groups...

It crashed after a reboot and i also lost lvm files in /etc.

Now my group is unrecognized...

look at this : (the vg name is lithium)

the devices are /dev/hdf1 /dev/hdg1 /dev/hdh1 /dev/hdc1 /dev/hdb1

vgimport  -f lithium /dev/hdf1
vgimport -- ERROR "pv_read_all_pv_of_vg(): PV number" reading data of volume
group "l"

vgimport  -f lithium /dev/hdh1
vgimport -- ERROR: wrong number of physical volumes to import volume group
"lithium"

It seems that volume group name that vgimport reports for /dev/hdf1 is "l"
(as you can see with the vgimport utility outpout)
and the rests of the disks report it as "lithium", which is the correct
name.

Now if try to import the vg with all the devices, it says that /dev/hdf1 is
not in the same volume group than /dev/hdg1

But if i pvdisplay hdf1 and hdg1 :

--- Physical volume ---
PV Name               /dev/hdf1
VG Name               lithium
PV Size               38.18 GB / NOT usable 1.44 MB [LVM: 159.00 KB]
PV#                   1
PV Status             available
Allocatable           yes (but full)
Cur LV                1
PE Size (KByte)       4096
Total PE              9773
Free PE               0
Allocated PE          9773
PV UUID               RxtFHo-8a4T-2HgW-UaRb-ECvU-tZaG-ZfKDDN


PV Name               /dev/hdg1
VG Name               lithium
PV Size               38.30 GB / NOT usable 3.99 MB [LVM: 159.00 KB]
PV#                   2
PV Status             available
Allocatable           yes (but full)
Cur LV                1
PE Size (KByte)       4096
Total PE              9803
Free PE               0
Allocated PE          9803
PV UUID               15PNMd-VnLP-XbWe-2cyU-A0Ia-xCxI-COXaMG

How is it possible that group names match with pvdisplay, but vgimport tells
me hdf1 is in group "l" ?????

Can you help ?

Thanks !
