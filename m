Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i2LL1Sj16115
	for <linux-lvm@redhat.com>; Sun, 21 Mar 2004 16:01:28 -0500
Received: from solwarra.gbrmpa.gov.au (solwarra.gbrmpa.gov.au [146.116.1.5])
	by mx1.redhat.com (8.12.10/8.12.10) with SMTP id i2LL1PWA010855
	for <linux-lvm@redhat.com>; Sun, 21 Mar 2004 16:01:27 -0500
Received: from gbrmpa.gov.au (pandemonium.gbrmpa.gov.au [146.116.2.0])
	by solwarra.gbrmpa.gov.au (8.11.6+Sun/8.10.2) with ESMTP id
	i2LKuwf26905
	for <linux-lvm@redhat.com>; Mon, 22 Mar 2004 06:56:58 +1000 (EST)
Message-ID: <405E029E.6070405@gbrmpa.gov.au>
Date: Mon, 22 Mar 2004 07:01:18 +1000
From: Glen Harris <glen@gbrmpa.gov.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] How do I pvresize?
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@redhat.com

We started running out of space on our backup server, so I bought a
couple of new 250Gb disks, added them to the 16 bay FC RAID array
and expanded the RAID, followed by the slice.

I then went to expand the PV, and got a "Command not implemented yet."
message.

This is a problem. This is a *BIG* problem.

What are my options, short of destroying the volume and starting
from scratch?
