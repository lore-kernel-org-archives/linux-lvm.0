Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j9V4BsV23984
	for <linux-lvm@redhat.com>; Sun, 30 Oct 2005 23:11:54 -0500
Received: from xproxy.gmail.com (xproxy.gmail.com [66.249.82.194])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id j9V4BmII015795
	for <linux-lvm@redhat.com>; Sun, 30 Oct 2005 23:11:48 -0500
Received: by xproxy.gmail.com with SMTP id s14so699043wxc
	for <linux-lvm@redhat.com>; Sun, 30 Oct 2005 20:11:48 -0800 (PST)
Message-ID: <e92a1b70510302011x1b93ed46m@mail.gmail.com>
Date: Mon, 31 Oct 2005 05:11:47 +0100
From: Tobias <t.bjorndal@gmail.com>
Subject: [linux-lvm] How does LVM2 handle disc error?
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
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

Hi I'm about to set up a file server. How does lvm2 handle disc
crashes in a logic volume? The thing is we don't care if the data on
just the disc which crashes is gone, we have all data offline on tape
and dvds. But we don't want the whole group to crash because of one
disc. We would like to not use raid5 and such because one disc is
lost.

Its for internal use so there will be no heavy load. About 10-20 ppl
will use the server for online central storage. Storage size at least
1Tb but we hope for 2Tb or more without any expensive hardware. Only
cheap sata expansion cards and discs.

/Tobias
