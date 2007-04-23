Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l3NIsd2M008160
	for <linux-lvm@redhat.com>; Mon, 23 Apr 2007 14:54:40 -0400
Received: from nz-out-0506.google.com (nz-out-0506.google.com [64.233.162.233])
	by mx2.redhat.com (8.13.1/8.13.1) with ESMTP id l3NIsca2012654
	for <linux-lvm@redhat.com>; Mon, 23 Apr 2007 14:54:38 -0400
Received: by nz-out-0506.google.com with SMTP id s18so1685728nze
	for <linux-lvm@redhat.com>; Mon, 23 Apr 2007 11:54:37 -0700 (PDT)
Message-ID: <fd8dc0d20704231154l4a512d7ag2df2405ebcb17cd2@mail.gmail.com>
Date: Mon, 23 Apr 2007 14:54:37 -0400
From: "Boris Ostrovsky" <baostr@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Subject: [linux-lvm] multiple levels of snapshots
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

From what I can see, LVM tools don't allow creating multiple levels of
snapshots (i.e. creating a
snapshot of a snapshot). Is this a fundamental property of LVM/device
mapper architecture
or is it that this feature simply hasn't made it to LVM (yet)?

Would it be possible to use dmsetup to set this up? I suspect that the
answer is "no", but
I'd like to make sure before I give up on this.

Thanks.
-boris
