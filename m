Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i9VHZGr23526
	for <linux-lvm@redhat.com>; Sun, 31 Oct 2004 12:35:16 -0500
Received: from main.gmane.org (main.gmane.org [80.91.229.2])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id i9VHZA2N024020
	for <linux-lvm@redhat.com>; Sun, 31 Oct 2004 12:35:10 -0500
Received: from list by main.gmane.org with local (Exim 3.35 #1 (Debian))
	id 1COJbh-000123-00
	for <linux-lvm@redhat.com>; Sun, 31 Oct 2004 18:35:09 +0100
Received: from triangulo.it.uc3m.es ([163.117.139.109])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-lvm@redhat.com>; Sun, 31 Oct 2004 18:35:09 +0100
Received: from ptb by triangulo.it.uc3m.es with local (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-lvm@redhat.com>; Sun, 31 Oct 2004 18:35:09 +0100
From: Peter T. Breuer <ptb@lab.it.uc3m.es>
Date: Sun, 31 Oct 2004 18:34:25 +0100
Message-ID: <1akf52-0m.ln1@triangulo.it.uc3m.es>
References: <41814060.4040400@mikebabcock.ca>
	<!~!UENERkVCMDkAAQACAAAAAAAAAAAAAAAAABgAAAAAAAAA1z/y+RiMjUG0rnE3+S6yhMKAAAAQAAAAARcWfxONAkOX0PepViSR7AEAAAAA@echohome.org>
Sender: news <news@sea.gmane.org>
Subject: [linux-lvm] Re: What is the best way to configure LVM + RAID?
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

Erik Ohrnberger <erik@echohome.org> wrote:
> OK, so like what is the best way to configure multiple inconsistently sized
> disks into a RAID5 LVM?  Will you still be able to resize the array by
> adding and dropping disks?

Well, you'll just have to make a raid5 of the minimum size (of any three
of your disks :), and do something else with the rest of the remaining
space.

Peter
