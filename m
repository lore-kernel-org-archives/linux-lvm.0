Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j0IHaDO02128
	for <linux-lvm@redhat.com>; Tue, 18 Jan 2005 12:36:13 -0500
Received: from mproxy.gmail.com (mproxy.gmail.com [216.239.56.247])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id j0IHa7kC003370
	for <linux-lvm@redhat.com>; Tue, 18 Jan 2005 12:36:07 -0500
Received: by mproxy.gmail.com with SMTP id q44so592332cwc
	for <linux-lvm@redhat.com>; Tue, 18 Jan 2005 09:36:06 -0800 (PST)
Message-ID: <dff37527050118093648e504e@mail.gmail.com>
Date: Tue, 18 Jan 2005 12:36:06 -0500
From: Kristina Clair <kclair@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] snapshots and nfs
Reply-To: Kristina Clair <kclair@gmail.com>,
	LVM general discussion and development <linux-lvm@redhat.com>
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

Hello,

I'm trying to create snapshots on a volume whose filesystem is mounted
over nfs on multiple webservers.  lvcreate is hanging trying to
suspend the volume, and I suspect that the problem is that it is being
used by the webservers.  Does this sound like a reasonable theory?  If
so, is there a way to have lvcreate not suspend the volume?  I'm using
xfs, so I should be able to freeze the filesystem.

Thanks for any advice,
Kristina
