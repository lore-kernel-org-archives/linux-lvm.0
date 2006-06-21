Received: from agk.surrey.redhat.com (agk.surrey.redhat.com [172.16.10.74])
	by pobox.surrey.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k5LFvn37020254
	for <linux-lvm@redhat.com>; Wed, 21 Jun 2006 16:57:49 +0100
Received: from agk by agk.surrey.redhat.com with local (Exim 4.34)
	id 1Ft55R-0002dc-NX
	for linux-lvm@redhat.com; Wed, 21 Jun 2006 16:57:49 +0100
Date: Wed, 21 Jun 2006 16:57:49 +0100
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] newbie lvm question
Message-ID: <20060621155749.GK19222@agk.surrey.redhat.com>
References: <44996028.20389.1201CC27@dermot.sciencephoto.co.uk>
	<44997218.19023.1247DEC3@dermot.sciencephoto.co.uk>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <44997218.19023.1247DEC3@dermot.sciencephoto.co.uk>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Wed, Jun 21, 2006 at 04:21:44PM +0100, Beginner wrote:
> # mkfs -t ext2 /dev/mapper/volgrp0-volume1
> mke2fs 1.37 (21-Mar-2005)
> Could not stat /dev/mapper/volgrp0-volume1 --- Permission denied
 
Assuming you ran that as 'root', check permissions and security
context (if selinux is enabled) using 'ls'.

(Also try 'vgmknodes'.)

Alasdair
-- 
agk@redhat.com
