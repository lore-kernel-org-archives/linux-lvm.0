Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j5UKFuu11481
	for <linux-lvm@redhat.com>; Thu, 30 Jun 2005 16:15:56 -0400
Received: from web53001.mail.yahoo.com (web53001.mail.yahoo.com
	[206.190.39.191])
	by mx3.redhat.com (8.12.11/8.12.11) with SMTP id j5UKFoUE010011
	for <linux-lvm@redhat.com>; Thu, 30 Jun 2005 16:15:51 -0400
Message-ID: <20050630201541.37422.qmail@web53001.mail.yahoo.com>
Date: Thu, 30 Jun 2005 13:15:41 -0700 (PDT)
From: Sambit Nanda <sambitnanda@yahoo.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] how to remove physical volume
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@redhat.com

 pvscan
pvscan -- reading all physical volumes (this may take
a while...)
pvscan -- inactive PV "/dev/cciss/c0d1" is in no VG 
[67.83 GB]
pvscan -- total: 1 [67.83 GB] / in use: 0 [0] / in no
VG: 1 [67.83 GB]

my pvsacn give this output. 
  now i need to remove "/dev/cciss/c0d1" from my
pvscan so i will able to create the partion once again
using fdisk 

what command should i use to remove this ?
or can i use fdisk without remove this, is it going to
make any impact ??

Thanks, 

Sambit Nanda 
203-553-3424 (O)
