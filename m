Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i9UHANr17509
	for <linux-lvm@redhat.com>; Sat, 30 Oct 2004 13:10:23 -0400
Received: from server.echohome.org (s233-64-29-217.try.wideopenwest.com
	[64.233.217.29])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id i9UHALjv025286
	for <linux-lvm@redhat.com>; Sat, 30 Oct 2004 13:10:22 -0400
Received: from echo (echo.echohome.org [192.168.2.254])
	by server.echohome.org (8.12.8/8.12.8) with ESMTP id i9UHAFdJ026984
	for <linux-lvm@redhat.com>; Sat, 30 Oct 2004 13:10:16 -0400
From: "Erik Ohrnberger" <erik@echohome.org>
Date: Sat, 30 Oct 2004 13:10:16 -0400
Message-ID: <!~!UENERkVCMDkAAQACAAAAAAAAAAAAAAAAABgAAAAAAAAA1z/y+RiMjUG0rnE3+S6yhMKAAAAQAAAAARcWfxONAkOX0PepViSR7AEAAAAA@echohome.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <41814060.4040400@mikebabcock.ca>
Subject: [linux-lvm] What is the best way to configure LVM + RAID?
Reply-To: Erik@echohome.org,
	LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: 'LVM general discussion and development' <linux-lvm@redhat.com>

OK, so like what is the best way to configure multiple inconsistently sized
disks into a RAID5 LVM?  Will you still be able to resize the array by
adding and dropping disks?

Just wanting to know.

Thanks,
	Erik.
