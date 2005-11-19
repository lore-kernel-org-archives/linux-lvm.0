Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id jAJ9vAV01985
	for <linux-lvm@redhat.com>; Sat, 19 Nov 2005 04:57:10 -0500
Received: from xproxy.gmail.com (xproxy.gmail.com [66.249.82.196])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id jAJ9v4cV019718
	for <linux-lvm@redhat.com>; Sat, 19 Nov 2005 04:57:04 -0500
Received: by xproxy.gmail.com with SMTP id t11so341850wxc
	for <linux-lvm@redhat.com>; Sat, 19 Nov 2005 01:57:04 -0800 (PST)
Message-ID: <539807300511190157j5699c837r@mail.gmail.com>
Date: Sat, 19 Nov 2005 17:57:04 +0800
From: Lee Rocky <rocky366@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] about snapshot performance
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

I found some reference that discuss about LVM1 volume with snapshot performance

https://www.redhat.com/archives/linux-lvm/2003-January/msg00173.html
https://www.redhat.com/archives/linux-lvm/2003-January/msg00239.html

and I follow the steps with my LVM2

command
"sync ; time dd if=/dev/zero of=filename bs=1024k count=2000"
the result is
dd write on LV without snapshots = 150MB/s
dd write on LV with 1 snapshots = 4.42 MB/s

I got very slow write performace.
but read has no problem.
is this result work as expected?

KERNEL 2.6.13
LVM2 = 2.01.15
Library : 1.01.05
Driver version: 4.4.0
