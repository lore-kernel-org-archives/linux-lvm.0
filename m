Return-Path: <Jean-Eric.Cuendet@linkvest.com>
Message-ID: <B45465FD9C23D21193E90000F8D0F3DF683CB2@mailsrv.linkvest.com>
From: Jean-Eric Cuendet <Jean-Eric.Cuendet@linkvest.com>
Date: Tue, 15 May 2001 14:37:22 +0200
MIME-Version: 1.0
Content-Type: multipart/mixed;
	boundary="----_=_NextPart_000_01C0DD3B.C9EC6D28"
Subject: [linux-lvm] Lost filesystems on LVs (forgot the attachment)
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
To: "'linux-lvm@sistina.com'" <linux-lvm@sistina.com>

This message is in MIME format. Since your mail reader does not understand
this format, some or all of this message may not be legible.

------_=_NextPart_000_01C0DD3B.C9EC6D28
Content-Type: text/plain;
	charset="iso-8859-1"


Hi,
I have a BIG problem. I have an LVM VG of 160Gb. There is 3 LVs defined:
- MS
- Distrib
- backups
This morning, I made a e2fsadm to reduce the MS volume and grow the backup
one.
I umounted the MS volume, made the e2fsadm. All was OK, no error.
I then umounted the backups LV and made the e2fsadm. e2fsck refused to work
saying that there was no filesystem on it! All was OK, until I umount it!
And now, I'm sticked with the backups LV with no filesystem (it was OK until
this night, all backups were OK) and the MS LV with things that I don't
understand (files that shouldn't be here...)

I added in attach, the dump2fs and "cat /proc/lvm/global"

Any idea? Help?
thanks
-jec

_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ 
Jean-Eric Cuendet
Linkvest SA
Av des Baumettes 19, 1020 Renens Switzerland
Tel +41 21 632 9043  Fax +41 21 632 9090
http://www.linkvest.com  E-mail: jean-eric.cuendet@linkvest.com
_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ 




------_=_NextPart_000_01C0DD3B.C9EC6D28
Content-Type: application/octet-stream;
	name="MS_dumpe2fs"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
	filename="MS_dumpe2fs"

Filesystem volume name:   <none>=0A=
Last mounted on:          <not available>=0A=
Filesystem UUID:          7fd6e42e-bf72-459e-a916-5fe981daa2f1=0A=
Filesystem magic number:  0xEF53=0A=
Filesystem revision #:    1 (dynamic)=0A=
Filesystem features:      filetype sparse_super=0A=
Filesystem state:         clean=0A=
Errors behavior:          Continue=0A=
Filesystem OS type:       Linux=0A=
Inode count:              1310720=0A=
Block count:              2621440=0A=
Reserved block count:     131072=0A=
Free blocks:              1393420=0A=
Free inodes:              1259067=0A=
First block:              0=0A=
Block size:               4096=0A=
Fragment size:            4096=0A=
Blocks per group:         32768=0A=
Fragments per group:      32768=0A=
Inodes per group:         16384=0A=
Inode blocks per group:   512=0A=
Last mount time:          Tue May 15 14:26:37 2001=0A=
Last write time:          Tue May 15 14:29:09 2001=0A=
Mount count:              0=0A=
Maximum mount count:      20=0A=
Last checked:             Tue May 15 14:29:09 2001=0A=
Check interval:           15552000 (6 months)=0A=
Next check after:         Sun Nov 11 13:29:09 2001=0A=
Reserved blocks uid:      0 (user root)=0A=
Reserved blocks gid:      0 (group root)=0A=
First inode:              11=0A=
Inode size:		  128=0A=
=0A=

------_=_NextPart_000_01C0DD3B.C9EC6D28
Content-Type: application/octet-stream;
	name="lvm_global"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
	filename="lvm_global"

LVM module version 0.9.1_beta6 (12/03/2001)=0A=
=0A=
Total:  2 VGs  17 PVs  9 LVs (5 LVs open 5 times)=0A=
=0A=
Global: 197986 bytes malloced   IOP version: 10   24 days 19:24:04 =
active=0A=
=0A=
VG:  RAID5_SDX  [3 PV, 6 LV/4 open]  PE Size: 16384 KB=0A=
  Usage [KB/PE]: 65503232 /3998 total  56770560 /3465 used  8732672 =
/533 free=0A=
  PVs: [AA] md7                   16318464 /996     16318464 /996       =
     0 /0     =0A=
       [AA] md6                   20496384 /1251    20496384 /1251      =
     0 /0     =0A=
       [AA] md5                   28688384 /1751    19955712 /1218     =
8732672 /533   =0A=
    LVs: [AWDL  ] filesrv                   40894464 /2496     1x =
open=0A=
         [AWDL  ] cvsroot                    4194304 /256      1x =
open=0A=
         [AWDL  ] homes                      1048576 /64       1x =
open=0A=
         [AWDL  ] acls                         16384 /1        close=0A=
         [AWDL  ] database                  10485760 /640      1x =
open=0A=
         [AWDL  ] test                        131072 /8        close=0A=
=0A=
VG:  NORAID_HDX  [14 PV, 3 LV/1 open]  PE Size: 16384 KB=0A=
  Usage [KB/PE]: 159891456 /9759 total  125829120 /7680 used  34062336 =
/2079 free=0A=
  PVs: [AA] hda5                  10240000 /625     10240000 /625       =
     0 /0     =0A=
       [AA] hda6                  10240000 /625     10240000 /625       =
     0 /0     =0A=
       [AA] hda7                  10240000 /625     10240000 /625       =
     0 /0     =0A=
       [AA] hda8                  10240000 /625     10240000 /625       =
     0 /0     =0A=
       [AA] hda9                  10240000 /625     10240000 /625       =
     0 /0     =0A=
       [AA] hda10                  8224768 /502      8224768 /502       =
     0 /0     =0A=
       [AA] hda1                  20480000 /1250    20480000 /1250      =
     0 /0     =0A=
       [AA] hdc1                  20463616 /1249    20463616 /1249      =
     0 /0     =0A=
       [AA] hdc10                  8339456 /509      4489216 /274      =
3850240 /235   =0A=
       [AA] hdc8                  10240000 /625      3604480 /220      =
6635520 /405   =0A=
       [AA] hdc9                  10240000 /625     10240000 /625       =
     0 /0     =0A=
       [AA] hdc5                  10256384 /626      7127040 /435      =
3129344 /191   =0A=
       [AA] hdc7                  10371072 /633            0 /0       =
10371072 /633   =0A=
       [AA] hdc6                  10076160 /615            0 /0       =
10076160 /615   =0A=
    LVs: [AWDL  ] backups                  104857600 /6400     close=0A=
         [AWDL  ] Microsoft                 10485760 /640      close=0A=
         [AWDL  ] Distributions             10485760 /640      1x =
open=0A=

------_=_NextPart_000_01C0DD3B.C9EC6D28
Content-Type: application/octet-stream;
	name="backups_dumpe2fs"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
	filename="backups_dumpe2fs"

Filesystem volume name:   <none>=0A=
Last mounted on:          <not available>=0A=
Filesystem UUID:          644de1c2-b24f-4b6a-903e-fdb18c636f62=0A=
Filesystem magic number:  0xEF53=0A=
Filesystem revision #:    1 (dynamic)=0A=
Filesystem features:      filetype sparse_super large_file=0A=
Filesystem state:         clean with errors=0A=
Errors behavior:          Continue=0A=
Filesystem OS type:       Linux=0A=
Inode count:              13107200=0A=
Block count:              26214400=0A=
Reserved block count:     1310720=0A=
Free blocks:              2995342=0A=
Free inodes:              13045260=0A=
First block:              0=0A=
Block size:               4096=0A=
Fragment size:            4096=0A=
Blocks per group:         32768=0A=
Fragments per group:      32768=0A=
Inodes per group:         16384=0A=
Inode blocks per group:   512=0A=
Last mount time:          Fri Apr 20 19:12:26 2001=0A=
Last write time:          Tue May 15 06:59:49 2001=0A=
Mount count:              3=0A=
Maximum mount count:      20=0A=
Last checked:             Wed Mar 28 10:54:34 2001=0A=
Check interval:           15552000 (6 months)=0A=
Next check after:         Mon Sep 24 10:54:34 2001=0A=
Reserved blocks uid:      0 (user root)=0A=
Reserved blocks gid:      0 (group root)=0A=
First inode:              11=0A=
Inode size:		  128=0A=
=0A=

------_=_NextPart_000_01C0DD3B.C9EC6D28--
