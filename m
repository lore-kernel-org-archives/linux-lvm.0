Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i62Ng1012488
	for <linux-lvm@redhat.com>; Fri, 2 Jul 2004 19:42:01 -0400
Received: from chaos.ao.net (root@chaos.ao.net [208.5.40.6])
	by mx3.redhat.com (8.12.10/8.12.10) with ESMTP id i62NftXn022562
	for <linux-lvm@redhat.com>; Fri, 2 Jul 2004 19:41:56 -0400
Received: from chaos.ao.net (harik@localhost [127.0.0.1])
	by chaos.ao.net (8.12.9/8.12.9/Debian-5) with ESMTP id i62NfsuE025228
	for <linux-lvm@redhat.com>; Fri, 2 Jul 2004 19:41:54 -0400
Received: (from harik@localhost)
	by chaos.ao.net (8.12.9/8.12.9/Debian-5) id i62NfsbF025227
	for linux-lvm@redhat.com; Fri, 2 Jul 2004 19:41:54 -0400
Date: Fri, 2 Jul 2004 19:41:54 -0400
From: Dan Merillat <dmerillat@sequiam.com>
Subject: Re: [linux-lvm] pvmove - Can't expand LV: Mirror support missing
	fromkernel?
Message-ID: <20040702234154.GB1506@chaos.ao.net>
References: <1088690081.4221.6.camel@freya>
	<001b01c46081$399cc6c0$0201a8c0@fosi>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <001b01c46081$399cc6c0$0201a8c0@fosi>
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
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Sat, 03 Jul 2004, Steve Wray wrote:

> I strongly doubt that you'll get any help out of the list on this,
> but if someone does send you a fix which works, off-list, *please*
> send it to me too; I have two failing disks which I need to decommission.

stock 2.6 dosn't have many dm-targets in it.  Pick up the LVM patches
off the website and apply them for the more "experimental" things like
mirroring.

--Dan
