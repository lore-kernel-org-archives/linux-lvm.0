Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.16])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id qBQEx3Oo015142
	for <linux-lvm@redhat.com>; Wed, 26 Dec 2012 09:59:03 -0500
Received: from mail-yh0-f47.google.com (mail-yh0-f47.google.com
	[209.85.213.47])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id qBQEx2SM026723
	for <linux-lvm@redhat.com>; Wed, 26 Dec 2012 09:59:02 -0500
Received: by mail-yh0-f47.google.com with SMTP id g23so1514225yhg.34
	for <linux-lvm@redhat.com>; Wed, 26 Dec 2012 06:59:02 -0800 (PST)
Message-ID: <50DB10B4.1000505@gmail.com>
Date: Wed, 26 Dec 2012 09:59:00 -0500
From: Phillip Susi <phillsusi@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] label sector and non 512 byte sectors
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>

The man page for pvcreate states that the label goes in the second
sector.  That means it SHOULD be at an offset of 4096 bytes when using
4096 byte sectors, but apparently it is still at an offset of 512 bytes.
 Bug?
