Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l7RGQ2hE014797
	for <linux-lvm@redhat.com>; Mon, 27 Aug 2007 12:26:02 -0400
Received: from mail2.syneticon.net (mail.syneticon.net [213.239.212.131])
	by mx1.redhat.com (8.13.1/8.13.1) with ESMTP id l7RGPrpG001705
	for <linux-lvm@redhat.com>; Mon, 27 Aug 2007 12:25:53 -0400
Received: from postfix1.syneticon.net (postfix1.syneticon.net [192.168.112.6])
	by mail2.syneticon.net (Postfix) with ESMTP id E629453BD8
	for <linux-lvm@redhat.com>; Mon, 27 Aug 2007 18:25:45 +0200 (CEST)
Received: from localhost (filter1.syneticon.net [192.168.113.3])
	by postfix1.syneticon.net (Postfix) with ESMTP id 87F279325
	for <linux-lvm@redhat.com>; Mon, 27 Aug 2007 18:25:44 +0200 (CEST)
Received: from postfix1.syneticon.net ([192.168.113.4])
	by localhost (mx03.syneticon.net [192.168.113.3]) (amavisd-new,
	port 10025) with ESMTP id ZGzQZTJwC5cs for <linux-lvm@redhat.com>;
	Mon, 27 Aug 2007 18:25:39 +0200 (CEST)
Received: from [192.168.10.145] (xdsl-87-79-96-91.netcologne.de [87.79.96.91])
	by postfix1.syneticon.net (Postfix) with ESMTP
	for <linux-lvm@redhat.com>; Mon, 27 Aug 2007 18:25:38 +0200 (CEST)
Message-ID: <46D2FAFB.7010807@wpkg.org>
Date: Mon, 27 Aug 2007 18:25:31 +0200
From: Tomasz Chmielewski <mangoo@wpkg.org>
MIME-Version: 1.0
Subject: Re: [linux-lvm] "cannot allocate memory" when trying to do a snapshot?
References: <46CEE6FF.1090000@wpkg.org> <46D2F715.9000308@wpkg.org>
	<1188231241.24432.1.camel@pc.ilinx>
In-Reply-To: <1188231241.24432.1.camel@pc.ilinx>
Content-Transfer-Encoding: 7bit
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
To: LVM general discussion and development <linux-lvm@redhat.com>

Brian J. Murrell schrieb:
> On Mon, 2007-08-27 at 18:08 +0200, Tomasz Chmielewski wrote:
>> Some more info on that.
>> Apparently, this whole snapshotting thing is not very stable, and there 
>> are bugs in it.
> 
> This whole snapshotting thing is a known and fixed bug.  I opened a bug
> about it in RH's bugzilla about a year ago but am unable to log back in
> there to find it specifically for you.  Search for bugs reported by
> anyone @interlinx.bc.ca.  Try the word "kcopy" in the bug if there are
> too many listed.

Looks like it's here:

https://bugzilla.redhat.com/show_bug.cgi?id=208172

Let's see if upgrading the kernel helps...


-- 
Tomasz Chmielewski
http://wpkg.org
