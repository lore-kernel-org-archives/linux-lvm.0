Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j4DEuLO23709
	for <linux-lvm@redhat.com>; Fri, 13 May 2005 10:56:24 -0400
Received: from amiindia.co.in (illchn-static-203.199.198.234.vsnl.net.in
	[203.199.198.234] (may be forged))
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id j4DEuB9p005967
	for <linux-lvm@redhat.com>; Fri, 13 May 2005 10:56:13 -0400
Received: from johnpaul ([10.0.0.131]) (authenticated bits=0)
	by amiindia.co.in (8.12.10/8.12.11) with ESMTP id j4DEa0Ed022875
	for <linux-lvm@redhat.com>; Fri, 13 May 2005 20:06:00 +0530
Message-ID: <01dc01c557cf$4b3023a0$8300000a@johnpaul>
From: "johnpaul" <johnpaulmp@amiindia.co.in>
Date: Fri, 13 May 2005 20:50:27 +0530
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Mounting a dev with indexed hashing support
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

Hi all

    I created a logical Volume and tried to format it with ext2 filesystem.
When I tried to mount it using -o index option for enabling hash-indexing
support it failed saying unsupported option. I tried both in 2.4 and 2.6
kernels. Do we need to enable any support in the kernel for this.

    This may seem unusual in this list . But please give me some pointers
where to look in to.

Thanks
John
