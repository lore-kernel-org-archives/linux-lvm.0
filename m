Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n278lhMS001888
	for <linux-lvm@redhat.com>; Sat, 7 Mar 2009 03:47:43 -0500
Received: from ciao.gmane.org (main.gmane.org [80.91.229.2])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n278lOfx025167
	for <linux-lvm@redhat.com>; Sat, 7 Mar 2009 03:47:25 -0500
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1LfsBj-0004fJ-7D
	for linux-lvm@redhat.com; Sat, 07 Mar 2009 08:47:19 +0000
Received: from 122.172.156.217 ([122.172.156.217])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-lvm@redhat.com>; Sat, 07 Mar 2009 08:47:19 +0000
Received: from rrs by 122.172.156.217 with local (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-lvm@redhat.com>; Sat, 07 Mar 2009 08:47:19 +0000
From: Ritesh Raj Sarraf <rrs@researchut.com>
Date: Sat, 07 Mar 2009 13:34:22 +0530
Message-ID: <ldm986-uh3.ln1@news.researchut.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Sender: news <news@ger.gmane.org>
Subject: [linux-lvm] Block Diff Utility
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
To: linux-lvm@redhat.com

Hi,

LVM Snapshots stands as a very good tool for backup and recovery.
I have my root on an LV. To have a backup, I just need to create a snapshot 
of my root LV and then dd the snapshot image.

Works perfect. Infact I have been able to restore the root LV to a different 
machine without any issues.

I was just wondering if there are block diff utilities. Because currently, I 
can't see a way to take incremental snapshots.


Ritesh
-- 
If possible, Please CC me when replying. I'm not subscribed to the list.
