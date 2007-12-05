Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id lB58qDhh020901
	for <linux-lvm@redhat.com>; Wed, 5 Dec 2007 03:52:13 -0500
Received: from rv-out-0910.google.com (rv-out-0910.google.com [209.85.198.186])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id lB58ppK3001926
	for <linux-lvm@redhat.com>; Wed, 5 Dec 2007 03:51:51 -0500
Received: by rv-out-0910.google.com with SMTP id k15so3972423rvb
	for <linux-lvm@redhat.com>; Wed, 05 Dec 2007 00:51:50 -0800 (PST)
Message-ID: <a71bd89a0712050051t4dd722c9ycb5dbbe11ffe0acf@mail.gmail.com>
Date: Wed, 5 Dec 2007 00:51:50 -0800
From: "Dan Kegel" <dank@kegel.com>
Sender: daniel.r.kegel@gmail.com
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Subject: [linux-lvm] Improving performance with many snapshots
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

If you need to keep many snapshots mounted
(e.g. 24 hourly snapshots), you may have noticed
that it hurts write performance; see
http://marc.info/?l=dm-devel&m=116322666022667&w=2
for data.

We have some new code ready to test that should get around this problem.

If you have time to test some new stuff on non-production machines,
are running Ubuntu, Debian, or Gentoo (or like building from source),
don't mind installing patched kernels,
don't mind incomplete documentation,
and do like filing bug reports, please see
http://zumastor.org.   We have something you might like.

The rest of you, wait a few weeks, it's not ready for you yet :-)

Thanks...
- Dan
