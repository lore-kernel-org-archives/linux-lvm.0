Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k8R538C3025012
	for <linux-lvm@redhat.com>; Wed, 27 Sep 2006 01:03:08 -0400
Received: from wx-out-0506.google.com (wx-out-0506.google.com [66.249.82.234])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k8R532qC031536
	for <linux-lvm@redhat.com>; Wed, 27 Sep 2006 01:03:02 -0400
Received: by wx-out-0506.google.com with SMTP id i30so173783wxd
	for <linux-lvm@redhat.com>; Tue, 26 Sep 2006 22:03:02 -0700 (PDT)
Message-ID: <625ccb870609262203m400d149ax47ef5396dd96236@mail.gmail.com>
Date: Wed, 27 Sep 2006 13:03:02 +0800
From: "bowen zheng" <linuzboy@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Subject: [linux-lvm] Help, lvm2 snapshot and XFS ,
	using xfs_freeze to do this, but then lvcreate hang.
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

Help, lvm2 snapshot and XFS , using xfs_freeze to do this, but then
lvcreate hang.

I use lvm2 and xfs both.  If I do not use xfs_freeze before, I can use
lvcreate snapshot the lv. And it work fine for some static files or
lv, but not for running system such as / (root) which will generate a
log of I/O error.

So I heard that xfs should run xfs_freeze before create snapshot.
However, after xfs_freeze -f, then lvcreate hang all the time. And I
still can not kill (-9) the lvcreate process.

Anyone know what can I do now ???
And how to use snapshot under xfs,  is this a xfs or lvm bug ???
