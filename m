Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id k9EIlijb019056
	for <linux-lvm@redhat.com>; Sat, 14 Oct 2006 14:47:44 -0400
Received: from mail.bdmcc-us.com (bdmcc-us.com [209.42.230.180])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k9EIlgbQ022504
	for <linux-lvm@redhat.com>; Sat, 14 Oct 2006 14:47:43 -0400
Received: from localhost (mail.bdmcc-us.com [192.168.1.133])
	by mail.bdmcc-us.com (Postfix) with ESMTP id 0559B17F8AD
	for <linux-lvm@redhat.com>; Sat, 14 Oct 2006 14:44:27 -0400 (EDT)
Received: from mail.bdmcc-us.com ([127.0.0.1])
	by localhost (mail.bdmcc-us.com [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 26385-01 for <linux-lvm@redhat.com>;
	Sat, 14 Oct 2006 14:44:26 -0400 (EDT)
Date: Sat, 14 Oct 2006 14:44:26 -0400
From: Brian McCullough <bdmc@bdmcc-us.com>
Subject: Re: [linux-lvm] Missing VGs?
Message-ID: <20061014184426.GA26323@bdmcc-us.com>
References: <20061014182619.GA25852@bdmcc-us.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20061014182619.GA25852@bdmcc-us.com>
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

On Sat, Oct 14, 2006 at 02:26:19PM -0400, Brian McCullough wrote:
> Folks,


And replying to myself:


I then went on to "pvdisplay" and see:



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



Am I understanding that "pvcreate" was executed on these two partitions,
but not "vgcreate" or "lvcreate".


Thanks,
Brian
