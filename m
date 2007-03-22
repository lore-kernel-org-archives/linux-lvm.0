Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l2MFbBbS011644
	for <linux-lvm@redhat.com>; Thu, 22 Mar 2007 11:37:11 -0400
Received: from haydn.is.nottingham.ac.uk (haydn.is.nottingham.ac.uk
	[128.243.40.92])
	by mx1.redhat.com (8.13.1/8.13.1) with ESMTP id l2MFawFS013203
	for <linux-lvm@redhat.com>; Thu, 22 Mar 2007 11:36:58 -0400
Received: from spot.phes.nottingham.ac.uk ([128.243.111.254])
	by haydn.is.nottingham.ac.uk with esmtp (Exim 4.60)
	(envelope-from <tim@arabidopsis.info>) id 1HUPLK-0002Ah-Mq
	for linux-lvm@redhat.com; Thu, 22 Mar 2007 15:36:46 +0000
Received: from [128.243.111.213] (apricot.nottingham.ac.uk [128.243.111.213])
	by spot.phes.nottingham.ac.uk (Postfix) with ESMTP id 5643694C0AE
	for <linux-lvm@redhat.com>; Thu, 22 Mar 2007 15:31:59 +0000 (GMT)
Message-ID: <4602A28E.8010502@arabidopsis.info>
Date: Thu, 22 Mar 2007 15:36:46 +0000
From: Tim Milstead <tim@arabidopsis.info>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] failing hard drive
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@redhat.com

I am a complete noob to lvm.
I have 9 partitions on 9 (190GB) disks, one of which (according to smart 
tools) is failing - hde.
It is running Fedora Core 4 (don't ask)
I want to swap out the drive with a new one (400GB).
pvmove /dev/hde does not work even though the file system in not full. 
It says there are no free extents (or something like that - I don't want 
to needlessly turn the machine back on since hde is getting worse) I 
guess this is because the underlying stuff is full up.
It would be nice if I could just dd the failing drive onto the new drive 
and replace it (using linux on a cd) but I have no reason to believe 
this will work - will it?
Has anyone got a step by step guide of what to do? I guess I must shrink 
the filesystem and then whatever that sits on.
This seems to depend on the version of LVM one is running. I have no 
idea what version comes with Fedora Core 4 or how to find out.

Any ideas welcome.

Thanks,

Tim.

This message has been checked for viruses but the contents of an attachment
may still contain software viruses, which could damage your computer system:
you are advised to perform your own checks. Email communications with the
University of Nottingham may be monitored as permitted by UK legislation.
