Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id iAH0U4r10852
	for <linux-lvm@redhat.com>; Tue, 16 Nov 2004 19:30:04 -0500
Received: from sydney.aussiehosts.com ([202.60.70.115])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id iAH0TvMg014161
	for <linux-lvm@redhat.com>; Tue, 16 Nov 2004 19:29:57 -0500
Message-ID: <1100647794.419a8d72734bb@webmail.slackguy.net>
Date: Wed, 17 Nov 2004 09:29:54 +1000
From: adam@slackguy.net
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] Software RAID 5 Resizing and LVM
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
To: linux-lvm@redhat.com

I've been playing around with adding disks to a software RAID 5 array, and it
works fine.  However, i have LVM running over the top of that and i can't
figure out how to enlarge the Phisical Volume to encompass the newly added
capacity on the raid device.  Has anyone achieved this at all?

Am I barking up the wrong tree here? If so, how would you go about adding drives
to a software RAID 5 device, and actually adding the new space to the filesystem
inside the RAID device?

Thanks in advance

Adam

----------------------------------------------------------------
This message was sent using IMP, the Internet Messaging Program.
