Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i1J0Cvi28432
	for <linux-lvm@redhat.com>; Wed, 18 Feb 2004 19:12:57 -0500
Received: from mail.osdl.org (fw.osdl.org [65.172.181.6])
	by mx1.redhat.com (8.11.6/8.11.6) with SMTP id i1J0Cub18279
	for <linux-lvm@redhat.com>; Wed, 18 Feb 2004 19:12:57 -0500
Received: from osdl.org (markw@ibm-b.pdx.osdl.net [172.20.1.51])
	by mail.osdl.org (8.11.6/8.11.6) with ESMTP id i1J0CmE14998
	for <linux-lvm@redhat.com>; Wed, 18 Feb 2004 16:12:49 -0800
Message-Id: <200402190012.i1J0CmE14998@mail.osdl.org>
From: markw@osdl.org
MIME-Version: 1.0
Subject: [linux-lvm] file corruption writing to lvm2 volume
Sender: linux-lvm-admin@redhat.com
Errors-To: linux-lvm-admin@redhat.com
Reply-To: linux-lvm@redhat.com
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Post: <mailto:linux-lvm@redhat.com>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm/>
Date: Wed Feb 18 19:12:00 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

I have a program that's writing data out to a file and it looks like my
files are not written out correctly onto an lvm2 volume, while they will
write out correctly to a non lvm2 partition.

I'm not seeing any errors on the console, so I'm not sure what to look
for.  Let me know what kind of data I can provide.

I'm running linux-2.6.2 on ia64.

-- 
Mark Wong - - markw@osdl.org
Open Source Development Lab Inc - A non-profit corporation
12725 SW Millikan Way - Suite 400 - Beaverton, OR 97005
(503) 626-2455 x 32 (office)
(503) 626-2436      (fax)
http://developer.osdl.org/markw/
