Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id k16LpA100834
	for <linux-lvm@redhat.com>; Mon, 6 Feb 2006 16:51:10 -0500
Received: from smtp804.mail.ukl.yahoo.com (smtp804.mail.ukl.yahoo.com
	[217.12.12.141])
	by mx1.redhat.com (8.12.11/8.12.11) with SMTP id k16Lp4e2001437
	for <linux-lvm@redhat.com>; Mon, 6 Feb 2006 16:51:04 -0500
Date: Mon, 6 Feb 2006 21:51:41 +0000
From: Gunther Clasen <gunther_clasen@arcor.de>
Message-ID: <20060206215141.GB7492@tui.site>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] can't create a PV
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
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

Hi,

I have the following problem: I have a VG which sits on two partitions.
This VG has been created with SuSE 7.2, that is version 1 of LVM. (I
don't know exactly which one.) I wish to extend that VG and I have tried
to do that from SuSE 9.2, which runs
  LVM version:     2.00.25 (2004-09-29)
  Library version: 1.00.19-ioctl (2004-07-03)
  Driver version:  4.1.0

The type of the partition is set to Linux LVM, like the others, but it
does not work. I get this error:

# pvcreate -vv /dev/hdg9
      Setting global/locking_type to 1
      Setting global/locking_dir to /var/lock/lvm
      File-based locking enabled.
      Locking /var/lock/lvm/P_orphans WB
      Getting size of /dev/hdg9
      metadata/pvmetadatasize not found in config: defaulting to 255
      metadata/pvmetadatacopies not found in config: defaulting to 1
  /dev/hdg9: Couldn't find device.  Check your filters?
      Unlocking /var/lock/lvm/P_orphans

I can't see that the filters are a problem. The entry in
/etc/lvm/lvm.conf is:
    filter = [ "r|/dev/.*/by-path/.*|", "r|/dev/.*/by-id/.*|", "a/.*/" ]

I understand now that I should use -M1 to add this PV to an old V1 VG,
but that is not the problem. I still get the same error.

What am I doing wrong?

Any help would be appreciated.

Gunther
