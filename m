Received: from mx1.redhat.com (ext-mx16.extmail.prod.ext.phx2.redhat.com
	[10.5.110.21])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id q7AGGqx7010226
	for <linux-lvm@redhat.com>; Fri, 10 Aug 2012 12:16:52 -0400
Received: from mail-qc0-f174.google.com (mail-qc0-f174.google.com
	[209.85.216.174])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q7AGGnig003872
	for <linux-lvm@redhat.com>; Fri, 10 Aug 2012 12:16:49 -0400
Received: by qcro28 with SMTP id o28so1144881qcr.33
	for <linux-lvm@redhat.com>; Fri, 10 Aug 2012 09:16:48 -0700 (PDT)
MIME-Version: 1.0
Date: Fri, 10 Aug 2012 18:16:48 +0200
Message-ID: <CAPPqfY0pGq5W7+WxY_sLbY6ODrTLBxQG+2Un361zVsKz46uCaA@mail.gmail.com>
From: Olivier Doucet <webmaster@ajeux.com>
Subject: [linux-lvm] 'vgchange -a y' took very long when scanning snapshots
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

When rebooting a storage server, activating volumes took hours.
We were able to narrow the problem to 'vgchange -a y' command.

  LVM version:     2.02.87(2)-RHEL6 (2011-10-12)
  Library version: 1.02.66-RHEL6 (2011-10-12)
  Driver version:  4.22.6
(Centos 6.3 distribution)

Same problem encountered with LVM2 2.02.95
Kernel is 2.6.32-279.2.1.el6.centos.plus.x86_64


Note : this version of Centos is shipped with LVM 2.02.95, but when we
encountered this problem we voluntarily downgraded package, but same
behaviour happened.


Issue described in this email was reproduced 4 (out of 4) times with :
vgchange -dv -a n
vgchange -dddddvvvvv -a y

Stalls happens only on snapshots devices. All other devices are
scanned instantly.


last lines printed before long 'stall' are :
#libdm-deptree.c:1923     Loading backup-backup_filer_20120611 table (253:5)
#libdm-deptree.c:1867         Adding target to (253:5): 0 8589934592
snapshot 253:2 253:4 P 8
#ioctl/libdm-iface.c:1628         dm table   (253:5) OF   [16384]
#ioctl/libdm-iface.c:1628         dm reload   (253:5) NF   [16384]

[ stall ]

#libdm-deptree.c:1963         Table size changed from 0 to 8589934592
for backup-backup_filer_20120611
#libdm-deptree.c:1418     Creating backup-backup_filer_20120703-cow
#ioctl/libdm-iface.c:1628         dm create
backup-backup_filer_20120703-cow
LVM-SBDOCZoeaRkw0uExDBg2sgVQj7ZXqmbxG2NIeLyMtosGb5cVd25QWQACwbbknX5R-cow
NF   [16384]
#libdm-deptree.c:1923     Loading backup-backup_filer_20120703-cow table (253:6)
#libdm-deptree.c:1867         Adding target to (253:6): 0 838860800
linear 8:0 21405632512
#ioctl/libdm-iface.c:1628         dm table   (253:6) OF   [16384]
#ioctl/libdm-iface.c:1628         dm reload   (253:6) NF   [16384]
#libdm-deptree.c:1963         Table size changed from 0 to 838860800
for backup-backup_filer_20120703-cow
#libdm-deptree.c:1076     Resuming backup-backup_filer_20120703-cow (253:6)
#libdm-common.c:1259         Udev cookie 0xd4d44fb (semid 163842)
incremented to 2
#libdm-common.c:1500         Udev cookie 0xd4d44fb (semid 163842)
assigned to RESUME task(5) with flags DISABLE_SUBSYSTEM_RULES
DISABLE_DISK_RULES DISABLE_OTHER_RULES LOW_PRIORITY
DISABLE_LIBRARY_FALLBACK (0x3e)
#ioctl/libdm-iface.c:1628         dm resume   (253:6) NF   [16384]
#libdm-common.c:845         backup-backup_filer_20120703-cow: Stacking
NODE_ADD (253,6) 0:6 0660 [trust_udev]
#libdm-common.c:855         backup-backup_filer_20120703-cow: Stacking
NODE_READ_AHEAD 256 (flags=1)
#libdm-deptree.c:1418     Creating backup-backup_filer_20120703
#ioctl/libdm-iface.c:1628         dm create
backup-backup_filer_20120703
LVM-SBDOCZoeaRkw0uExDBg2sgVQj7ZXqmbxG2NIeLyMtosGb5cVd25QWQACwbbknX5R
NF   [16384]
#libdm-deptree.c:1923     Loading backup-backup_filer_20120703 table (253:7)
#libdm-deptree.c:1867         Adding target to (253:7): 0 8589934592
snapshot 253:2 253:6 P 8
#ioctl/libdm-iface.c:1628         dm table   (253:7) OF   [16384]
#ioctl/libdm-iface.c:1628         dm reload   (253:7) NF   [16384]

[ stall again ]

#libdm-deptree.c:1963         Table size changed from 0 to 8589934592
for backup-backup_filer_20120703
#libdm-deptree.c:1418     Creating backup-backup_filer_20120804-cow
#ioctl/libdm-iface.c:1628         dm create
backup-backup_filer_20120804-cow
LVM-SBDOCZoeaRkw0uExDBg2sgVQj7ZXqmbxw32gXviTtaFEraB8Xp2SqZOtA1Xi6dLW-cow
NF   [16384]
#libdm-deptree.c:1923     Loading backup-backup_filer_20120804-cow table (253:8)
#libdm-deptree.c:1867         Adding target to (253:8): 0 838860800
linear 8:0 24970790912
#ioctl/libdm-iface.c:1628         dm table   (253:8) OF   [16384]
#ioctl/libdm-iface.c:1628         dm reload   (253:8) NF   [16384]
#libdm-deptree.c:1963         Table size changed from 0 to 838860800
for backup-backup_filer_20120804-cow
#libdm-deptree.c:1076     Resuming backup-backup_filer_20120804-cow (253:8)
#libdm-common.c:1259         Udev cookie 0xd4d44fb (semid 163842)
incremented to 2
#libdm-common.c:1500         Udev cookie 0xd4d44fb (semid 163842)
assigned to RESUME task(5) with flags DISABLE_SUBSYSTEM_RULES
DISABLE_DISK_RULES DISABLE_OTHER_RULES LOW_PRIORITY
DISABLE_LIBRARY_FALLBACK (0x3e)
#ioctl/libdm-iface.c:1628         dm resume   (253:8) NF   [16384]
#libdm-common.c:845         backup-backup_filer_20120804-cow: Stacking
NODE_ADD (253,8) 0:6 0660 [trust_udev]
#libdm-common.c:855         backup-backup_filer_20120804-cow: Stacking
NODE_READ_AHEAD 256 (flags=1)
#libdm-deptree.c:1418     Creating backup-backup_filer_20120804
#ioctl/libdm-iface.c:1628         dm create
backup-backup_filer_20120804
LVM-SBDOCZoeaRkw0uExDBg2sgVQj7ZXqmbxw32gXviTtaFEraB8Xp2SqZOtA1Xi6dLW
NF   [16384]
#libdm-deptree.c:1923     Loading backup-backup_filer_20120804 table (253:9)
#libdm-deptree.c:1867         Adding target to (253:9): 0 8589934592
snapshot 253:2 253:8 P 8
#ioctl/libdm-iface.c:1628         dm table   (253:9) OF   [16384]
#ioctl/libdm-iface.c:1628         dm reload   (253:9) NF   [16384]

[ stall again ]

#libdm-deptree.c:1963         Table size changed from 0 to 8589934592
for backup-backup_filer_20120804
#libdm-deptree.c:1076     Resuming backup-backup_filer_20120611 (253:5)

[ then all other devices scanned correctly. ]

 After several scans (lvchange -a n / lvchange -a y) it took several
minutes. On first startup, I had to wait an hour !

lvs shows volumes correctly  :
  LV                    VG     Attr     LSize   Pool Origin
Data%  Move Log Copy%  Convert
  backup_filer          backup owi-i-s-   4.00t
  backup_filer_20120611 backup swi-a- 450.00g backup_filer  63.40
  backup_filer_20120703 backup swi-a- 400.00g backup_filer  31.87
  backup_filer_20120804 backup swi-a- 400.00g backup_filer   0.89

FYI, during scan, lvs reports current scanned volume as :
  LV                    VG     Attr   LSize   Origin       Snap%  Move
Log Copy%  Convert
backup_filer_20120611  backup swi-d- 450.00g backup_filer 100.00



During the whole operation, iostat shows reads on device (no write).
First time, it was ~ 20 op / second, with only 4k reads.
We had faster reads in next tries, but always 4k reads.

blktrace shows this :
  8,0    4      382     2.722717405  2270  P   N [vgchange]
  8,0    4      383     2.722717852  2270  I  RS 11406323392 + 8 [vgchange]
  8,0    4      384     2.722718667  2270  D  RS 11406323392 + 8 [vgchange]
  8,0    4      385     2.722971859     0  C  RS 11406323392 + 8 [0]
  8,0    4      386     2.770606623  2270  A  RS 11406325448 + 8 <-
(253,4) 268349128
  8,0    4      387     2.770607053  2270  Q  RS 11406325448 + 8 [vgchange]
  8,0    4      388     2.770607865  2270  G  RS 11406325448 + 8 [vgchange]
  8,0    4      389     2.770608723  2270  P   N [vgchange]
  8,0    4      390     2.770609099  2270  I  RS 11406325448 + 8 [vgchange]
  8,0    4      391     2.770609916  2270  D  RS 11406325448 + 8 [vgchange]
  8,0    4      392     2.770869631     0  C  RS 11406325448 + 8 [0]
  8,0    4      393     2.817461530  2270  A  RS 11406327504 + 8 <-
(253,4) 268351184
  8,0    4      394     2.817461968  2270  Q  RS 11406327504 + 8 [vgchange]
  8,0    4      395     2.817462775  2270  G  RS 11406327504 + 8 [vgchange]



I'm pretty sure this is not a normal behaviour ... if launching LVM
take so much time, there is something definitely wrong.

I kept complete vgchange output if needed.

Any feedback welcome. This is a production server, but I can test new
softwares on scheduled downtimes (this is a backup server, so no need
for 100% uptime).

Olivier
