Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id iB9Ms3r13111
	for <linux-lvm@redhat.com>; Thu, 9 Dec 2004 17:54:03 -0500
Received: from postfix4-2.free.fr (postfix4-2.free.fr [213.228.0.176])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id iB9MrqcP022829
	for <linux-lvm@redhat.com>; Thu, 9 Dec 2004 17:53:55 -0500
From: "EC" <wingman@waika9.com>
Subject: RE: [linux-lvm] EXT3-fs: INFO: recovery required on readonly
	filesystem ?
Date: Thu, 9 Dec 2004 23:54:36 +0100
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <20041208092847.3b840145.donald.murray@pason.com>
Message-Id: <20041209225350.1F9CE255805@postfix4-2.free.fr>
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
To: "'Donald Murray, P.Eng.'" <donald.murray@pason.com>
Cc: 'LVM general discussion and development' <linux-lvm@redhat.com>

>
>We were seeing entries like this in /var/log/messages in May of this year.
>It was not LVM related: I used lsof to see which files were open in the
>original logical volume. MySQL was keeping an inode for a rotated log
>file; once I added 'mysqladmin flush-logs' to logrotated, the problem
>went away.
>
>You should use lsof to see which files are open on your logical volume.
>Perhaps you are having a similar issue.

Tried with lsof, no files are open. I even tried with an empty volume to
backup. Same problem.

EC.
