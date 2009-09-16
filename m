Received: from mx1.redhat.com (ext-mx03.extmail.prod.ext.phx2.redhat.com
	[10.5.110.7])
	by int-mx08.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id n8GIKJTI018511
	for <linux-lvm@redhat.com>; Wed, 16 Sep 2009 14:20:19 -0400
Received: from e35.co.us.ibm.com (e35.co.us.ibm.com [32.97.110.153])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n8GIK66q013313
	for <linux-lvm@redhat.com>; Wed, 16 Sep 2009 14:20:06 -0400
Received: from d03relay04.boulder.ibm.com (d03relay04.boulder.ibm.com
	[9.17.195.106])
	by e35.co.us.ibm.com (8.14.3/8.13.1) with ESMTP id n8GIA9qb000904
	for <linux-lvm@redhat.com>; Wed, 16 Sep 2009 12:10:09 -0600
Received: from d03av04.boulder.ibm.com (d03av04.boulder.ibm.com [9.17.195.170])
	by d03relay04.boulder.ibm.com (8.13.8/8.13.8/NCO v10.0) with ESMTP id
	n8GIJmtW116268
	for <linux-lvm@redhat.com>; Wed, 16 Sep 2009 12:19:52 -0600
Received: from d03av04.boulder.ibm.com (loopback [127.0.0.1])
	by d03av04.boulder.ibm.com (8.12.11.20060308/8.13.3) with ESMTP id
	n8GIJmrb015315
	for <linux-lvm@redhat.com>; Wed, 16 Sep 2009 12:19:48 -0600
Received: from malahal.localdomain (malahal.beaverton.ibm.com [9.47.17.130])
	by d03av04.boulder.ibm.com (8.12.11.20060308/8.12.11) with ESMTP id
	n8GIJmZV015294
	for <linux-lvm@redhat.com>; Wed, 16 Sep 2009 12:19:48 -0600
Date: Wed, 16 Sep 2009 11:19:47 -0700
From: malahal@us.ibm.com
Subject: Re: [linux-lvm] Using LVM Mirroring to obtain a usable backup
Message-ID: <20090916181947.GB15438@us.ibm.com>
References: <1253109566.5326.15.camel@delo.gdit>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1253109566.5326.15.camel@delo.gdit>
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
To: linux-lvm@redhat.com

Ambrogio De Lorenzo [ambrogio.de.lorenzo@alice.it] wrote:
> Hi all.
> I'm doing a big upgrade on my computer and I tryed to use lv mirroring
> to obtain a copy of my data before to do it.
> 
> As I do with LVM on other OS i thought that after mirroring one could
> chose to split the mirrored lv.
> 
> I can't find how to do it with LVM2 on Linux.

snapshot may be a good fit in this case, but if you insist you can use
lvconvert to convert your linear volume to a mirrored volume. Once the
sync is complete, you can use the same lvconvert to convert the mirror
volume to a linear one.

Thanks, Malahal.
