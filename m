Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n14D5s86007431
	for <linux-lvm@redhat.com>; Wed, 4 Feb 2009 08:05:54 -0500
Received: from rv-out-0506.google.com (rv-out-0506.google.com [209.85.198.228])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id n14D5cJi007981
	for <linux-lvm@redhat.com>; Wed, 4 Feb 2009 08:05:39 -0500
Received: by rv-out-0506.google.com with SMTP id f6so2908794rvb.51
	for <linux-lvm@redhat.com>; Wed, 04 Feb 2009 05:05:38 -0800 (PST)
MIME-Version: 1.0
Date: Wed, 4 Feb 2009 18:35:37 +0530
Message-ID: <a80c86b70902040505l257e8ab8k4bad5ac121520e3f@mail.gmail.com>
From: Prateek Donni <prateek.donni@gmail.com>
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Query regarding conversion of root partition to LV
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

I have a fedora 9 installation with two partitions swap and /
partition. Now i want to mirror the files on the root partition to
another disk using LVM mirroring. Since i dint make root on a LV and
have no allocated space left so i am thinking of using the free space
on the root partition as a block device that can be converted into PV
and then mirrored after making it a LV.
Is this feasible?
Can someone let me know wht can be done?

Thanks
Prateek
