Received: from mx1.redhat.com (ext-mx16.extmail.prod.ext.phx2.redhat.com
	[10.5.110.21])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r4OIjT7x009576
	for <linux-lvm@redhat.com>; Fri, 24 May 2013 14:45:29 -0400
Received: from tropek.jajcus.net (tropek.jajcus.net [84.205.176.49])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r4OIjJb9032599
	for <linux-lvm@redhat.com>; Fri, 24 May 2013 14:45:22 -0400
Date: Fri, 24 May 2013 20:45:16 +0200
From: Jacek Konieczny <jajcus@jajcus.net>
Message-ID: <20130524204516.35a24798@lolek.nigdzie>
In-Reply-To: <knkd3m$5kr$1@ger.gmane.org>
References: <knkd3m$5kr$1@ger.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] snapshot an lvm disk containing ext4 partitions
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
Cc: alexis.pellicier@nds.k12.tr

On Thu, 23 May 2013 09:31:23 +0300
Alexis <alexis.pellicier@nds.k12.tr> wrote:
> Hello,
> 
> I was use to snapshot an LVM volume containing ext4 partitions for
> backup purpose. This is a disk for Xen DomU paravirtualized linux box.
> 
> With lvm-2.02.98 and kernel  3.4.11 from opensuse 12.2 the ext4
> partitions inside  the snapshot were clean.
> 
> Now I've upgraded to opensuse 12.3 (kernel 3.7.10 lvm-2.02.98)
> 
> Is lvm supposed to keep my inside ext4 partitions clean when
> snapshotting my volume? If not is theire any way of doing this?

Use read-write snapshots instead of read-only ones.

The first time you mount the snapshot (read-only mount is enough) 
the journal will get replayed and the stored file-system will become
clean.

Greets,
	Jacek
