Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i1CNY9i31571
	for <linux-lvm@redhat.com>; Thu, 12 Feb 2004 18:34:09 -0500
Received: from steelemr-loadb-nat-49.caltech.edu (SteeleMR-loadb-NAT-49.caltech.edu [131.215.49.69])
	by mx1.redhat.com (8.11.6/8.11.6) with SMTP id i1CNY8b01221
	for <linux-lvm@redhat.com>; Thu, 12 Feb 2004 18:34:08 -0500
Received: from water-dog (water-dog [192.168.1.26])
	by water-ox-postvirus (Postfix) with ESMTP id D17FD26ADDA
	for <linux-lvm@redhat.com>; Thu, 12 Feb 2004 15:33:59 -0800 (PST)
Received: from caltech.edu (good.work.caltech.edu [131.215.164.3])
	by water-ox.its.caltech.edu (Postfix) with ESMTP id 5EBC626ADBC
	for <linux-lvm@redhat.com>; Thu, 12 Feb 2004 15:33:58 -0800 (PST)
Message-ID: <402C0D65.80905@caltech.edu>
From: Ling Li <ling@caltech.edu>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] lvm pvscan or vgscan very slow
Sender: linux-lvm-admin@redhat.com
Errors-To: linux-lvm-admin@redhat.com
Reply-To: linux-lvm@redhat.com
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Post: <mailto:linux-lvm@redhat.com>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm/>
Date: Thu Feb 12 18:33:01 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@redhat.com

I am using Fedora 1 with some packages updated from the fedora 
development in order to use kernel 2.6 and LVM2. The operation `lvm 
pvscan' and `lvm vgscan' are very slow, taking about 20-30 min. Is this 
normal, or is this because there is no /etc/lvm.conf file?

Here are the system settings:

device-mapper-1.00.07-2
kernel-smp-2.6.1-1.65
lvm-1.0.3-17
lvm2-2.00.08-2
mkinitrd-3.5.19-1

Root partitions on a SCSI disk, no LVM.
Some data partitions on an 80G IDE disk, with LVM2: 1 PV  1 VG  3 LVs.

--Ling
