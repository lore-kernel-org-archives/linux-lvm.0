Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j2AFvAn18640
	for <linux-lvm@redhat.com>; Thu, 10 Mar 2005 10:57:10 -0500
Received: from greebo.hisser.org (hermes.hisser.org [62.49.72.126])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j2AFv8nM014365
	for <linux-lvm@redhat.com>; Thu, 10 Mar 2005 10:57:08 -0500
Received: from localhost (localhost [127.0.0.1])
	by greebo.hisser.org (Postfix) with ESMTP id 4852B7115
	for <linux-lvm@redhat.com>; Thu, 10 Mar 2005 15:56:40 +0000 (GMT)
Received: from greebo.hisser.org ([127.0.0.1])
	by localhost (greebo [127.0.0.1]) (amavisd-new, port 10024) with ESMTP
	id 22238-12 for <linux-lvm@redhat.com>;
	Thu, 10 Mar 2005 15:56:39 +0000 (GMT)
Message-ID: <1110470199.42306e373e09e@web.hisser.org>
Date: Thu, 10 Mar 2005 15:56:39 +0000
From: jamesp@hisser.org
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] Filesystem Encapsulation
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

Hi All

I am running LVM on RHEL AS 3.0 (2.4.21 based kernel).

We have two filesystems like this:

Device     Size  Used  Avail
/dev/sda1  985G  604G  332G  65% /fs1
/dev/sdb1  591G   87G  474G  16% /fs2

They contain a number of ~2gig files that don't change once they are written -
they only get deleted after a certain amount of time.

I would like to use LVM to create a new VG containing /dev/sda1 and /dev/sdb1 as
PVs, to be able to present a single larger filesystem to the O/S. Now I realise
this is trivial if you don't mind data loss,or are able to copy the data off
the filesystems temporarily.

What I would "like" to do is copy everything from /fs2 to /fs1 so that /fs2 is
empty. I could then pvcreate /dev/sda1 and place it into a  brand new VG while
PRESERVING the data, then extend the VG by adding a new PV (/dev/sdb1). Then of
course the LV and FS could be extended.

The sort of thing I am talking about it like disk encapsulation on Veritas VM.
Is this possible at all with linux-lvm ? If not - any plans for the future?

Thanks!

James
