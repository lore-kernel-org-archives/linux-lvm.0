Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i9QLWEr23431
	for <linux-lvm@redhat.com>; Tue, 26 Oct 2004 17:32:14 -0400
Received: from mail-fs.sunrise.ch (mta-fs-be-01.sunrise.ch [194.158.229.16])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id i9QLW8FC014049
	for <linux-lvm@redhat.com>; Tue, 26 Oct 2004 17:32:08 -0400
Message-ID: <417EC31A.7030102@freesurf.ch>
Date: Tue, 26 Oct 2004 23:35:22 +0200
From: Maurizio Teruzzi <maurizio.teruzzi@freesurf.ch>
MIME-Version: 1.0
References: <417EBD09.7090606@freesurf.ch>
In-Reply-To: <417EBD09.7090606@freesurf.ch>
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] VGDA in kernel are not consistent with lvmtab
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@redhat.com

Maurizio Teruzzi ha scritto:

> What can I do to correct this? LVM 1.0.3 , if work I will update to a 
> new version like LVM 2!

Little history:
- yesterday (mess) I decide to rename my actual Volume00 to rootvg, i 
use vgrename succesfully, I edit fstab, mtab,grub.conf,lvmtab manually 
to reflect this change. After reboot my server stop working with KERNEL 
PANIC!
After do this I decide to go back, I booted with a rescue CD and I 
restore the copy of each modified file (I made previous a copy .bak).
Now, I'm in this situation... normal boot. When I try to boot with 
rescue CD and run vgscan I receive: VGDA in kernel are not consistent 
with lvmtab, and lvmtab can't be mofified, it's on a read-only FS.

Please help me GUYS.

Saluti
Maurizio

>
> ------------------------------------------------------------------------
>
