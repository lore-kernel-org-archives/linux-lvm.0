Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l81Kdhu2031017
	for <linux-lvm@redhat.com>; Sat, 1 Sep 2007 16:39:43 -0400
Received: from mail2.syneticon.net (mail.syneticon.net [213.239.212.131])
	by mx2.redhat.com (8.13.1/8.13.1) with ESMTP id l81Kdact021962
	for <linux-lvm@redhat.com>; Sat, 1 Sep 2007 16:39:36 -0400
Received: from postfix1.syneticon.net (postfix1.syneticon.net [192.168.112.6])
	by mail2.syneticon.net (Postfix) with ESMTP id 242D754914
	for <linux-lvm@redhat.com>; Sat,  1 Sep 2007 22:39:28 +0200 (CEST)
Received: from localhost (filter1.syneticon.net [192.168.113.3])
	by postfix1.syneticon.net (Postfix) with ESMTP id 0F70894E3
	for <linux-lvm@redhat.com>; Sat,  1 Sep 2007 22:39:28 +0200 (CEST)
Received: from postfix1.syneticon.net ([192.168.113.4])
	by localhost (mx03.syneticon.net [192.168.113.3]) (amavisd-new,
	port 10025) with ESMTP id aGhEIvkkMNYM for <linux-lvm@redhat.com>;
	Sat,  1 Sep 2007 22:39:26 +0200 (CEST)
Received: from [192.168.10.145] (xdsl-87-78-243-125.netcologne.de
	[87.78.243.125]) by postfix1.syneticon.net (Postfix) with ESMTP
	for <linux-lvm@redhat.com>; Sat,  1 Sep 2007 22:39:26 +0200 (CEST)
Message-ID: <46D9CDFD.7010800@wpkg.org>
Date: Sat, 01 Sep 2007 22:39:25 +0200
From: Tomasz Chmielewski <mangoo@wpkg.org>
MIME-Version: 1.0
Subject: Re: [linux-lvm] "cannot allocate memory" when trying to do a snapshot?
References: <46CEE6FF.1090000@wpkg.org>
	<46D2F715.9000308@wpkg.org>	<1188231241.24432.1.camel@pc.ilinx>
	<46D2FAFB.7010807@wpkg.org> <1188232446.24432.3.camel@pc.ilinx>
In-Reply-To: <1188232446.24432.3.camel@pc.ilinx>
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
> On Mon, 2007-08-27 at 18:25 +0200, Tomasz Chmielewski wrote:
>> Looks like it's here:
>>
>> https://bugzilla.redhat.com/show_bug.cgi?id=208172
> 
> Yup.  That's the one my bug 191531 was dup'd to.
> 
>> Let's see if upgrading the kernel helps...
> 
> Let us know.

It looks that it helped.

However, now it's possible to create a snapshot that is no longer 
possible to remove...

See my other thread ("how much memory does LVM need? oom-killer comes").


-- 
Tomasz Chmielewski
http://wpkg.org
