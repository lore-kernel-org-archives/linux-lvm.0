Return-Path: <Holger.Rauch@heitec.de>
Date: Wed, 31 Jan 2001 18:30:37 +0100 (CET)
From: Holger Rauch <Holger.Rauch@heitec.de>
Message-ID: <Pine.LNX.4.21.0101311816020.13129-100000@miami.datech2.er.heitec.net>
MIME-Version: 1.0
Subject: [linux-lvm] Maximum # of PEs Per PV
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

Hi!

A friend of mine installed three 80G disks in order to create a 240G LV
for his file server. The machine had a 2.4.1 kernel and LVM 0.9.1beta3
installed.

In order to create the LV, I first created primary partition of type 8e, 
then the PVs using pvcreate: 

pvcreate /dev/hd[f-h]1

and then the volume group with vgcreate:

vgcreate mp3 /dev/hd[f-h]1

When I was trying to create a LV of 240G in size, using

lvcreate -n fjdb -L 240G mp3

I got a message telling me that I may only use a certain number of
PEs (more precisely 58623; see below)

Doing a "vgdisplay -v mp3" gave me:

--- Volume group ---
VG Name               mp3
VG Access             read/write
VG Status             available/resizable
VG #                  0
MAX LV                256
Cur LV                1
Open LV               1
MAX LV Size           255.99 GB
Max PV                256
Cur PV                3
Act PV                3
VG Size               229 GB
PE Size               4 MB
Total PE              58623
Alloc PE / Size       58623 / 229 GB
Free  PE / Size       0 / 0
VG UUID               o4Zrsk-bibt-SbCy-d15O-mi5H-vw9r-lppgBA

--- Logical volume ---
LV Name                /dev/mp3/fjdb
VG Name                mp3
LV Write Access        read/write
LV Status              available
LV #                   1
# open                 1
LV Size                229 GB
Current LE             58623
Allocated LE           58623
Allocation             next free
Read ahead sectors     120
Block device           58:0


--- Physical volumes ---
PV Name (#)           /dev/hdf1 (1)
PV Status             available / allocatable
Total PE / Free PE    19541 / 0

PV Name (#)           /dev/hdg1 (2)
PV Status             available / allocatable
Total PE / Free PE    19541 / 0

PV Name (#)           /dev/hdh1 (3)
PV Status             available / allocatable
Total PE / Free PE    19541 / 0

"lvdisplay /dev/mp3/fjdb" also told me that the LV is only 229G in size:

--- Logical volume ---
LV Name                /dev/mp3/fjdb
VG Name                mp3
LV Write Access        read/write
LV Status              available
LV #                   1
# open                 1
LV Size                229 GB
Current LE             58623
Allocated LE           58623
Allocation             next free
Read ahead sectors     120
Block device           58:0

After creating the file system with "mkreiserfs /dev/mp3/fjdb", the output
of "df -k" was:

Filesystem           1k-blocks      Used Available Use% Mounted on
/dev/hde1              2071296     99920   1866152   5% /
/dev/hde2              4200856    504176   3696680  12% /home
/dev/hde4             13365668   6056124   7309544  45% /usr
/dev/mp3/fjdb        240112476     32840 240079636   0% /fjdb

Now, I've got a few questions:
1. Why do I only have 229GB available on this volume group instead of
240G?
2. What is the maximum number of PEs per VG? I was looking in the HOWTOs
for LVM limits, but I could not find anything on this issue.
3. Why does "df -k" tell me that I nevertheless have 240G available?

Thanks in advance! Any help is greatly appreciated!

Greetings,
	
	Holger
