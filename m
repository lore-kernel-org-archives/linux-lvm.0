Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i2KHmSj10066
	for <linux-lvm@redhat.com>; Sat, 20 Mar 2004 12:48:28 -0500
Received: from jogback.se (mail.jogback.se [192.165.82.16])
	by mx1.redhat.com (8.12.10/8.12.10) with SMTP id i2KHmQWA009492
	for <linux-lvm@redhat.com>; Sat, 20 Mar 2004 12:48:27 -0500
Date: Sat, 20 Mar 2004 18:48:17 +0100
Message-Id: <a87711be70ff4540a7d61c051308528b@mail.jogback.se>
MIME-Version: 1.0
From: "Lars Michael Jogback" <lm@swip.net>
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] How does PE-size,
	RAID chunk-size and FS block-size affect eachother?
Reply-To: "lm@swip.net" <lm@swip.net>,
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
To: "linux-lvm@redhat.com" <linux-lvm@redhat.com>, "linux-raid@vger.kernel.org" <linux-raid@vger.kernel.org>

Hello,

I intend to run LVM on top on a software RAID5 on top of
8 IDE-disks (with 2MB cache) on 4 IDE-controllers (yes, I
know it's not a reliable...)

Kernel 2.4.25 is used.

I'm going to use ReiserFS as filesystem, which uses a block
size of 4k.

If I've understand this correctly I'll need to use a PE-size of
at least 32MB to be able to support LVs up to 2TB.

How do I calculate the most optimal chunk-size on this system?

Thanks in advance,
/LM
