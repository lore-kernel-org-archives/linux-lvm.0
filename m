Return-Path: <andrew@lvadp.fc.hp.com>
Message-Id: <200105100013.f4A0DWs31127@lvadp.fc.hp.com>
Date: Wed, 09 May 2001 18:13:32 -0600
From: Andrew Patterson <andrew@lvadp.fc.hp.com>
Subject: [linux-lvm] Max logical volume size 1TB or 2TB?
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

Well, I finally collected enough storage to test whether you can create
a logical volume of greater than 1 TB.  It didn't really dawn on me exactly
how big a TB is until after collecting 75 18-36 GB drives together to 
get to something this size.

Anyway,

I patched LVM 0.9.1_beta7 lvm.h source a little to get past the system
defined limits.

These are the changes I made:

#define LVM_LV_SIZE_MAX(a)      ( ( long long) LVM_PE_T_MAX * (a)->pe_size > ( 
long long) 1024*1024/SECTOR_SIZE*1024*1024*2 ? ( long long) 
1024*1024/SECTOR_SIZE*1024*1024*2 : ( long long) LVM_PE_T_MAX * (a)->pe_size)

#define LVM_MAX_SIZE            ( 1024LU * 1024 / SECTOR_SIZE * 1024 * 1024*2)

goes to:

#define LVM_LV_SIZE_MAX(a)      ( ( long long) LVM_PE_T_MAX * (a)->pe_size > ( 
long long) 1024*1024/SECTOR_SIZE*1024*1024*2 ? ( long long) 
1024*1024/SECTOR_SIZE*1024*1024*2 : ( long long) LVM_PE_T_MAX * (a)->pe_size)

#define LVM_MAX_SIZE            ( 1024LU * 1024 / SECTOR_SIZE * 1024 * 1024*2)


Note that I have multiplied by 2.


After installing and running a new kernel, I get the following error when
running pvcreate on any of the disks:
<333> lvm_check_dev -- LEAVING with ret: 1
<22> pv_check_consistency -- LEAVING with ret: -222
<1> pv_write -- LEAVING with ret: -99
<1> lvm_error -- CALLED with: -99
<1> lvm_error -- LEAVING with: "parameter error"
pvcreate -- ERROR "parameter error" creating physical volume "/dev/sdc"


I then looked at tools/lib/pv_check_consistency.c and found:

   else if ( pv->pv_size > LVM_MAX_SIZE)
         ret = -LVM_EPV_CHECK_CONSISTENCY_PV_SIZE;

where

#define define LVM_EPV_CHECK_CONSISTENCY_PV_SIZE 222

Since all of my PV's are well under 2 TB, I believe that the
LVM_MAX_SIZE macro is overflowing.

Incidently, I tried the same thing but left the LVM_MAX_SIZE macro
unchanged. In this test, everything worked fine, except that I could
not create a logical volume bigger than 1 TB.  So it looks like
Heinz's internal documentation is correct.

Again, Is there any reason that this number should not be 2 TB given that
2^32 * 512 = 2 TB?  Other than not consistently using unsigned long longs?

Andrew 

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
   Andrew Patterson                          Voice:  (970) 898-3261
   Hewlett-Packard    			     Email: andrew@fc.hp.com
