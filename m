Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id iA61DAr18923
	for <linux-lvm@redhat.com>; Fri, 5 Nov 2004 20:13:10 -0500
Received: from nile.gs.washington.edu (nile.gs.washington.edu [128.95.231.71])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id iA61D4hS013862
	for <linux-lvm@redhat.com>; Fri, 5 Nov 2004 20:13:04 -0500
Received: from nile.gs.washington.edu (localhost [127.0.0.1])
	by nile.gs.washington.edu (8.12.10/8.12.10) with ESMTP id
	iA61D3OU012117
	for <linux-lvm@redhat.com>; Fri, 5 Nov 2004 17:13:03 -0800
Received: (from dgs@localhost)
	by nile.gs.washington.edu (8.12.10/8.12.10/Submit) id iA61CxKt012116
	for linux-lvm@redhat.com; Fri, 5 Nov 2004 17:12:59 -0800
Date: Fri, 5 Nov 2004 17:12:59 -0800
From: "David S." <dgs@gs.washington.edu>
Message-ID: <20041106011259.GB11112@nile.gs.washington.edu>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] 'vgscan' at boot-up
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


I'm using lvm2-2.00.15 and device-mapper-1.00.17 on a Slackware (x86)
system, with a 2.6.9 kernel and udev-026.  I've created a volume
group and a logical volume without any trouble, but the file system
I built on the volume won't mount at boot-up.  That's apparently
because the 'vgscan' program run from the system initialization
script does not find an volume groups.  After the system boots,
'vgscan' works fine.  I can get the file system mounted by putting

	/sbin/vgscan 2>/dev/null
	sleep 10
	/sbin/vgchange -ay
	/sbin/mount -a

in 'rc.local'.  Does anyone have a idea why 'vgscan' would fail
in the sytem initialization script, but succeed in 'rc.local'?

David S.
