Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j2IHHtY15389
	for <linux-lvm@redhat.com>; Fri, 18 Mar 2005 12:17:55 -0500
Received: from sccrmhc12.comcast.net (sccrmhc12.comcast.net [204.127.202.56])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id j2IHHnOB017871
	for <linux-lvm@redhat.com>; Fri, 18 Mar 2005 12:17:50 -0500
Date: Fri, 18 Mar 2005 10:17:42 -0700
From: Barry Roberts <blr@robertsr.us>
Message-ID: <20050318171742.GC2767@www.robertsr.us>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] Newb: discard COW changes to snapshot?
Reply-To: Barry Roberts <blr@robertsr.us>,
	LVM general discussion and development <linux-lvm@redhat.com>
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

I would like to be able to make "sandbox" changes to a medium size
(200 GB) file system.  Is there any way to take a snapshot, make the
changes, and then have the option to throw away all the copy-on-write
changes, and leave the filesystem as it was when the snapshot was
taken?

Are the changes written back when snapshot volume is 'lvermove'ed?  Is
there some option to disable that?

Thanks,
Barry Roberts
