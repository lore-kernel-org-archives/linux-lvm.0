Received: from mx1.redhat.com (ext-mx02.extmail.prod.ext.phx2.redhat.com
	[10.5.110.6])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id oB1EDBeY014935
	for <linux-lvm@redhat.com>; Wed, 1 Dec 2010 09:13:12 -0500
Received: from mail09.linbit.com (mail09.linbit.com [212.69.161.110])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id oB1ECxgm021853
	for <linux-lvm@redhat.com>; Wed, 1 Dec 2010 09:13:00 -0500
Received: from soda.linbit (unknown [10.9.9.55])
	by mail09.linbit.com (LINBIT Mail Daemon) with ESMTP id 5202510587C1
	for <linux-lvm@redhat.com>; Wed,  1 Dec 2010 15:12:59 +0100 (CET)
Date: Wed, 1 Dec 2010 15:12:59 +0100
From: Lars Ellenberg <lars.ellenberg@linbit.com>
Message-ID: <20101201141259.GA17090@barkeeper1-xen.linbit>
References: <id4tfc$81m$1@dough.gmane.org> <id56v8$fc4$1@dough.gmane.org>
	<id5ji7$b6h$1@dough.gmane.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <id5ji7$b6h$1@dough.gmane.org>
Subject: Re: [linux-lvm] [SOLVED]: lvm2 and partition shringkin:
 superblock/filesystem size mismatch
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
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

On Wed, Dec 01, 2010 at 02:45:42PM +0100, Johannes Graumann wrote:
> And yes, by that I set the truncation of the FS (thanks, Lars for pointing 
> that out) in stone ...

Soo... did the fsck you ran immediately after the mke2fs -S complain,
or did you get away with no more than a fright?

	Lars
