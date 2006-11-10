Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id kAA9mSeA013667
	for <linux-lvm@redhat.com>; Fri, 10 Nov 2006 04:48:28 -0500
Received: from amsfep12-int.chello.nl (amsfep17-int.chello.nl [213.46.243.15])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id kAA9mPU8002684
	for <linux-lvm@redhat.com>; Fri, 10 Nov 2006 04:48:26 -0500
Received: from laguna.nwhq.nl ([24.132.125.161]) by amsfep12-int.chello.nl
	(InterMail vM.6.01.04.04 201-2131-118-104-20050224) with ESMTP
	id <20061110094819.QERA17906.amsfep12-int.chello.nl@laguna.nwhq.nl>
	for <linux-lvm@redhat.com>; Fri, 10 Nov 2006 10:48:19 +0100
Received: from laguna.nwhq.nl (laguna.nwhq.nl [127.0.0.1])
	by laguna.nwhq.nl (8.13.8/8.12.11) with ESMTP id kAA9mJrw015319
	for <linux-lvm@redhat.com>; Fri, 10 Nov 2006 10:48:19 +0100
From: "J.L. Blom" <jlblom@neuroweave.nl>
Date: Fri, 10 Nov 2006 10:48:19 +0100
Message-Id: <1163152099.2961.68.camel@laguna.nwhq.nl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] LVM groups not visible
Reply-To: jlblom@neuroweave.nl,
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

Hi,
I'm rather new to LVM and I have a - I think - simple question.
I have a removable disk (USB) with several volumegroups on it created
with one system (linux 2.6.18-1.2200.fc5). I wanted to use it to backup
from another system (linux 2.6.14-386: ubuntu) the W2000 partition.
WHen I connect the disk it is seen as usbdisk on /dev/sda1 and the
content is displayed.
However, lvdisplay says: " no volume groups found"
lvscan says: " no volume groups found"
pvscan says: " no matching physical volumes found"
But the content is visible in nautilus and I can write and read.
Hope somebody can clarify and help me.
Joep
