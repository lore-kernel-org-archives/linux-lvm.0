Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j4DFL2O32396
	for <linux-lvm@redhat.com>; Fri, 13 May 2005 11:21:02 -0400
Received: from peet.spb.ru (mail.peet.spb.ru [217.170.66.60])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j4DFL0YX009524
	for <linux-lvm@redhat.com>; Fri, 13 May 2005 11:21:01 -0400
Received: from tsl01 (unknown [217.170.94.110])
	(using TLSv1 with cipher RC4-MD5 (128/128 bits))
	(No client certificate requested)
	by peet.spb.ru (Postfix) with ESMTP id 5F77F4433
	for <linux-lvm@redhat.com>; Fri, 13 May 2005 19:20:58 +0400 (MSD)
From: "Peter V. Saveliev" <peet@peet.spb.ru>
Date: Fri, 13 May 2005 19:20:52 +0400
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 7bit
Message-Id: <200505131920.52291.peet@peet.spb.ru>
Subject: [linux-lvm] pvmove question
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

...

Hello. I have a VG on two software raid1 devices:

~ # pvs
  PV         VG      Fmt  Attr PSize  PFree 
  /dev/md0   hosting lvm2 a-   16.96G 16.96G
  /dev/md1   hosting lvm2 a-   16.96G  6.96G

I need to remove one raid (md1) from VG, but it is used:

~ # vgreduce hosting /dev/md1
  Physical volume "/dev/md1" still in use

But I cannot free it:

~ # pvmove /dev/md1 /dev/md0
  Unrecognised segment type mirror

Is there any solution? The system running lvm is a test box
and data stored on the VG is also unimportant; but I must
complete tests before running this system in production.

~ # uname -r
2.6.11-vs26-smp-rad4

~ # lvm version
File descriptor 5 left open
  LVM version:     2.01.10 (2005-05-03)
  Library version: 1.01.01 (2005-03-29)
  Driver version:  4.4.0


-- 
Peter V. Saveliev
