Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l42DjJop017797
	for <linux-lvm@redhat.com>; Wed, 2 May 2007 09:45:19 -0400
Received: from mail.igb.uiuc.edu (mail.igb.uiuc.edu [128.174.124.10])
	by mx1.redhat.com (8.13.1/8.13.1) with ESMTP id l42DjG3N006566
	for <linux-lvm@redhat.com>; Wed, 2 May 2007 09:45:18 -0400
Received: from [128.174.124.103] (arthur.igb.uiuc.edu [128.174.124.103])
	(using TLSv1 with cipher RC4-MD5 (128/128 bits))
	(No client certificate requested)
	by mail.igb.uiuc.edu (Postfix) with ESMTP id B29691144012
	for <linux-lvm@redhat.com>; Wed,  2 May 2007 08:45:08 -0500 (CDT)
From: Daniel Davidson <danield@igb.uiuc.edu>
Date: Wed, 02 May 2007 08:44:49 -0500
Message-Id: <1178113489.1412.69.camel@arthur.igb.uiuc.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] I/O errors on two disks
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

I have six promise vtrack 15200 arrays in raid 5 config that I have
LVM'ed together to hold a disk copy of my backup data.  I restarted the
machine yesterday for the first time in a while and the filesystem seems
to be not quite right.  On both of these devices I am getting the
following errors:

[root@sbackup ~]# vgscan
  Reading all physical volumes.  This may take a while...
  /dev/sdc: read failed after 0 of 4096 at 10499998285824: Input/output
error
  /dev/sdf: read failed after 0 of 4096 at 10499996450816: Input/output
error
  Found volume group "backupdisk" using metadata type lvm2

It doesnt make since that there is a bad sector because of the raid 5
nature and the arrays show perfect health.  I can read from the drive as
show by:

[root@sbackup ~]# dd if=/dev/sdc of=/dev/null
1744873+0 records in
1744872+0 records out
893374464 bytes (893 MB) copied, 29.2183 seconds, 30.6 MB/s

Note: I did a ctrl C

Any ideas on how to repair?

thanks,

Dan
