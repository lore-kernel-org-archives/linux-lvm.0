Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l83ELdGP024029
	for <linux-lvm@redhat.com>; Mon, 3 Sep 2007 10:21:39 -0400
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx1.redhat.com (8.13.1/8.13.1) with ESMTP id l83ELabg026110
	for <linux-lvm@redhat.com>; Mon, 3 Sep 2007 10:21:36 -0400
Received: from bmsred.bmsi.com (bmsred.bmsi.com [192.168.9.50])
	by mail.bmsi.com (8.13.6/8.13.6) with ESMTP id l83ELQkO006699
	for <linux-lvm@redhat.com>; Mon, 3 Sep 2007 10:21:26 -0400
Received: from localhost (localhost [127.0.0.1])
	by bmsred.bmsi.com (8.13.5/8.13.5) with ESMTP id l83ELQfQ017551
	for <linux-lvm@redhat.com>; Mon, 3 Sep 2007 10:21:26 -0400
Date: Mon, 3 Sep 2007 10:21:26 -0400 (EDT)
From: "Stuart D. Gathman" <stuart@bmsi.com>
Subject: Re: [linux-lvm] how much memory does LVM need? oom-killer comes
In-Reply-To: <46DBD517.80503@wpkg.org>
Message-ID: <Pine.LNX.4.44.0709031016200.17519-100000@bmsred.bmsi.com>
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

> > Out of memory: kill process 2220 (getty) score 24 or a child
> > Killed process 2220 (getty)
> > Kernel panic - not syncing: Out of memory and no killable processes...
> > 
> > Rebooting in 20 seconds..
> 
> Again, replying to myself, as no one on this list seem to have a clue 
> about problems with LVM snapshots... I added RAM, and was able to boot 
> again.

I don't have any answers, but I am very impressed by this kind of testing
and grateful for the contribution.  My thoughts on evil experiments
focused on timing and component failure.  Obviously, resource limits 
are extremely important as well.

I suppose ideal behaviour would be to refuse to create a snapshot when
memory is "low".  But defining "low" can be tricky.

-- 
	      Stuart D. Gathman <stuart@bmsi.com>
    Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.
