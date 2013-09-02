Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.19])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r82KP7qS006287
	for <linux-lvm@redhat.com>; Mon, 2 Sep 2013 16:25:07 -0400
Received: from plane.gmane.org (plane.gmane.org [80.91.229.3])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r82KP4Nc002765
	for <linux-lvm@redhat.com>; Mon, 2 Sep 2013 16:25:05 -0400
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gllg-linux-lvm@m.gmane.org>) id 1VGagJ-0005Ti-L4
	for linux-lvm@redhat.com; Mon, 02 Sep 2013 22:25:03 +0200
Received: from ip-78-94-60-11.unitymediagroup.de ([78.94.60.11])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-lvm@redhat.com>; Mon, 02 Sep 2013 22:25:03 +0200
Received: from news-io-dx32 by ip-78-94-60-11.unitymediagroup.de with local
	(Gmexim 0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <linux-lvm@redhat.com>; Mon, 02 Sep 2013 22:25:03 +0200
From: Ron Schneider <news-io-dx32@spamfilter.de>
Date: Mon, 02 Sep 2013 22:21:14 +0200
Message-ID: <l02rvj$uab$1@ger.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Question before merging snapshot
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


Hi all,

Situation:

I have a volume A that contains production data.
For an experiment I created volume a' from A using
the snapshot function.
I then used a' for my experiment, which went very well.

Now I want to merge snapshot a' back into A. I have read that the merge
will effectively make A to be what a' was before, then a' will
disappear. However, all examples that I found on the net referred to
making snapshot a' then making changes to the origin A and finally using
--merge to revert A back to a'.
In my case though, I used the snapshot a' for writing instead of origin
A. I just want you to confirm that --merge will function the same way
nevertheless, thus making the modified content of a' appear in the
origin LV A.
Of course I will backup everything before the merge but I'd like to save
myself unnecessary recovery cycles so I thought I'd just ask the pros
beforehand - just to be sure.

-- 
kind regards,
             Ron
