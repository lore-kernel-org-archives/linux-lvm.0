Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id lB4Gxv4W027295
	for <linux-lvm@redhat.com>; Tue, 4 Dec 2007 11:59:58 -0500
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id lB4GxbgV021144
	for <linux-lvm@redhat.com>; Tue, 4 Dec 2007 11:59:37 -0500
Received: from bmsred.bmsi.com (bmsred.bmsi.com [192.168.9.50])
	by mail.bmsi.com (8.13.6/8.13.6) with ESMTP id lB4GxWd7008186
	for <linux-lvm@redhat.com>; Tue, 4 Dec 2007 11:59:32 -0500
Received: from localhost (localhost [127.0.0.1])
	by bmsred.bmsi.com (8.13.5/8.13.6) with ESMTP id lB4GxWOE009641
	for <linux-lvm@redhat.com>; Tue, 4 Dec 2007 11:59:32 -0500
Date: Tue, 4 Dec 2007 11:59:32 -0500 (EST)
From: "Stuart D. Gathman" <stuart@bmsi.com>
Message-ID: <Pine.LNX.4.44.0712041152000.9363-100000@bmsred.bmsi.com>
MIME-Version: 1.0
Subject: [linux-lvm] Remote mirroring
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

Using the same hooks that implement snapshots, it should be possible to 
have dirty chunks of a LV transmitted to a user process.
The user process could collect the updates, buffer them so 
that delays don't block bursts of activity, and transmit them to
a remote machine where they are written to a mirror LV.  The buffering
should be designed so that the stream can be interrupted at any time,
and the result should be the same as taking a snapshot at some point.
Startup should allow resyncing without transmitting the entire LV.  Perhaps
via rsync algorithm.  In the event of hardware failure at the master
location, the remote LV could be booted and run as a backup server.

-- 
	      Stuart D. Gathman <stuart@bmsi.com>
    Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.
