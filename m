Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l1KG0Zc8032729
	for <linux-lvm@redhat.com>; Tue, 20 Feb 2007 11:00:35 -0500
Received: from ciao.gmane.org (main.gmane.org [80.91.229.2])
	by mx1.redhat.com (8.13.1/8.13.1) with ESMTP id l1KG0Wg4004241
	for <linux-lvm@redhat.com>; Tue, 20 Feb 2007 11:00:33 -0500
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1HJXPk-0007Fe-Rk
	for linux-lvm@redhat.com; Tue, 20 Feb 2007 17:00:24 +0100
Received: from 203.187.253.248 ([203.187.253.248])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-lvm@redhat.com>; Tue, 20 Feb 2007 17:00:24 +0100
Received: from rrs by 203.187.253.248 with local (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-lvm@redhat.com>; Tue, 20 Feb 2007 17:00:24 +0100
From: Ritesh Raj Sarraf <rrs@researchut.com>
Date: Tue, 20 Feb 2007 20:19:58 +0530
Message-ID: <mdera4-bvp.ln1@www.researchut.com>
References: <3nmja4-jtv.ln1@www.researchut.com>
	<20070220061150.GA3215@percy.comedia.it>
	<186ra4-8hp.ln1@www.researchut.com>
	<20070220131909.GA26642@percy.comedia.it>
Mime-Version: 1.0
Content-Transfer-Encoding: 7Bit
Sender: news <news@sea.gmane.org>
Subject: [linux-lvm] Re: Re: LVM + Multipathing
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
To: linux-lvm@redhat.com

Luca Berra wrote:

> i meant that LVM (actually device-mapper) does not do anything special.
> it just passes the IO requests from the fs layer to the
> underlying block device and if the underlyng block device returns an IO
> error then it is passed back to the fs. which will cause ext2 to remount
> the filesystem readonly.

Hi,

Thanks for clarifying.

In my case, the block device is hidden by the multipathing layer. 
It is something like:
(Block Device(Multipathing(LVM(Filesystem) ) ) )

Now during takeover/giveback, the multipathing layer is intelligent enough to
wait till <120 seconds before declaring that the path has really gone offline
and no more paths are available.
If within the 120 seconds time span, the takeover succeeds, the path is back
online and everything works fine in a non-LVM setup.

It is only in an LVM setup that a takeover/giveback ends up with the host OS
having a filesystem read-only problem.
Now if I go with your explanation, I shouldn't have had the filesystem read-only
problem since the I/O is being passed on to the multipathing layer which is
intelligent enough to wait for N seconds before really sending an I/O Error.

Are there any timeout options in LVM to allow it to wait for N seconds before
sending out an error ?
(I understand that LVM might not be involved, but just wondering).


Thanks,
Ritesh
-- 
Ritesh Raj Sarraf
RESEARCHUT - http://www.researchut.com
"Necessity is the mother of invention."
"Stealing logic from one person is plagiarism, stealing from many is research."
"The great are those who achieve the impossible, the petty are those who
cannot - rrs"
