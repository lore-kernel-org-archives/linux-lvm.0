Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i1GKPbi17899
	for <linux-lvm@redhat.com>; Mon, 16 Feb 2004 15:25:37 -0500
Received: from ip66-106-138-51.z138-106-66.customer.algx.net (ip66-106-138-51.z138-106-66.customer.algx.net [66.106.138.51])
	by mx1.redhat.com (8.11.6/8.11.6) with SMTP id i1GKPbb16265
	for <linux-lvm@redhat.com>; Mon, 16 Feb 2004 15:25:37 -0500
Received: from [192.168.1.126] (rich [192.168.1.126])
	by ip66-106-138-51.z138-106-66.customer.algx.net (Postfix) with ESMTP id AB05B11804
	for <linux-lvm@redhat.com>; Mon, 16 Feb 2004 12:25:30 -0800 (PST)
From: Rich Turner <rich@storix.com>
Message-Id: <1076963130.2404.54.camel@rich>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] snapshot status
Sender: linux-lvm-admin@redhat.com
Errors-To: linux-lvm-admin@redhat.com
Reply-To: linux-lvm@redhat.com
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Post: <mailto:linux-lvm@redhat.com>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm/>
Date: Mon Feb 16 15:24:09 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@redhat.com

i need to watch the status of my snapshot to prevent it from filling up.
with Logical Volume Manager 1.0.3 i was able to display this information
with the "lvdisplay" command by looking at the "allocated to snapshot"
line and then extending the snapshot if it needed to be larger.

now with lvm2 1.95.10 (2002-05-31), the "lvdisplay" command does not
have that information.

is there another lvm command i can use to watch the status of my
snapshot?
