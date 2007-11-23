Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id lANLa5sp014217
	for <linux-lvm@redhat.com>; Fri, 23 Nov 2007 16:36:05 -0500
Received: from scan.5ninesdata.com (scan.5ninesdata.com [208.66.134.12])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id lANLZWDs010138
	for <linux-lvm@redhat.com>; Fri, 23 Nov 2007 16:35:32 -0500
Received: from 5ninesdata.com (unknown [208.66.134.10])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by scan.5ninesdata.com (Spam Firewall) with ESMTP id BA2F610DAAC
	for <linux-lvm@redhat.com>; Fri, 23 Nov 2007 15:35:29 -0600 (CST)
Message-ID: <47474790.9010009@stthomasepc.org>
Date: Fri, 23 Nov 2007 16:35:12 -0500
From: Tod <tod@stthomasepc.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Renaming Loopback 'Mounted' Volume Group 
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@redhat.com

Please take a look at this old thread first ...

http://linux.derkeiler.com/Mailing-Lists/Fedora/2007-02/msg02237.html


This was back in February and I'm just now trying to get back into 
recovery mode.  I've mounted the image like so:

/sbin/losetup /dev/loop0 ./recover.img
/sbin/kpartx -lv /dev/loop0
/sbin/kpartx -av /dev/loop0

This gives me /dev/mapper/loop0p1, and /dev/mapper/loop0p2 which seem to 
  be my original boot drive and VolGroup00.  When I do an lvscan I get:

WARNING: Duplicate VG name VolGroup00: Existing 
Vmi02d-0hr7-7NVb-vYZi-1fbD-E9n5-ixWu0a (created here) takes precedence 
over D7avZX-pVCb-ibTN-tyvs-7Q62-rzR9-tquBi9

Presumably the latter is the UUID of the volume group on my disk image.

Is there a way that I can now rename this original volume group so it 
doesn't conflict with my currently mounted one so I can start the data 
recovery process?  I tried vgrename, which I thought could use UUID's as 
input, but that didn't work.  Any ideas?


FC6
lvm2-2.02.17-1.fc6


Thanks - Tod
