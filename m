Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i2B9DH818640
	for <linux-lvm@redhat.com>; Thu, 11 Mar 2004 04:13:17 -0500
Received: from grassmarket.ucs.ed.ac.uk (grassmarket.ucs.ed.ac.uk [129.215.166.64])
	by mx1.redhat.com (8.12.10/8.12.10) with SMTP id i2B9DG07001771
	for <linux-lvm@redhat.com>; Thu, 11 Mar 2004 04:13:16 -0500
Received: from aphrodite (18779905.resnet.ed.ac.uk [10.7.0.72])
	by grassmarket.ucs.ed.ac.uk (8.12.10/8.12.10) with ESMTP id i2B9D9PH022654
	for <linux-lvm@redhat.com>; Thu, 11 Mar 2004 09:13:15 GMT
From: "Rupert Hair" <rupert.hair@ntlworld.com>
Message-ID: <000101c40748$d1b5f860$1530a8c0@aphrodite>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] Some LVM 2 questions.
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
Date: Thu Mar 11 04:11:00 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@redhat.com

I have noticed that a friend's LVM 2 vgdisplay does not show a MAX LV Size
value.  Should I take this to mean that LVM 2 does not impose a MAX LV Size
or that it it so large that it will not be an isssue?

I currently have a LVM 1.0.8 system that is nearing its MAX LV Size.  I
would like to know if I can migrate it to LVM 2 so that I can expand beyond
my MAX LV Size?  

I have four drives containing one linear VG and one LV on top of that
formatted as ext3.  Can I set LVM (1 or 2) to make a backup of the file
allocation tables (I'm not sure if that's the right term) of my ext3 system
onto all my drives so that if the first disk in my LV died I would not loose
all my data (just what was contained on that disk).

Thanks,

Rupert
