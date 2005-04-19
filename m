Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j3JH8kO31149
	for <linux-lvm@redhat.com>; Tue, 19 Apr 2005 13:08:46 -0400
Received: from ithilien.qualcomm.com (ithilien.qualcomm.com [129.46.51.59])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id j3JH8dpp017032
	for <linux-lvm@redhat.com>; Tue, 19 Apr 2005 13:08:40 -0400
Received: from crowley.qualcomm.com (crowley.qualcomm.com [129.46.61.151])
	by ithilien.qualcomm.com (8.12.10/8.12.5/1.0) with ESMTP id
	j3JH8WHa002443
	for <linux-lvm@redhat.com>; Tue, 19 Apr 2005 10:08:32 -0700 (PDT)
Received: from a64.davidb.org (xing.qualcomm.com [129.46.50.100])
	by crowley.qualcomm.com (8.12.10/8.12.5/1.0) with ESMTP id
	j3JH8TIT004406
	for <linux-lvm@redhat.com>; Tue, 19 Apr 2005 10:08:30 -0700 (PDT)
Date: Tue, 19 Apr 2005 10:08:27 -0700
From: "David Brown" <davidb@qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID: <opsphokdjknas5wc@a64.davidb.org>
Subject: [linux-lvm] Snapshots and mmaped files.
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
Content-Type: text/plain; format="flowed"; delsp="yes"; charset="us-ascii"
To: linux-lvm@redhat.com

I'm using lvm2 snapshots to do backups of several machines.  (lvm2  
2.00.33, device-mapper 1.01.00,
ftp://sources.redhat.com/pub/dm/patches/2.6-unstable/2.6.9/2.6.9-udm1.tar.bz2  
minus patch 13)  (I've tried some newer patches, without success, but  
that'll be a separate mail).

The problem shows up with files that contains Berkeley databases.  These  
files seem to be modified on both the original and the snapshot.  They  
show up in my 'var' partition with imapd, and exim, and anything else that  
has a berkeley database opened, and modifies the file after the snapshot  
is taken.

The mtime of the file is not modified, only the contents.  I suspect that  
if one side grew, then the size change would not be affected.

Thanks,
David Brown
