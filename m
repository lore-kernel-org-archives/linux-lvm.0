Message-ID: <3BF8F795.1342741@LTUtech.com>
From: Igor Dumaire <Igor.Dumaire@LTUtech.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] vgcfgrestore error !
References: <3BF8E5DE.ABAEB618@LTUtech.com> <20011119125632.A12388@sistina.com>
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
Date: Mon Nov 19 06:12:01 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

> you need to figure out, which Physical Volumes (PVs) belong to your VG lvm1
> by running 'vgcfgrestore -ll -n lvm1'. Please check for the PV list at
> the end of the output.
> 

the PV list it' OK. (hde1, hdf1 and hdc1)

# vgcfgrestore -ll -n lvm1
--- Volume group ---
VG Name               lvm1
VG Access             read/write
VG Status             NOT available/resizable
VG #                  0
MAX LV                255
Cur LV                1
Open LV               0
MAX LV Size           255.99 GB
Max PV                255
Cur PV                3
Act PV                3
VG Size               171.79 GB
PE Size               4.00 MB
Total PE              43977
Alloc PE / Size       43776 / 171.00 GB
Free  PE / Size       201 / 804.00 MB
VG UUID               iwDjRO-WlFd-GZUw-DU20-GP8C-mMwV-MkzCeR

--- Logical volume ---
LV Name                /dev/lvm1/Data
VG Name                lvm1
LV Write Access        read/write
LV Status              available
LV #                   1
# open                 0
LV Size                171.00 GB
Current LE             43776
Allocated LE           43776
Allocation             next free
Read ahead sectors     120
Block device           58:0


--- Physical volume ---
PV Name               /dev/hde1
VG Name               lvm1
PV Size               57.27 GB / NOT usable 8.11 MB [LVM: 181.00 KB]
PV#                   1
PV Status             NOT available
Allocatable           yes (but full)
Cur LV                1
PE Size (KByte)       4096
Total PE              14659
Free PE               0
Allocated PE          14659
PV UUID               kbvz5r-hJlN-WU9Q-7xwj-alJ6-8UfO-jopMFc
 
--- Physical volume ---
PV Name               /dev/hdf1
VG Name               lvm1
PV Size               57.27 GB / NOT usable 8.11 MB [LVM: 181.00 KB]
PV#                   2
PV Status             NOT available
Allocatable           yes (but full)
Cur LV                1
PE Size (KByte)       4096
Total PE              14659
Free PE               0
Allocated PE          14659
PV UUID               weQY7t-7II0-7t74-hVI5-Dj8Y-CV0O-8CyGqh
 
--- Physical volume ---
PV Name               /dev/hdc1
VG Name               lvm1
PV Size               57.27 GB / NOT usable 8.11 MB [LVM: 181.00 KB]
PV#                   3
PV Status             available
Allocatable           yes
Cur LV                1
PE Size (KByte)       4096
Total PE              14659
Free PE               201
Allocated PE          14458
PV UUID               BFvA7F-ccvF-e5r1-3QH7-02JG-dH4r-AOYF64

> What error happend in the first place causing lvm1 to disapear?
I don't known.

> Do you use recent LVM software?
LVM version 1.0.1-rc4(03/10/2001) 
vgcreate: Logical Volume Manager 1.0.1-rc4
Heinz Mauelshagen, Sistina Software  03/10/2001 (IOP 10)

Regards,

-- 
Igor Dumaire

www.LTUtech.com - Making Sense of Visual Content
------------------------------------------------
