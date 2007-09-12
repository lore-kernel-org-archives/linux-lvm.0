Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l8CKJ83m021457
	for <linux-lvm@redhat.com>; Wed, 12 Sep 2007 16:19:08 -0400
Received: from mx1.aecom.yu.edu (mx1.aecom.yu.edu [129.98.1.51])
	by mx2.redhat.com (8.13.1/8.13.1) with ESMTP id l8CKJ0vN031600
	for <linux-lvm@redhat.com>; Wed, 12 Sep 2007 16:19:00 -0400
Mime-Version: 1.0
Message-Id: <a0624041cc30df858fbcf@[129.98.90.227]>
In-Reply-To: <20070912200433.66AED72FE3@hormel.redhat.com>
References: <20070912200433.66AED72FE3@hormel.redhat.com>
Date: Wed, 12 Sep 2007 16:18:42 -0400
From: Maurice Volaski <mvolaski@aecom.yu.edu>
Subject: [linux-lvm] Re: Can LVM block I/O and hang a system?
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com
Cc: drbd-user@linbit.com

Oh, this is good to know, but the peer was unattached during the 
initial hanging and when I fscked.

At 4:04 PM -0400 9/12/07, linux-lvm-request@redhat.com wrote:
>please use drbd 8.0.6 with kernels that do not allow recursion in
>generic_make_request, otherwise any lock is likely to be caused by this.
>
>then, if there are still lockups, these may be caused by lvm, and may be
>due to some similar problem, namely doing synchronous (housekeeping) io
>from within the generic_make_request path within the same "thread".

For drbd mailing list readers, who didn't see the original message, 
the kernel version I am using is Gentoo 2.6.22-r3. (I don't know 
whether this will still be true of kernels after 22-r3.)
-- 

Maurice Volaski, mvolaski@aecom.yu.edu
Computing Support, Rose F. Kennedy Center
Albert Einstein College of Medicine of Yeshiva University
