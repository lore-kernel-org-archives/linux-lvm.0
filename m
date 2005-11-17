Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id jAHGB0V21390
	for <linux-lvm@redhat.com>; Thu, 17 Nov 2005 11:11:00 -0500
Received: from xproxy.gmail.com (xproxy.gmail.com [66.249.82.192])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id jAHGAnGT012272
	for <linux-lvm@redhat.com>; Thu, 17 Nov 2005 11:10:55 -0500
Received: by xproxy.gmail.com with SMTP id h28so3971103wxd
	for <linux-lvm@redhat.com>; Thu, 17 Nov 2005 08:10:44 -0800 (PST)
Message-ID: <1d219a6f0511170810g7dda5266j830bf5d2d22e1313@mail.gmail.com>
Date: Thu, 17 Nov 2005 11:10:44 -0500
From: Chris Hoover <revoohc@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] Not allowed to fill filesystem to 100%???
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

Question,

We have created some 300 GB lvm2 (RH 4.0 AS)  filesystems for our
PostgreSQL databases.  However, we tried to copy one of the larger
filesystems over to the new lvm filesystem and the copy abended due to
being.  The system was reporting that the file system was 100% full
with 0 blocks free.  However, a df reported almost 16GB free.

What's up with this?  Why is this large amount of space unavailable to
a normal user?

Thanks,

chris
