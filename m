Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i5ULgc012425
	for <linux-lvm@redhat.com>; Wed, 30 Jun 2004 17:42:38 -0400
Received: from web40502.mail.yahoo.com (web40502.mail.yahoo.com
	[66.218.78.119])
	by mx1.redhat.com (8.12.10/8.12.10) with SMTP id i5ULgae1029731
	for <linux-lvm@redhat.com>; Wed, 30 Jun 2004 17:42:37 -0400
Message-ID: <20040630214230.91492.qmail@web40502.mail.yahoo.com>
Date: Wed, 30 Jun 2004 14:42:30 -0700 (PDT)
From: Cheretakis Christos <xalkina@yahoo.com>
MIME-Version: 1.0
Subject: [linux-lvm] dm failure while trying to activate damaged LV
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

Here's my story in short. I had an LVM1 setup with
kernel 2.4, with 4 disks (actually 3 disks + 4
partitions on the 4th disk) making up a VG. On the
VG lived (and still live, I hope) 3 LV with
filesystems. My trouble starts when one of those
disks crashed!

I installed kernel 2.6.7, device mapper (1.0.18) and
LVM2 (2.0.18) tools to recover the filesystems (yes,
there was no backup newer than 6 months ago).

I managed to completely recover all filesystems that
are on the LVs not containing the bad disk using the
partial activation feature of LVM2, but I'm getting a
dm error ("ioctl cmd 9 failed") for the one on the
problematic disk, and it cannot be activated.

Based on previous postings both on this list and on
the dm list and various info on man-pages, I created
an ioerror "device" exactly the size of the failed
disk, linked to it from /dev/ioerror, but the LV still
fails to activate.

Following debug messages of LVM, what the code does is
about this:
1) it creates a "soft"-device that is a concatenation
of the original disks & partitions, and replaces the
failed disk with mappings to /dev/ioerror
2) there's not just one single mapping to /dev/ioerror
the size of the original disk, but rather lots of
them,
each one with size 8192 sectors
3) tries to reload the mapping and then fails with
"ioctl cmd 9 failed"

I also tried to recreate a mapping file following what
the lvm code did, and replacing the chunk-mappings of
8192 sectors with one single mapping, but it fails
with the same error.

  Thanx in advance for any help,

      C/


		
__________________________________
Do you Yahoo!?
Yahoo! Mail - 50x more storage than other providers!
http://promotions.yahoo.com/new_mail
