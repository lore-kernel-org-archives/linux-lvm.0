Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m5GK376D006713
	for <linux-lvm@redhat.com>; Mon, 16 Jun 2008 16:03:07 -0400
Received: from mx03.syneticon.net (mx03.syneticon.net [87.79.32.166])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m5GK2qf9028036
	for <linux-lvm@redhat.com>; Mon, 16 Jun 2008 16:02:52 -0400
Received: from localhost (filter1.syneticon.net [192.168.113.3])
	by mx03.syneticon.net (Postfix) with ESMTP id 7781B946A
	for <linux-lvm@redhat.com>; Mon, 16 Jun 2008 22:02:47 +0200 (CEST)
Received: from mx03.syneticon.net ([192.168.113.4])
	by localhost (mx03.syneticon.net [192.168.113.3]) (amavisd-new,
	port 10025) with ESMTP id VvLhucKTFjNF for <linux-lvm@redhat.com>;
	Mon, 16 Jun 2008 22:02:42 +0200 (CEST)
Received: from [192.168.10.145] (koln-4d0b73de.pool.mediaWays.net
	[77.11.115.222]) by mx03.syneticon.net (Postfix) with ESMTP
	for <linux-lvm@redhat.com>; Mon, 16 Jun 2008 22:02:42 +0200 (CEST)
Message-ID: <4856C6E1.6080804@wpkg.org>
Date: Mon, 16 Jun 2008 22:02:41 +0200
From: Tomasz Chmielewski <mangoo@wpkg.org>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Server hangs when writing to LVM volume due to LVM
	Snapshots
References: <20080616135319.GA29234@campbell-lange.net>	<4856715A.6050107@wpkg.org>
	<20080616141907.GH3765@campbell-lange.net>	<48567DF8.7080600@wpkg.org>
	<20080616151014.GJ3765@campbell-lange.net>	<4856BC88.4060602@wpkg.org>
	<a71bd89a0806161238l6bb44670tca9e4b0b9635154a@mail.gmail.com>
In-Reply-To: <a71bd89a0806161238l6bb44670tca9e4b0b9635154a@mail.gmail.com>
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

Dan Kegel schrieb:
> On Mon, Jun 16, 2008 at 12:18 PM, Tomasz Chmielewski <mangoo@wpkg.org> wrote:
>> LVM-2 doesn't scale very well.
>>
>> If you have I/O intensive workloads, I'd discourage using (multiple)
>> snapshots.
>>
>> A single write to the origin mean additional writes to each and every
>> snapshot of that origin.
> 
> Right.  This is one of the things zumastor.org snapshots do better;
> all snapshots for a volume share a common snapshot store,
> so performance doesn't fall as you add more snapshots.
> You might want to have a look at it... join the zumastor
> mailing list or drop in on our irc if you have questions.

Speaking of Zumastor - is it equivalent (or just a part of something 
bigger) of still discussed, future LVM-3?

There was supposed to be a presentation titled "LVM3 Advanced Volume 
Manager for Linux" by Daniel Phillips on LinuxTag 2008 in May[1] - do 
you know if it's available anywhere (yet)?


>> Tomasz Chmielewski
>> http://wpkg.org
> 
> wpkg.org looks very cool.  I haven't used it much yet,
> but I hope to use it as a kind of automated real world test of
> wine sometime.

Thanks.
For application installation it should work just fine (as it is what it 
does), but for some more thorough GUI testing...? Anyway, we're getting 
off-topic here ;)

[1] 
http://www.linuxtag.org/2008/de/conf/events/vp-mittwoch/vortragsdetails.html?talkid=51

-- 
Tomasz Chmielewski
http://wpkg.org
