Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j1M2YHK27806
	for <linux-lvm@redhat.com>; Mon, 21 Feb 2005 21:34:17 -0500
Received: from ciao.gmane.org (main.gmane.org [80.91.229.2])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j1M2YFrk003049
	for <linux-lvm@redhat.com>; Mon, 21 Feb 2005 21:34:16 -0500
Received: from root by ciao.gmane.org with local (Exim 4.43)
	id 1D3Poo-0002HC-Vt
	for linux-lvm@redhat.com; Tue, 22 Feb 2005 03:30:35 +0100
Received: from user-0c99n08.cable.mindspring.com ([24.148.220.8])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-lvm@redhat.com>; Tue, 22 Feb 2005 03:30:34 +0100
Received: from mark-d-1109063231.62cc61 by user-0c99n08.cable.mindspring.com
	with local (Gmexim 0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <linux-lvm@redhat.com>; Tue, 22 Feb 2005 03:30:34 +0100
From: Mark Horn <mark@hornclan.com>
Date: Tue, 22 Feb 2005 01:07:58 +0000 (UTC)
Message-ID: <slrnd1l1m0.s97.mark@home.hornclan.com>
References: <1109018274.4532.14.camel@rich> <1109019036l.14910l.1l@tangerine>
	<1109020966.4532.59.camel@rich>
Sender: news <news@sea.gmane.org>
Subject: [linux-lvm] Re: bootloader questions
Reply-To: mark-d-1109063231.62cc61@hornclan.com,
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

On 2005-02-21, rich turner <rich@storix.com> wrote:
> this is perhaps the wrong mailing list but is this the case with
> software raid as well? although, i believe the software raid must be
> raid level 1.

I personally have had great success with /boot being raid 1.  I have
had absolutely no success with /boot working as an LV using either
lilo or grub.

That being said, I'm never going to put / onto an LV again.  I had a
scare this weekend trying to recover all of my LV's without having a
reliable VG backup - which of course was stored on /.  I've moved /
onto raid1, and put /home, /var/log, and /var/www onto LV's.
