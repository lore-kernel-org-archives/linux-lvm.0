Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l260bjpG010808
	for <linux-lvm@redhat.com>; Mon, 5 Mar 2007 19:37:45 -0500
Received: from ug-out-1314.google.com (ug-out-1314.google.com [66.249.92.175])
	by mx2.redhat.com (8.13.1/8.13.1) with ESMTP id l260bhpP025863
	for <linux-lvm@redhat.com>; Mon, 5 Mar 2007 19:37:43 -0500
Received: by ug-out-1314.google.com with SMTP id x30so17947ugc
	for <linux-lvm@redhat.com>; Mon, 05 Mar 2007 16:37:42 -0800 (PST)
Message-ID: <31dadfbb0703051637n6b9fc6c4w1eea492bd08079@mail.gmail.com>
Date: Mon, 5 Mar 2007 16:37:40 -0800
From: "Vern Kyle" <vkyle@acm.org>
Sender: vern.kyle@gmail.com
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Subject: [linux-lvm] Encapsulate existing partition / Moving logical volumes
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
To: linux-lvm@redhat.com

I'm in the process of converting a couple of servers to use lvm2, and
there are two items that I can not find a reference for in the how-to
or on the lvm wiki.

First, is there a method to encapsulate an existing disk partition
into a logical volume?  (I can copy all of the data manually, but I'm
thinking there is an eloquent way to accomplish this.)

Second, I have found references to moving a volume group between
different physical volumes.  Is there a method to moving logical
volumes between volume groups?

If someone could provide a hint or a pointer to the documentation I'm
overlooking, I'd appreciate it.

Thanks,

Vern
