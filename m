Message-ID: <3FE7483D.90107@hasw.net>
From: Sebastian Witt <se.witt@gmx.net>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Endless loop running vgscan
References: <3FE4DE2E.2030705@hasw.net> <20031221233848.M21022@uk.sistina.com>
In-Reply-To: <20031221233848.M21022@uk.sistina.com>
Content-Type: multipart/mixed;
 boundary="------------020807040904010804010102"
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
Date: Mon Dec 29 07:51:28 2003
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

This is a multi-part message in MIME format.
--------------020807040904010804010102
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

Alasdair G Kergon wrote:
> On Sun, Dec 21, 2003 at 12:41:34AM +0100, Sebastian Witt wrote:
> 
>>Ignoring duplicate PV  on /dev/hdg1
>>Found /dev/hdf1 in VG raid_vg
>>Ignoring duplicate PV  on /dev/hdf1
>>Found /dev/hdh1 in VG raid_vg
> 
> 
> Set up a filter in lvm.conf so that LVM2 only sees the RAID devices
> and ignores the constituent devices that make up the RAID devices.
> 
> The LVM2 logic isn't clever enough yet always to work out the correct
> device to use.  This will get fixed.

Sorry, RAID is a little bit wrong in my case. The harddiscs running on
a Promise RAID-Controller but the RAID-function is disabled and it's 
used as a normal IDE controller.
I appended my configuration.

I've also this problem if I use this filter:
filter = [ "a/hd[e-h]1$/", "r/.*/" ]

Regards,
Sebastian

--------------020807040904010804010102
Content-Type: text/plain;
 name="LVM-VGs-server3"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="LVM-VGs-server3"

--- Volume group ---
VG Name               raid_vg
VG Access             read/write
VG Status             available/resizable
VG #                  0
MAX LV                256
Cur LV                2
Open LV               2
MAX LV Size           255.99 GB
Max PV                256
Cur PV                4
Act PV                4
VG Size               38.15 GB
PE Size               4 MB
Total PE              9766
Alloc PE / Size       9760 / 38.12 GB
Free  PE / Size       6 / 24 MB
VG UUID               none

--- Logical volume ---
LV Name                /dev/raid_vg/ftp_lv
VG Name                raid_vg
LV Write Access        read/write
LV Status              available
LV #                   1
# open                 1
LV Size                25 GB
Current LE             6400
Allocated LE           6400
Stripes                4
Stripe size (KByte)    64
Allocation             next free
Read ahead sectors     1024
Block device           58:0

--- Logical volume ---
LV Name                /dev/raid_vg/raid_lv
VG Name                raid_vg
LV Write Access        read/write
LV Status              available
LV #                   2
# open                 1
LV Size                13.12 GB
Current LE             3360
Allocated LE           3360
Stripes                4
Stripe size (KByte)    64
Allocation             next free
Read ahead sectors     1024
Block device           58:1


--- Physical volumes ---
PV Name (#)           /dev/hde1 (1)
PV Status             available / allocatable
Total PE / Free PE    2440 / 0

PV Name (#)           /dev/hdf1 (2)
PV Status             available / allocatable
Total PE / Free PE    2442 / 2

PV Name (#)           /dev/hdg1 (3)
PV Status             available / allocatable
Total PE / Free PE    2442 / 2

PV Name (#)           /dev/hdh1 (4)
PV Status             available / allocatable
Total PE / Free PE    2442 / 2




--------------020807040904010804010102--
