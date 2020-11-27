Return-Path: <grothe@fb0442.mathematik.tu-darmstadt.de>
From: Holger Grothe <grothe@fb0442.mathematik.tu-darmstadt.de>
Message-Id: <200104121918.AA237823112@fb0442.mathematik.tu-darmstadt.de>
Subject: Re: [linux-lvm] Lost harddrive space
Date: Thu, 12 Apr 2001 21:18:32 MESZ
In-Reply-To: <200104121823.UAA21356@mailserver2.hrz.tu-darmstadt.de>; from "Erik Rigtorp" at Apr 12, 101 8:23 pm
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Hi,
> 
> My harddrive is 61.4GB i think. I think LVM is great software, it should 

Your harddisk is 60 marketing GB (see below).

> #fdisk -l
> 
> Disk /dev/hda: 255 heads, 63 sectors, 7476 cylinders
> Units = cylinders of 16065 * 512 bytes

7476*16065*512/1024 = 60050970 KB = 58643.525 MB = 57.269 GB (factor 1024)

>    Device Boot    Start       End    Blocks   Id  System
> /dev/hda1   *         1        61    489951   83  Linux
> /dev/hda2            62      7476  59560987+  8e  Unknown

489951 KB + 59560987 KB = 60050938 KB (see above, the + indicates a small
loss).

59560987 KB = 58165.026 MB = 56.802 GB (factor 1024)
> 
> 
> #pvdisplay /dev/hda2
> 
> --- Physical volume ---
> PV Name               /dev/hda2
> VG Name               erkki
> PV Size               56.8 GB / NOT usable 1.03 MB [LVM: 177 KB]
> PV#                   1
> PV Status             available
> Allocatable           yes
> Cur LV                3
> PE Size (KByte)       4096

PE Size = 4 MB

> Total PE              14541

14541*4 MB = 58164 MB = 56.800 GB = 59559936 KB (factor 1024)

59560987 KB - 59559936 KB = 1051 KB = 1.026 MB ( < 4MB, so no additional PE
is possible).

Don't believe in the disksizes of marketing guys. These guys only know
calculations with 1000 :-)

Holger 
--
Holger Grothe  (Email: grothe@mathematik.tu-darmstadt.de)
Fachbereich Mathematik, TU Darmstadt
