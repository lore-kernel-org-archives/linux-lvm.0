Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i5ULIj005689
	for <linux-lvm@redhat.com>; Wed, 30 Jun 2004 17:18:45 -0400
Received: from web11801.mail.yahoo.com (web11801.mail.yahoo.com
	[216.136.172.155])
	by mx3.redhat.com (8.12.10/8.12.10) with SMTP id i5ULIcXn021559
	for <linux-lvm@redhat.com>; Wed, 30 Jun 2004 17:18:38 -0400
Message-ID: <20040630211837.96747.qmail@web11801.mail.yahoo.com>
Date: Wed, 30 Jun 2004 14:18:37 -0700 (PDT)
From: <bowmailtmp-lvm@yahoo.com>
MIME-Version: 1.0
Subject: [linux-lvm] Snapshot LE to PE Mapping
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

I am using LVM to debug a custom ASIC virtualization
chip  for my company.  I have found it quite useful.

One queston though, I have written scripts to convert 
lvdisplay -vv table output into our own mapping
structures, but found this to be of limited use for
snapshots.

Is there a way to find out where the changed snapshot
data actually resides physically?
if you do lvdisplay for a snapshot volume, it only
gives you the LE->PE maps for the *original* LV.  it
does not show you what extents the *changed* data got
moved to, so i don't know how to track it down and
verify it.  is there another way to do this or is it a
possible enhancement to lvdisplay for snapshot
volumes?

Thanks,
Dave
