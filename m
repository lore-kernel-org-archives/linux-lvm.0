Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id mBGC1g9m013906
	for <linux-lvm@redhat.com>; Tue, 16 Dec 2008 07:01:42 -0500
Received: from mx03.syneticon.net (mx03.syneticon.net [87.79.32.166])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id mBGC1V3a031376
	for <linux-lvm@redhat.com>; Tue, 16 Dec 2008 07:01:31 -0500
Message-ID: <49479897.1080500@wpkg.org>
Date: Tue, 16 Dec 2008 13:01:27 +0100
From: Tomasz Chmielewski <mangoo@wpkg.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] can I freeze I/O for some time to a given disk / md /
	dm device?
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
To: Linux IDE <linux-ide@vger.kernel.org>, Linux-Raid <linux-raid@vger.kernel.org>, LVM general discussion and development <linux-lvm@redhat.com>

Is it possible to "freeze I/O" for some time to a given disk / md / dm 
device?

Say, "freeze I/O" so that userspace waits for any response for 30, 60 
seconds or more?

If not, is it possible to reset a link repeatedly, like ATA does when it 
hits certain disk problems? I.e., can I do the below manually?

ata4.00: exception Emask 0x0 SAct 0x0 SErr 0x0 action 0x2 frozen
ata4.00: cmd 25/00:08:b8:c2:78/00:00:21:00:00/e0 tag 0 dma 4096 in
          res 40/00:00:bb:c2:78/40:00:21:00:00/e0 Emask 0x4 (timeout)
ata4.00: status: { DRDY }
ata4: hard resetting link


I need this to trace a problem with a userspace application which 
segfaults when ATA resets the link repeatedly (i.e. one broken drive in 
a RAID array).


-- 
Tomasz Chmielewski
http://wpkg.org
