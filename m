Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l849Wbrd029881
	for <linux-lvm@redhat.com>; Tue, 4 Sep 2007 05:32:38 -0400
Received: from mail2.syneticon.net (mail.syneticon.net [213.239.212.131])
	by mx2.redhat.com (8.13.1/8.13.1) with ESMTP id l849WTVY015877
	for <linux-lvm@redhat.com>; Tue, 4 Sep 2007 05:32:30 -0400
Received: from postfix1.syneticon.net (postfix1.syneticon.net [192.168.112.6])
	by mail2.syneticon.net (Postfix) with ESMTP id C56BF6061F
	for <linux-lvm@redhat.com>; Tue,  4 Sep 2007 11:32:21 +0200 (CEST)
Received: from localhost (filter1.syneticon.net [192.168.113.3])
	by postfix1.syneticon.net (Postfix) with ESMTP id 724599356
	for <linux-lvm@redhat.com>; Tue,  4 Sep 2007 11:32:21 +0200 (CEST)
Received: from postfix1.syneticon.net ([192.168.113.4])
	by localhost (mx03.syneticon.net [192.168.113.3]) (amavisd-new,
	port 10025) with ESMTP id f7nHJReKwRAZ for <linux-lvm@redhat.com>;
	Tue,  4 Sep 2007 11:32:18 +0200 (CEST)
Received: from [192.168.10.145] (xdsl-87-78-206-10.netcologne.de
	[87.78.206.10]) by postfix1.syneticon.net (Postfix) with ESMTP
	for <linux-lvm@redhat.com>; Tue,  4 Sep 2007 11:32:18 +0200 (CEST)
Message-ID: <46DD2621.1010608@wpkg.org>
Date: Tue, 04 Sep 2007 11:32:17 +0200
From: Tomasz Chmielewski <mangoo@wpkg.org>
MIME-Version: 1.0
Subject: Re: [linux-lvm] how much memory does LVM need? oom-killer comes
References: <Pine.LNX.4.44.0709031201030.18181-100000@bmsred.bmsi.com>
In-Reply-To: <Pine.LNX.4.44.0709031201030.18181-100000@bmsred.bmsi.com>
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

Stuart D. Gathman schrieb:
> On Mon, 3 Sep 2007, Tomasz Chmielewski wrote:
> 
>> Again, replying to myself, as no one on this list seem to have a clue 
>> about problems with LVM snapshots... I added RAM, and was able to boot 
>> again.
> 
> I may have an answer after all.  I suspect that the chunksize parameter
> to lvcreate -s will affect memory use.  A larger chunksize should use
> less memory.
> 
>> So, as a rule of thumb, we can say that for each *used* GB of snapshot, 
>> ~3 MB of RAM is needed.
> 
> On my snapshots on Centos-5, the chunksize defaults to 8k.  With your
> observation of 3MB per Gig of snapshot, that comes to 24 bytes per chunk.
> Quite reasonable.  If you make your chunksize 512K (the maximum supported),
> memory use should change to 48K per Gig.
> 
> lvdisplay will show the chunksize for a snapshot.

Indeed, it was 8 kB.

What is the meaning of the chunksize in snapshots?

With 512 kB chunksize, I guess the snapshot will fill faster than with 8 
KB chunksize, given that the same amount of data changes?


Here is a quick test that shows it.

I created two 20 GB snapshots of a 20GB volume, one with 8kB, and the 
other with 512 kB chunksize.

Then, I created a 50 MB file on the original volume (out of /dev/zero):

   build1                  san1 owi-ao  20.00G
   build1-512              san1 swi-a-  20.00G build1            0.09
   build1-8                san1 swi-a-  20.00G build1            0.08

Copying /bin, /boot and /lib (71 MB in total) into a new directory makes 
that difference bigger:

   build1                  san1 owi-ao  20.00G
   build1-512              san1 swi-a-  20.00G build1            0.76
   build1-8                san1 swi-a-  20.00G build1            0.62

Copying a 1.2 GB /usr into a new directory shows this:

   build1-512              san1 swi-a-  20.00G build1            7.40
   build1-8                san1 swi-a-  20.00G build1            7.18


And finally, create 1000000 empty files:

   build1                  san1 owi-ao  20.00G
   build1-512              san1 swi-a-  20.00G build1            8.22
   build1-8                san1 swi-a-  20.00G build1            7.91


The difference is not that big, usually it should be below 5%.


-- 
Tomasz Chmielewski
http://wpkg.org
