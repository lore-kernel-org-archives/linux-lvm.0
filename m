Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id k9HMG6VZ005028
	for <linux-lvm@redhat.com>; Tue, 17 Oct 2006 18:16:07 -0400
Received: from mail.bdmcc-us.com (bdmcc-us.com [209.42.230.180])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k9HMG5lv006698
	for <linux-lvm@redhat.com>; Tue, 17 Oct 2006 18:16:05 -0400
Received: from localhost (mail.bdmcc-us.com [192.168.1.133])
	by mail.bdmcc-us.com (Postfix) with ESMTP id 6944E17F8EB
	for <linux-lvm@redhat.com>; Tue, 17 Oct 2006 18:13:31 -0400 (EDT)
Received: from mail.bdmcc-us.com ([127.0.0.1])
	by localhost (mail.bdmcc-us.com [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 28437-02-2 for <linux-lvm@redhat.com>;
	Tue, 17 Oct 2006 18:13:31 -0400 (EDT)
Date: Tue, 17 Oct 2006 18:13:30 -0400
From: Brian McCullough <bdmc@bdmcc-us.com>
Subject: Re: [linux-lvm] Missing VGs?
Message-ID: <20061017221330.GF28128@bdmcc-us.com>
Mime-Version: 1.0
Content-Disposition: inline
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


A few days ago, I asked about an old drive that I have that has two
partitions, typed as "fd" ( Linux RAID autodetect ).  Running vgscan and
pvscan doesn't seem to produce anything that makes sense to me, because
I expect to see VGs on these two partitions.

I then went on to "pvdisplay" and see the following, which seems to say
that the "pvcreate" command was run on both partitions, but that nothing
else was done.  Am I correct, and am I dealing with two basically unused
LVM2 partitions?



  --- NEW Physical volume ---
  PV Name               /dev/md5
  VG Name
  PV Size               37.26 GB
  Allocatable           NO
  PE Size (KByte)       0
  Total PE              0
  Free PE               0
  Allocated PE          0
  PV UUID               62mYb1-sf0O-FA0J-D6TI-kUg6-R5og-mOZAB6

  --- NEW Physical volume ---
  PV Name               /dev/md6
  VG Name
  PV Size               149.05 GB
  Allocatable           NO
  PE Size (KByte)       0
  Total PE              0
  Free PE               0
  Allocated PE          0
  PV UUID               uhilT7-33EQ-65Ml-ntFf-iDjJ-fhkn-lag1ev


Thanks,
Brian
