Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i8RGkkr11678
	for <linux-lvm@redhat.com>; Mon, 27 Sep 2004 12:46:46 -0400
Received: from mercury.jnjid.com (mercury.jnjid.com [66.152.80.82])
	by mx1.redhat.com (8.12.11/8.12.10) with ESMTP id i8RGkidh015554
	for <linux-lvm@redhat.com>; Mon, 27 Sep 2004 12:46:45 -0400
Message-ID: <1700.130.238.5.5.1096303602.squirrel@130.238.5.5>
Date: Mon, 27 Sep 2004 18:46:42 +0200 (CEST)
From: "Janis Vinnsberg" <lpc@unsocial.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] Replacing dead pv with slightly smaller disk
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
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
To: linux-lvm@redhat.com

I have a large VG with one giant LV on, a week or two ago one PV died a horrible and hopefully painful death.
I've managed to find a replacement disk for it, the problem is that today I realised it is a measly 21MB smaller than the original disk.
Is there any way I can use thisk disk, or do I have to go hunting for a larger one?

Are there any other options (no I cannot do the loop-trick to access the data, I dont have 500GB of disks to rescue the data to). Is there
someway I can remove the dead PV from the LV. I've been digging through the archives but haven't found any help there.

I'm using debian stable with:
Logical Volume Manager 1.0.4

Regards Janis
