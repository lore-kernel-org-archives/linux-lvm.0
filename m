Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m153L8Jk022593
	for <linux-lvm@redhat.com>; Mon, 4 Feb 2008 22:21:08 -0500
Received: from rv-out-0910.google.com (rv-out-0910.google.com [209.85.198.186])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id m153KjAp017561
	for <linux-lvm@redhat.com>; Mon, 4 Feb 2008 22:20:46 -0500
Received: by rv-out-0910.google.com with SMTP id k15so1737302rvb.51
	for <linux-lvm@redhat.com>; Mon, 04 Feb 2008 19:20:40 -0800 (PST)
Message-ID: <a71bd89a0802041920x739ce54ay5fdfd4ac2e0594cc@mail.gmail.com>
Date: Mon, 4 Feb 2008 19:20:40 -0800
From: "Dan Kegel" <dank@kegel.com>
Sender: daniel.r.kegel@gmail.com
In-Reply-To: <a71bd89a0802041726v59539bcbq1075b21bdf2bf4c3@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <a71bd89a0802041726v59539bcbq1075b21bdf2bf4c3@mail.gmail.com>
Subject: [linux-lvm] Zumastor 0.6 released
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
To: LVM general discussion and development <linux-lvm@redhat.com>

[Only slightly offtopic.  Zumastor implements one of the
schemes proposed at
https://www.redhat.com/archives/dm-devel/2006-October/msg00034.html
to reduce the overhead of maintaining multiple snapshots.]

Zumastor 0.6 is now available from http://zumastor.org

This release adds support for offline resizing
and fixes a bug that could cause data loss.
(For developers, it also adds a way to run our
autobuilder tests before committing changes.)

The full list of fixed issues is available at our issue tracker via the ugly url
http://code.google.com/p/zumastor/issues/list?q=label%3ARelease6%20status%3AFixed&can=1

For those just tuning in, Zumastor is free software that
adds enterprise storage features (primarily improved
snapshots and remote replication) to Linux.

Zumastor's snapshots share space more effectively than
LVM snapshots, and it makes snapshots easily accessible
by users (e.g. via Samba's "Previous Versions" feature).

Zumastor's replication doesn't have to compute and send checksums
for each file, so it's much more efficent than rsync.

Please test Zumastor and give us your feedback so we can
improve it for the next release.

Enjoy!

The Zumastor Team
(Daniel Phillips, Jiaying Zhang, Drake Diedrich,Shapor Naghibzadeh,
Dan Kegel, Chris Smith, Will Nowak)
