Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i5IGX8000682
	for <linux-lvm@redhat.com>; Fri, 18 Jun 2004 12:33:08 -0400
Received: from artemis.le.ac.uk (artemis.le.ac.uk [143.210.16.126])
	by mx3.redhat.com (8.12.10/8.12.10) with ESMTP id i5IGX2Xn018194
	for <linux-lvm@redhat.com>; Fri, 18 Jun 2004 12:33:02 -0400
Received: from [143.210.12.168] (helo=pc167.cc.le.ac.uk)
	by artemis.le.ac.uk with esmtp (Exim 4.30) id 1BbMIW-00016T-TZ
	for linux-lvm@redhat.com; Fri, 18 Jun 2004 17:33:00 +0100
Received: from rao3 (helo=localhost)
	by pc167.cc.le.ac.uk with local-esmtp (Exim 4.32) id 1BbMIW-0001Pg-SC
	for linux-lvm@redhat.com; Fri, 18 Jun 2004 17:33:00 +0100
Date: Fri, 18 Jun 2004 17:33:00 +0100 (BST)
From: Alex Owen <rao3@leicester.ac.uk>
Message-ID: <Pine.LNX.4.58.0406181723320.4709@pc167.cc.le.ac.uk>
MIME-Version: 1.0
Sender: Alex Owen <rao3@leicester.ac.uk>
Subject: [linux-lvm] (no subject)
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

Hello,
This morning I had an oops which I think is due to extending a
LVM1 LVsnapshot.

I'm running a custom compiled 2.4.26 kernel. Debian source + LVM1.0.8 +
VFS-Lock from dm tarball.

If anyone can give me any pointers to informantion of debuging such
problems that would be great!

Thanks in advance for any advice on debugging.


Here is the syslog output:
Jun 18 07:39:02 falcon /USR/SBIN/CRON[3094]: (root) CMD ([ -x /usr/local/sbin/cron.snapshotextend ] && /usr/local/sbin/cron.snapshotextend)
Jun 18 07:39:03 falcon kernel: Unable to handle kernel NULL pointer dereference at virtual address 00000000
Jun 18 07:39:03 falcon kernel:  printing eip:
Jun 18 07:39:03 falcon kernel: f8855b17
Jun 18 07:39:03 falcon kernel: *pde = 1236b001
Jun 18 07:39:03 falcon kernel: *pte = 00000000
Jun 18 07:39:03 falcon kernel: Oops: 0000
Jun 18 07:39:03 falcon kernel: CPU:    3
Jun 18 07:39:03 falcon kernel: EIP:    0010:[ide-cd:__insmod_ide-cd_O/lib/modules/2.4.26-686-smp-lvm-vfslock/ke+-2135273/96]    Tainted: P
Jun 18 07:39:03 falcon kernel: EFLAGS: 00010202
Jun 18 07:39:03 falcon kernel: eax: 00000000   ebx: f8ac3260   ecx: 00000000   edx: 00000000
Jun 18 07:39:03 falcon kernel: esi: 00402400   edi: f724aa00   ebp: 00006804   esp: c43d7dd0
Jun 18 07:39:03 falcon kernel: ds: 0018   es: 0018   ss: 0018
Jun 18 07:39:03 falcon kernel: Process kupdated (pid: 9, stackpage=c43d7000)
Jun 18 07:39:03 falcon kernel: Stack: f724aa00 f724ab70 f7c92970 00200000 00000080 00000002 00000000 00000000
Jun 18 07:39:03 falcon kernel:        f88526d1 c43d7e2e c43d7e30 00402380 f724aa00 00003a02 eda084a0 00000080
Jun 18 07:39:03 falcon kernel:        00200000 c7d80f80 000c00b0 f7c92800 f7c89000 00402380 00000000 68040000
Jun 18 07:39:03 falcon kernel: Call Trace:    [ide-cd:__insmod_ide-cd_O/lib/modules/2.4.26-686-smp-lvm-vfslock/ke+-2148655/96]
[ide-cd:__insmod_ide-cd_O/lib/modules/2.4.26-686-smp-lvm-vfslock/ke+-2148425/96] [generic_make_request+288/304] [submit_bh+86/224]
[write_locked_buffers+32/44]
Jun 18 07:39:03 falcon kernel:   [write_some_buffers+278/364] [sync_old_buffers+101/168] [kupdate+329/384] [ret_from_fork+6/32] [kupdate+0/384]
[arch_kernel_thread+40/56]
Jun 18 07:39:03 falcon kernel:
Jun 18 07:39:03 falcon kernel: Code: 8b 01 39 d9 74 37 39 71 08 75 ef 66 39 69 0c 75 e9 83 7c 24

The cron job I suspect of trigering the kernel bug is
/usr/local/sbin/cron.snapshotextend :

---8<---
#!/bin/bash
#################################################
# script to extend snapshots before they fill up!
#################################################


#for lv in /dev/vg00/SNAP* ; do
for lv in $( ls /dev/vg00/SNAP* 2>/dev/null )  ; do
    /sbin/lvdisplay $lv | grep "Allocated to snapshot" | \
	( read junk junk junk LVpercent LVvalues
	  #make integer percentage
	  LVpercent=${LVpercent%\%}
	  LVpercent=${LVpercent%.*}
	  #get usage and size from values
	  LVusage=${LVvalues%%/*]}
	  LVusage=${LVusage#[}
	  LVsize=${LVvalues##[*/}
	  LVsize=${LVsize%]}

	  #echo lv $lv
	  #echo percent $LVpercent
	  #echo used $LVusage
	  #echo size $LVsize

	  if /usr/bin/expr $LVpercent '>=' 80  >/dev/null ; then

		LVsizeunit=${LVsize##* }
		LVsizeunit=${LVsizeunit%B}
		#calc 20% of existing snapshot size
		LVextension=${LVsize%% *}
		LVextension=${LVextension%.*}
		LVextension=$(( $LVextension * 20 / 100 ))

		echo /sbin/lvextend -L+$LVextension$LVsizeunit $lv
		/sbin/lvextend -L+${LVextension}${LVsizeunit} $lv
		echo DONE
	  fi

	)

done
---8<---




----------------------------------------------------------------
 Dr Richard Alexander Owen      Unix System Administrator

 The Computer Centre            E-mail: rao3@le.ac.uk
 University of Leicester           Tel: (0116) 2525133
 University Road                   Fax: (0116) 2525027
 Leicester LE1 7RH
----------------------------------------------------------------
