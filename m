Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j251Fwn05855
	for <linux-lvm@redhat.com>; Fri, 4 Mar 2005 20:15:58 -0500
Received: from wproxy.gmail.com (wproxy.gmail.com [64.233.184.202])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id j251FqJY008677
	for <linux-lvm@redhat.com>; Fri, 4 Mar 2005 20:15:52 -0500
Received: by wproxy.gmail.com with SMTP id 68so1002201wra
	for <linux-lvm@redhat.com>; Fri, 04 Mar 2005 17:15:47 -0800 (PST)
Message-ID: <87f94c3705030417156a2ea617@mail.gmail.com>
Date: Fri, 4 Mar 2005 20:15:39 -0500
From: Greg Freemyer <greg.freemyer@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] xfs and snapshots
Reply-To: Greg Freemyer <greg.freemyer@gmail.com>,
	LVM general discussion and development <linux-lvm@redhat.com>
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

Thanks to Nathan Scott, the new 2.6.11 kernel has a fix that should
allow xfs_freeze to be called prior to the creating a snapshot.

It is still not required, but it should no longer cause problems.

Greg
-- 
Greg Freemyer
