Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id iBV4NXr05231
	for <linux-lvm@redhat.com>; Thu, 30 Dec 2004 23:23:33 -0500
Received: from rproxy.gmail.com (rproxy.gmail.com [64.233.170.197])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id iBV4NNV1017919
	for <linux-lvm@redhat.com>; Thu, 30 Dec 2004 23:23:28 -0500
Received: by rproxy.gmail.com with SMTP id 1so321877rny
	for <linux-lvm@redhat.com>; Thu, 30 Dec 2004 20:23:22 -0800 (PST)
Message-ID: <e5146c2a04123020236f018fdb@mail.gmail.com>
Date: Thu, 30 Dec 2004 23:23:22 -0500
From: Sasha Z <kleptophobiac@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Rebuilding physical volume metadata
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

I have a severe problem.

I had a healthly LVM four days ago, but came home to an LVM that no
longer had an PV's, and a computer without an PV's listed.

So I had to recreate the physical volumes, and that went ok. When I
recreated the volume group, I found that it thought all the PV's were
completely empty. Of course this cannot be true. Nothing I did took
any time at all, zeroing 700GB's of disk would take a very very long
time. I didn't delete any partitions, and so I figure the "maps" or
metadata stored on each drive has been deleted somehow.

Is there a way to regenerate these maps using raw sector data? I know
my data is there, just getting LVM2 to allow access to it is the
problem.

- Sasha Z.
