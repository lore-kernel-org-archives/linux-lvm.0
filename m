Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m056cDlT010884
	for <linux-lvm@redhat.com>; Sat, 5 Jan 2008 01:38:14 -0500
Received: from fmailhost05.isp.att.net (fmailhost05.isp.att.net
	[207.115.11.55])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id m056bheo014239
	for <linux-lvm@redhat.com>; Sat, 5 Jan 2008 01:37:43 -0500
Received: from localhost (mail.bdmcc-us.com [192.168.1.133])
	by bdmcc-us.com (Postfix) with ESMTP id 5DC9717FAA2
	for <linux-lvm@redhat.com>; Sat,  5 Jan 2008 01:37:37 -0500 (EST)
Received: from bdmcc-us.com ([127.0.0.1])
	by localhost (mail.bdmcc-us.com [127.0.0.1]) (amavisd-maia, port 10024)
	with LMTP id 19238-01-2 for <linux-lvm@redhat.com>;
	Sat,  5 Jan 2008 01:37:36 -0500 (EST)
Date: Sat, 5 Jan 2008 01:37:36 -0500
From: Brian McCullough <bdmc@bdmcc-us.com>
Subject: Re: [LINUX-LVM] shrinking a volume inside an LVM
Message-ID: <20080105063736.GB19245@bdmcc-us.com>
References: <Pine.LNX.4.44.0801041556120.5886-100000@bmsred.bmsi.com>
	<F61B3F3722111146AF452DF29FDCCF5F038D1BDA@xchg03.bolivar.k12.mo.us>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <F61B3F3722111146AF452DF29FDCCF5F038D1BDA@xchg03.bolivar.k12.mo.us>
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

On Fri, Jan 04, 2008 at 03:58:43PM -0600, Kemp, Levi wrote:
> Ok I understand. Is there anything I need to do to the volume to prep it first, as in defragment it or something similar? I'm unsure as to how the ext2/3 file systems work with data, so I didn't know if it needed to be moved before shrinking the file system, then shrinking the LV, then exanding the file system to fill the LV, leaving room in the LVM to create another LV with whatever file system I want correct? Doesn't sound as complicated now. Thanks.

As long as the "/" volume isn't actually "Live," this can be done "in
place."   ( don't you love quotation marks? )

The "e2fsck" does a form of defragment as a side effect of "cleaning up"
the filesystem.


Brian
