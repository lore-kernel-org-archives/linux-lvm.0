Return-Path: <Dominique.Larchey-Wendling@loria.fr>
Message-ID: <3AEF2A66.8CC8B530@loria.fr>
Date: Tue, 01 May 2001 23:28:06 +0200
From: Dominique LARCHEY-WENDLING <Dominique.Larchey-Wendling@loria.fr>
MIME-Version: 1.0
Subject: Re: [linux-lvm] LVM & high system load
References: <200105011605.f41G5kE31140@dixie.dyndns.org>
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
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

> I doubt it, I've got LVM0.9.1b7 on a 486 without any real load... even when
> compiling the kernel.  I also have reiserfs on 2.2.19.  I noticed in your
> previous post that you had 3 pv's on the same physical disk... that may be
> contributing, depending on your PE layout on the PVs.  

The layout is linear ...

-----------------------------------------------------------------

[root@charlie larchey]# /usr/sbin/lvdisplay -v /dev/mmedia/music

--- Logical volume ---
LV Name                /dev/mmedia/music
VG Name                mmedia
LV Write Access        read/write
LV Status              available
LV #                   2
# open                 2
LV Size                9 GB
Current LE             2304
Allocated LE           2304
Allocation             next free
Read ahead sectors     120
Block device           58:1

   --- Distribution of logical volume on 1 physical volume  ---
   PV Name                  PE on PV     reads      writes
   /dev/hda5                2304         2129836    343926   

   --- logical volume i/o statistic ---
   2129836 reads  343926 writes

   --- Logical extents ---
   LE    PV                        PE     reads      writes
   00000 /dev/hda5                 00006  1025       1875     
   00001 /dev/hda5                 00007  1024       1024     
   00002 /dev/hda5                 00008  1024       1024     
   00003 /dev/hda5                 00009  1024       961      
   00004 /dev/hda5                 00010  1024       0        
.....   
   02298 /dev/hda5                 02304  2048       1024     
   02299 /dev/hda5                 02305  2048       1024     
   02300 /dev/hda5                 02306  2048       1024     
   02301 /dev/hda5                 02307  2048       1024     
   02302 /dev/hda5                 02308  2048       1024     
   02303 /dev/hda5                 02309  2048       1024     

--------------------------------------------------------

> If not, it's definitely silly :)

It is NOT SILLY ... see next post for performance issues

DL

-- 
Dominique Larchey
LORIA, Nancy, France
Tel. (Work) +33 (0) 3 83 59 20 13
