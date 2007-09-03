Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l83GAAa9025850
	for <linux-lvm@redhat.com>; Mon, 3 Sep 2007 12:10:10 -0400
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx1.redhat.com (8.13.1/8.13.1) with ESMTP id l83G9wh3021605
	for <linux-lvm@redhat.com>; Mon, 3 Sep 2007 12:09:58 -0400
Received: from bmsred.bmsi.com (bmsred.bmsi.com [192.168.9.50])
	by mail.bmsi.com (8.13.6/8.13.6) with ESMTP id l83G9rw0009828
	for <linux-lvm@redhat.com>; Mon, 3 Sep 2007 12:09:53 -0400
Received: from localhost (localhost [127.0.0.1])
	by bmsred.bmsi.com (8.13.5/8.13.5) with ESMTP id l83G9rO1018291
	for <linux-lvm@redhat.com>; Mon, 3 Sep 2007 12:09:53 -0400
Date: Mon, 3 Sep 2007 12:09:53 -0400 (EDT)
From: "Stuart D. Gathman" <stuart@bmsi.com>
Subject: Re: [linux-lvm] how much memory does LVM need? oom-killer comes
In-Reply-To: <46DBD517.80503@wpkg.org>
Message-ID: <Pine.LNX.4.44.0709031201030.18181-100000@bmsred.bmsi.com>
MIME-Version: 1.0
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Mon, 3 Sep 2007, Tomasz Chmielewski wrote:

> Again, replying to myself, as no one on this list seem to have a clue 
> about problems with LVM snapshots... I added RAM, and was able to boot 
> again.

I may have an answer after all.  I suspect that the chunksize parameter
to lvcreate -s will affect memory use.  A larger chunksize should use
less memory.

> So, as a rule of thumb, we can say that for each *used* GB of snapshot, 
> ~3 MB of RAM is needed.

On my snapshots on Centos-5, the chunksize defaults to 8k.  With your
observation of 3MB per Gig of snapshot, that comes to 24 bytes per chunk.
Quite reasonable.  If you make your chunksize 512K (the maximum supported),
memory use should change to 48K per Gig.

lvdisplay will show the chunksize for a snapshot.

-- 
	      Stuart D. Gathman <stuart@bmsi.com>
    Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.
