Return-Path: <andrew@lvadp.fc.hp.com>
Resent-Message-Id: <200104131745.f3DHjGa17509@lvadp.fc.hp.com>
Message-Id: <200104131745.f3DHjGa17509@lvadp.fc.hp.com>
Date: Wed, 11 Apr 2001 15:58:09 -0600
From: Andrew Patterson <andrew@lvadp.fc.hp.com>
Resent-To: linux-lvm@sistina.com
Subject: [linux-lvm] What is the the maximum logical volume size?
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

I am tring to figure out what the maximum logical volume size is. The vgcreate
man page says:

       To  limit  kernel  memory usage, there is a limit of 65536
       physical extents (PE) per logical volume, so the  PE  size
       determines  the  maximum logical volume size.  The default
       PE size of 4MB limits a single logical  volume  to  256GB.
       There is also (as of Linux 2.4) a kernel limitation of 2TB
       per block device.

Which implies that the limit is 2 TB on my 2.4 system.  However in
tools/lib/lvm.h for version 0.9.1_beta7, it states:

/*
 * LVM_PE_T_MAX corresponds to:
 *
 * 8KB PE size can map a ~512 MB logical volume at the cost of 1MB memory,
 *
 * 128MB PE size can map a 8TB logical volume at the same cost of memory.
 *
 * Default PE size of 4 MB gives a maximum logical volume size of 256 GB.
 *
 * Maximum PE size of 16GB gives a maximum logical volume size of 1024 TB.
 *
 * AFAIK, the actual kernels limit this to 1 TB.
 *
 * Should be a sufficient spectrum ;*)
 */

Which tells me it is 1 TB.

In the same file:

#define LVM_LV_SIZE_MAX(a) ( ( long long) LVM_PE_T_MAX * (a)->pe_size > ( l
ong long) 1024*1024/SECTOR_SIZE*1024*1024 ? \
  ( long long) 1024*1024/SECTOR_SIZE*1024*1024 : \
  ( long long) LVM_PE_T_MAX * (a)->pe_size)

Which says we can have at most 1024*1024/SECTOR_SIZE*1024*1024 or 2GBs
of sectors or blocks?.

vg_show.c used in vgdisplay then converts this value with the call:

   ( LVM_LV_SIZE_MAX(vg) / 2, SHORT);

vgdisplay then shows this as 1 TB (assuming you have a large enough
extent size). So I am not sure whether there is an incorrect
calculation in the define, an incorrect calculation in vg_show.c, or
if the man page is incorrect and the kernel limit is actually 1 TB.
If the man page is wrong, why only 1 TB.  1 >> 32 * (512 sector size)
should give 2 TB's.

Andrew Patterson
