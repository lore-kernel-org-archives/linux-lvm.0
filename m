Received: from localhost (vpn1-7-181.ams2.redhat.com [10.36.7.181])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s4MAIc9A020441
	for <linux-lvm@redhat.com>; Thu, 22 May 2014 06:18:39 -0400
Date: Thu, 22 May 2014 11:18:37 +0100
From: "Richard W.M. Jones" <rjones@redhat.com>
Message-ID: <20140522101837.GB14236@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] Testing the new LVM cache feature
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


I've set up a computer in order to test the new LVM cache feature.  It
has a pair of 2 TB HDDs in RAID 1 configuration, and a 256 GB SSD.
The setup will be used to store large VM disk images in an ext4
filesystem, to be served both locally and over NFS.

Before I start I have some questions about this feature:

(1) Is there a minimum recommended version of LVM or kernel to use?  I
currently have lvm2-2.02.106-1.fc20.x86_64, which mentions LVM cache
in the lvm(8) man page.  I have kernel 3.14.3-200.fc20.x86_64.

(2) There is no lvmcache(7) man page in any released version of LVM2.
Was this man page ever created or is lvm(8) the definitive
documentation?

(3) It looks as if cached LVs cannot be resized:
https://www.redhat.com/archives/lvm-devel/2014-February/msg00119.html
Will this be fixed in future?  Is there any workaround -- perhaps
removing the caching layer, resizing the original LV, then recreating
the cache?  I really need to be able to resize LVs :-)

(4) To calculate the size of the cache metadata LV, do I really just
divide by 1000, min 8 MB?  It's that simple?  Doesn't it depend on
dm-cache block size?  Or dm-cache algorithm?  How can I choose block
size and algorithm?

(5) Is there an explicit command for flushing the cache layer back to
the origin LV?

(6) Is the on-disk format stable for future kernel/LVM upgrades?

Rich.

-- 
Richard Jones, Virtualization Group, Red Hat http://people.redhat.com/~rjones
Read my programming and virtualization blog: http://rwmj.wordpress.com
libguestfs lets you edit virtual machines.  Supports shell scripting,
bindings from many languages.  http://libguestfs.org
