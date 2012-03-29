Received: from mx1.redhat.com (ext-mx16.extmail.prod.ext.phx2.redhat.com
	[10.5.110.21])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id q2T0RvxY017428
	for <linux-lvm@redhat.com>; Wed, 28 Mar 2012 20:27:57 -0400
Received: from www.bettercgi.com (www.bettercgi.com [74.122.122.24])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q2T0RuuN011014
	for <linux-lvm@redhat.com>; Wed, 28 Mar 2012 20:27:56 -0400
Date: Wed, 28 Mar 2012 19:27:52 -0500
From: Ray Morris <support@bettercgi.com>
Message-ID: <20120328192752.3a589204@bettercgi.com>
In-Reply-To: <4F7357C3.4060205@bmsi.com>
References: <4F6ECF9B.40907@nuclearwinter.com>
	<20120326155540.19c85fe9@bettercgi.com>
	<4F7100EC.6070406@nuclearwinter.com> <4F71CFFF.6090909@redhat.com>
	<4F722FFF.4010703@nuclearwinter.com> <4F72C38E.2080806@redhat.com>
	<4F7357C3.4060205@bmsi.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] LVM commands extremely slow during raid check/resync
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

> A question (or minor nit): how could lvm possibly require a fs sync
> to create a snapshot?  I could see this for Xen, where guest OS has
> to support a com channel to host.  But for full virtualization, LVM
> doesn't know in general what OS is running,

LVM doesn't have anything whatever to do with virtualization. There are
some cool ways to use them together, but actually most systems using
LVM aren't using virtualization. Sure, you could put a disk image on 
a filesystem which is on a logical volume, but the snapshot and the
sync are in the OS where the logical volume is. Whether files in the FS
on the LV are used by Firefox or by qemu doesn't matter.
-- 
Ray Morris
support@bettercgi.com

Strongbox - The next generation in site security:
http://www.bettercgi.com/strongbox/

Throttlebox - Intelligent Bandwidth Control
http://www.bettercgi.com/throttlebox/

Strongbox / Throttlebox affiliate program:
http://www.bettercgi.com/affiliates/user/register.php




On Wed, 28 Mar 2012 14:26:11 -0400
Stuart D Gathman <stuart@bmsi.com> wrote:

> Long ago, Nostradamus foresaw that on 03/28/2012 03:53 AM, Zdenek 
> Kabelac would write:
> > It seems that your cfq scheduler should be tuned better for raid 
> > arrays - I assume you allow the system to create very large queues
> > of buffers and your mdraid isn't fast enough to store dirty pages
> > on disk 
> > - I'd probably suggest to significantly lower the maximum amount of 
> > dirty pages - as creation of snapshot requires fs sync operation it 
> > will need to wait till all buffers before the operation are in
> > place.
> A question (or minor nit): how could lvm possibly require a fs sync
> to create a snapshot?  I could see this for Xen, where guest OS has
> to support a com channel to host.  But for full virtualization, LVM
> doesn't know in general what OS is running, or how to suggest an FS
> sync.  Or is this something an admin does, run a script that tells
> guest to sync before creating shapshot through lvm (to maximize the
> amount of useful data in the snapshot)?
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> 
