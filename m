Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n2N9AxZ8030552
	for <linux-lvm@redhat.com>; Mon, 23 Mar 2009 05:10:59 -0400
Received: from mail2.serverclone.com (mail2.serverclone.com [78.47.131.219])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id n2N998Ad030508
	for <linux-lvm@redhat.com>; Mon, 23 Mar 2009 05:09:09 -0400
Message-ID: <49C751B1.2050307@nieuwburg.info>
Date: Mon, 23 Mar 2009 10:09:05 +0100
From: "re@nieuwburg.info" <re@nieuwburg.info>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] "Volume group 'system' not found"
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

I am LVM newbie.

At boot up I get the repeated message:

"Volume group 'system' not found"

I suspect that I need to restore group descriptor area, could that be 
right? If so, is there a way to restore without having backups of 
/etc/lvmconf available?
