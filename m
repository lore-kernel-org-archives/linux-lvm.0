Return-Path: <juergens@muon.de>
Date: Wed, 29 Nov 2000 18:50:28 +0100
From: Nils Juergens <nils@muon.de>
Subject: Re: [linux-lvm] Problems with lvm 0.9
Message-ID: <20001129185028.A361@dax.muon>
References: <20001128234700.A925@dax.muon>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="OXfL5xGRrasGEqWY"
In-Reply-To: <20001128234700.A925@dax.muon>; from nils@muon.de on Tue, Nov 28, 2000 at 11:47:00PM +0100
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

--OXfL5xGRrasGEqWY
Content-Type: text/plain; charset=us-ascii

Uhm,

it seem i forgot to append said vgdisplay output. Here it comes.
(note the difference between the overall free PE and the PE free on both
PV)

thanks,

Nils
-- 
 >   Nils Juergens  | nils@muon.de | icq 7090774   <
 >  If we all work hard, we can turn this company  <
 >      around 360 degrees -- gruntbert(LOTD)      <

--OXfL5xGRrasGEqWY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename=vgdisplay

--- Volume group ---
VG Name               volumes
VG Access             read/write
VG Status             available/resizable
VG #                  0
MAX LV                256
Cur LV                3
Open LV               3
MAX LV Size           255.99 GB
Max PV                256
Cur PV                11
Act PV                11
VG Size               1.6 GB
PE Size               4 MB
Total PE              409
Alloc PE / Size       163 / 652 MB
Free  PE / Size       246 / 984 MB
VG UUID               txuQnX-aO3Q-1X0D-7Gh1-dD5v-1AsD-iOffDI

--- Logical volume ---
LV Name                /dev/volumes/usr
VG Name                volumes
LV Write Access        read/write
LV Status              available
LV #                   1
# open                 1
LV Size                400 MB
Current LE             100
Allocated LE           100
Allocation             next free
Read ahead sectors     120
Block device           58:0

--- Logical volume ---
LV Name                /dev/volumes/var
VG Name                volumes
LV Write Access        read/write
LV Status              available
LV #                   2
# open                 1
LV Size                52 MB
Current LE             13
Allocated LE           13
Allocation             next free
Read ahead sectors     120
Block device           58:1

--- Logical volume ---
LV Name                /dev/volumes/tmp
VG Name                volumes
LV Write Access        read/write
LV Status              available
LV #                   3
# open                 1
LV Size                200 MB
Current LE             50
Allocated LE           50
Allocation             next free
Read ahead sectors     120
Block device           58:2


--- Physical volumes ---
PV Name (#)           /dev/hda6 (2)
PV Status             available / allocatable
Total PE / Free PE    47 / 47

PV Name (#)           /dev/hda9 (1)
PV Status             available / allocatable
Total PE / Free PE    409 / 246













--OXfL5xGRrasGEqWY--
