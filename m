Received: from mx1.redhat.com (ext-mx05.extmail.prod.ext.phx2.redhat.com
	[10.5.110.9])
	by int-mx03.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o0SJP268014526
	for <linux-lvm@redhat.com>; Thu, 28 Jan 2010 14:25:03 -0500
Received: from saluki.dogpad.net
	(99-152-155-151.lightspeed.dllstx.sbcglobal.net [99.152.155.151])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o0SJOlGx028848
	for <linux-lvm@redhat.com>; Thu, 28 Jan 2010 14:24:47 -0500
Received: from [134.64.50.148] (rich-igate.tek.com [192.65.45.25])
	(using TLSv1 with cipher DHE-RSA-CAMELLIA256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: joey@dogpad.net)
	by saluki.dogpad.net (Postfix) with ESMTPSA id 6BA9F2979B
	for <linux-lvm@redhat.com>; Thu, 28 Jan 2010 13:24:46 -0600 (CST)
Message-ID: <4B61E479.8040806@dogpad.net>
Date: Thu, 28 Jan 2010 13:24:41 -0600
From: Joe Harvell <jharvell+lists.lvm@dogpad.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] how to determine minimum partition size based on PV size
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
To: linux-lvm@redhat.com

I need to reduce the size of an existing PV so that I can shrink the
partition it resides on an reclaim the storage.  I have already shrunk
the file systems and done an lvreduce.

I have three questions:

1. Is the value of the '--setphysicalvolumesize' argument to the
'pvresize' command the size the physical volume (contents and metadata)
will occupy on disk after the operation?  Or is it the specifying the
new capacity of the PV to hold data?
2. How do I determine the minimum size I can specify to pvreduce and
still have all of the original contents of the PV in the newly sized PV?
3. How do I determine the size the newly modified PV occupies on disk so
that I can reduce the partition it lives on to its minimum size?
