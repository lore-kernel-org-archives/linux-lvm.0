Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j2375iK29832
	for <linux-lvm@redhat.com>; Thu, 3 Mar 2005 02:05:44 -0500
Received: from rproxy.gmail.com (rproxy.gmail.com [64.233.170.205])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id j2375cIV002352
	for <linux-lvm@redhat.com>; Thu, 3 Mar 2005 02:05:39 -0500
Received: by rproxy.gmail.com with SMTP id 40so291763rnz
	for <linux-lvm@redhat.com>; Wed, 02 Mar 2005 23:05:38 -0800 (PST)
Message-ID: <e5146c2a050302230579216b77@mail.gmail.com>
Date: Thu, 3 Mar 2005 02:05:37 -0500
From: Sasha Z <kleptophobiac@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Can't mount logical volume - super block error
Reply-To: Sasha Z <kleptophobiac@gmail.com>,
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

I had a functioning lvm using four hard discs, but found it necessary
to rebuild my operating system. Since then, while the vg and lv come
online are read available, I can't actually mount the filesystem or do
anything with it. It says it cannot read the superblock at locations 2
and 16.

does anybody have any thoughts on this?

I've tried 2.00.25 and 2.00.33.
