Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k5J6XtYH003086
	for <linux-lvm@redhat.com>; Mon, 19 Jun 2006 02:33:55 -0400
Received: from mail.keya.com.tw (keya.com.tw [210.58.182.2])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k5J6XpXo015280
	for <linux-lvm@redhat.com>; Mon, 19 Jun 2006 02:33:51 -0400
Received: from snow.keya.com.tw (snow [192.168.0.9])
	by mail.keya.com.tw (Postfix) with ESMTP id 7C3B91A8042
	for <linux-lvm@redhat.com>; Mon, 19 Jun 2006 14:33:40 +0800 (CST)
Date: Mon, 19 Jun 2006 14:33:40 +0800
From: Charles Jie <chjie@keya.com.tw>
Message-ID: <20060619063340.GA1759@snow.keya.com.tw>
Mime-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] Why snapshots are designed as independent of each other?
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
Content-Type: text/plain; charset="utf-8"
To: linux-lvm@redhat.com

Hi,

(With Mandriva 2006.0 and lvm2-2.01.09-1mdk)

In my recent evaluation, I found that lvm2 snapshots made on the same
original volume will all be updated the same amount of data when we make
change to the original volume.

That means they are made completely independent of each other, only
dependent on the original volume. Such design would cause serious
performance impact if we increase the number of snapshots of a volume
for the purpose of backup.

    e.g. If we create one snapshot every hour and remove the old
    snapshots reaching 24-hour old, we'll keep about 24 snapshots and
    every write to the original volume will make 24 copies to the
    snapshots before the write. It would be a big burden to the use of
    the original volume.

Could anybody tell me why it's designed this way?

* My thinking:

    . A reasonable design should be that a snapshot depends on one
      another according to their creation time. The COW work would
      reduce to mininum, only once for the whole related snapshots set
      based on the same original volume.

    . Deleting any snapshot among the set is still very simple and
      efficient - move its blocks to the next older snapshot (indeed,
      only move those blocks (identified by some ID) not existent in the
      destination snapshot, drop those blocks which exist.)

    . In such design, we don't need to reserve too much space for a big
      number of snapshots - they totally need only about the same space
      as the original volume.

    * Further, conventionally snapshot is called COW, copy-on-write. But
      in my point of view, it's inefficient if it's really implemented
      this way. It takes one read and two writes. With the spirit of
      the virtualization of logical volume management, making one write
      is enough (which is efficient). What we need to do is put the old
      block under the management of the newest snapshot, and make a new
      block (with new content) for the original volume.

I'm newbie to this mailing list. Please feel free to comment, whether
I'm right or wrong. Thanks.

best regards,
charlie

--
===============================================================
Charles Jie (紀春興)               Keya Technologies (開雅科技)
(O1) +886 2 8692 6060 ext 549      Skype: charles.jie
(O2) +886 2 2938 2262              (Mobile) 0968 357 746
===============================================================
