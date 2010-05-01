Received: from mx1.redhat.com (ext-mx08.extmail.prod.ext.phx2.redhat.com
	[10.5.110.12])
	by int-mx04.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o41MJiuC003194
	for <linux-lvm@redhat.com>; Sat, 1 May 2010 18:19:44 -0400
Received: from cdptpa-omtalb.mail.rr.com (cdptpa-omtalb.mail.rr.com
	[75.180.132.121])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o41MJXEw027132
	for <linux-lvm@redhat.com>; Sat, 1 May 2010 18:19:33 -0400
From: Phillip Susi <psusi@cfl.rr.com>
In-Reply-To: <loom.20100501T152029-422@post.gmane.org>
References: <loom.20100429T185325-182@post.gmane.org>
	<loom.20100501T152029-422@post.gmane.org>
Date: Sat, 01 May 2010 18:19:23 -0400
Message-ID: <1272752363.10234.15.camel@faldara>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] will pvmove'ing (an LV at a time) defragment?
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
To: LVM general discussion and development <linux-lvm@redhat.com>

On Sat, 2010-05-01 at 13:26 +0000, Brian J. Murrell wrote:
> That said, it is quite easy to move portions of an LV, so hooking pvmove into
> a disk defragmentation algorithm shouldn't be difficult, if one can find a good 
> defragmentation algorithm.

There isn't really any need; having an lv split in 2 or 3 parts isn't
going to cause any slowdown you can notice outside of a synthetic
sequential access benchmark.
