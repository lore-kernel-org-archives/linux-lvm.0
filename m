Subject: Re: [linux-lvm] hard drive crash info please
From: Randy Perkins <randyperkins@randyperkins.com>
In-Reply-To: <3EBAA220.9070404@stella.at>
References: <1052416232.17357.32.camel@randy.randyperkins.com>
	 <3EBAA220.9070404@stella.at>
Message-Id: <1052502321.11801.10.camel@randy.randyperkins.com>
Mime-Version: 1.0
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
Date: Fri May  9 12:45:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

On Thu, 2003-05-08 at 13:29, Kai Iskratsch wrote:
> hi
> 
> if you have a backup 
> of your vgcfg  then you may restore your config to a new harddisk with 
> the lvm1 tools.

hello,
	I have made some progress on attempting to get some
of my data back out of LVM after a hard drive failure.

all responses are appreciated

I am using lvm-1.0.3 setup with 5 PV, 1 VG, and 1 LV. 

1.	I have a successful vgcfg backup as reported by vgcfgrestore.

2.	pvscan successfully reports my remaining 4 PV.

3.	The defective drive was /dev/hdk.  I have replaced the defective
	drive with a replacement of the same model and size (WD 40GB)

4.	I have ran 'pvcreate /dev/hdk'

5.	By runningy pvdisplay /dev/hd[begik] , I remembered that the 	path of
the physical volumes has changed between the backup and 	restore time. 
I was so impressed with lvm when this was taken 	care of automatically
when they originally changed.

	so my defective disk is /dev/hdk but in the file
	/etc/lvmconf/my_vg.conf it is /dev/hdg.  I was able to deduce 	this
from the UUID listed in vgcfgrestore and compare it to the UUID 	listed
in pvdisplay /dev/hd[begik].

6.	I plan to use the -o option of vgcfgrestore to place the config 	data
from /dev/hdg on /dev/hdk.

questions

When i run the command 'vgcfgrestore -n my_vg -o /dev/hdg /dev/hdk' i
get the following message:

[root@fileserver root]# vgcfgrestore -n my_vg -o /dev/hdg /dev/hdk
vgcfgrestore -- INFO: using backup file "/etc/lvmconf/my_vg.conf"
vgcfgrestore -- "/dev/hdk" may not be an actual physical volume of
volume group "my_vg"

I dont know why this didnt work.

i have succussfully restored onto /dev/hdg with 'vgcfgrestore -i -n
my_vg /dev/hdk',but that was the wrong disk info. i have since ran
'pvcreate -ff /dev/hdk' to clear the info.

I just cant seem to get the -o option to work.
I could always shut down the machine and reposition the disks according
to the backup.
how should i procede ?

After i get the vg restored where do i go then ??
if i was to guesss---
vgchange -a y
fsck /dev/my_vg/log_vol # do i really want to do this? ,which options?
mount /dev/my_vg/log_vol /mnt/mypoint

how will it handle files that are missing ?

how will it handle files that are corrupt ?

will the file names be intact ?

I am assuming that since my PE size is 8MB, that any file
under 8MB will either be there and complete, or completely missing.
I am not really concerned with extracting any files over 8MB anyway.

thanks for reading this and any help is appreciated

thanks again

randy perkins



outputs of above referenced commands follow

--- output of 'vgcfgrestore -ll -n my_vg -t'--------- 

vgcfgrestore -- INFO: using backup file "/etc/lvmconf/my_vg.conf"
vgcfgrestore -- backup of volume group "my_vg"  is consistent
--- Volume group ---
VG Name               my_vg
VG Access             read/write
VG Status             NOT available/resizable
VG #                  0
MAX LV                256
Cur LV                1
Open LV               0
MAX LV Size           511.98 GB
Max PV                256
Cur PV                5
Act PV                5
VG Size               260.80 GB
PE Size               8 MB
Total PE              33383
Alloc PE / Size       33383 / 260.80 GB
Free  PE / Size       0 / 0
VG UUID               bEvsph-VuUD-ETOW-ntYw-I90F-5JDB-CIU4mh

--- Logical volume ---
LV Name                /dev/my_vg/log_vol
VG Name                my_vg
LV Write Access        read/write
LV Status              NOT available
LV #                   1
# open                 0
LV Size                260.80 GB
Current LE             33383
Allocated LE           33383
Allocation             next free
Read ahead sectors     10000
Block device           58:0


--- Physical volume ---
PV Name               /dev/hdb
VG Name               my_vg
PV Size               37.27 GB [78165360 secs] / NOT usable 8.19 MB
[LVM: 146 KB]
PV#                   1
PV Status             NOT available
Allocatable           yes (but full)
Cur LV                1
PE Size (KByte)       8192
Total PE              4769
Free PE               0
Allocated PE          4769
PV UUID               VzIeJK-1RXR-CY1X-HL7z-tA0S-Jleb-I29HHV

--- Physical volume ---
PV Name               /dev/hde
VG Name               my_vg
PV Size               37.27 GB [78165360 secs] / NOT usable 8.19 MB
[LVM: 146 KB]
PV#                   2
PV Status             NOT available
Allocatable           yes (but full)
Cur LV                1
PE Size (KByte)       8192
Total PE              4769
Free PE               0
Allocated PE          4769
PV UUID               3v1hNv-VnYq-hFhX-bBKI-6gbx-21f2-jYbgs7

--- Physical volume ---
PV Name               /dev/hdg
VG Name               my_vg
PV Size               37.27 GB [78165360 secs] / NOT usable 8.19 MB
[LVM: 146 KB]
PV#                   3
PV Status             NOT available
Allocatable           yes (but full)
Cur LV                1
PE Size (KByte)       8192
Total PE              4769
Free PE               0
Allocated PE          4769
PV UUID               pb1svL-UdjB-cvOP-xREw-udxz-z4Px-AnaXVX

--- Physical volume ---
PV Name               /dev/hdi
VG Name               my_vg
PV Size               74.53 GB [156301488 secs] / NOT usable 8.19 MB
[LVM: 165 KB]
PV#                   4
PV Status             NOT available
Allocatable           yes (but full)
Cur LV                1
PE Size (KByte)       8192
Total PE              9538
Free PE               0
Allocated PE          9538
PV UUID               HOAlS3-7Bck-JzVD-Ds4j-FpEG-lC6L-Gu8peg

--- Physical volume ---
PV Name               /dev/hdk
VG Name               my_vg
PV Size               74.53 GB [156301488 secs] / NOT usable 8.19 MB
[LVM: 165 KB]
PV#                   5
PV Status             NOT available
Allocatable           yes (but full)
Cur LV                1
PE Size (KByte)       8192
Total PE              9538
Free PE               0
Allocated PE          9538
PV UUID               Mu4FuR-qpqZ-glBu-QB6h-mW3s-7tVf-3iq1s3

--------------------------- end of output -----------------------------

------output of 'pvscan' -----------------------------

pvscan -- reading all physical volumes (this may take a while...)
pvscan -- inactive PV "/dev/hdi"  is associated to unknown VG "my_vg"
(run vgscan)
pvscan -- inactive PV "/dev/hdg"  is associated to unknown VG "my_vg"
(run vgscan)
pvscan -- inactive PV "/dev/hde"  is associated to unknown VG "my_vg"
(run vgscan)
pvscan -- inactive PV "/dev/hdb"  is associated to unknown VG "my_vg"
(run vgscan)
pvscan -- total: 4 [223.61 GB] / in use: 4 [223.61 GB] / in no VG: 0 [0]

-------------------------- end of output---------------------


--------- output of 'pvdisplay /dev/hd[begik]'-----------------

--- Physical volume ---
PV Name               /dev/hdb
VG Name               my_vg
PV Size               37.27 GB [78165360 secs] / NOT usable 8.19 MB
[LVM: 146 KB]
PV#                   1
PV Status             NOT available
Allocatable           yes (but full)
Cur LV                1
PE Size (KByte)       8192
Total PE              4769
Free PE               0
Allocated PE          4769
PV UUID               VzIeJK-1RXR-CY1X-HL7z-tA0S-Jleb-I29HHV

--- Physical volume ---
PV Name               /dev/hde
VG Name               my_vg
PV Size               74.53 GB [156301488 secs] / NOT usable 8.19 MB
[LVM: 165 KB]
PV#                   4
PV Status             NOT available
Allocatable           yes (but full)
Cur LV                1
PE Size (KByte)       8192
Total PE              9538
Free PE               0
Allocated PE          9538
PV UUID               HOAlS3-7Bck-JzVD-Ds4j-FpEG-lC6L-Gu8peg

--- Physical volume ---
PV Name               /dev/hdg
VG Name               my_vg
PV Size               74.53 GB [156301488 secs] / NOT usable 8.19 MB
[LVM: 165 KB]
PV#                   5
PV Status             NOT available
Allocatable           yes (but full)
Cur LV                1
PE Size (KByte)       8192
Total PE              9538
Free PE               0
Allocated PE          9538
PV UUID               Mu4FuR-qpqZ-glBu-QB6h-mW3s-7tVf-3iq1s3

--- Physical volume ---
PV Name               /dev/hdi
VG Name               my_vg
PV Size               37.27 GB [78165360 secs] / NOT usable 8.19 MB
[LVM: 146 KB]
PV#                   2
PV Status             NOT available
Allocatable           yes (but full)
Cur LV                1
PE Size (KByte)       8192
Total PE              4769
Free PE               0
Allocated PE          4769
PV UUID               3v1hNv-VnYq-hFhX-bBKI-6gbx-21f2-jYbgs7

pvdisplay -- no physical volume identifier on "/dev/hdk"

----------------------------- end of output -------------------------
