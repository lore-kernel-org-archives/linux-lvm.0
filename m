Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n2GIog9N020483
	for <linux-lvm@redhat.com>; Mon, 16 Mar 2009 14:50:42 -0400
Received: from mailmx.futuresource.com (mailmx.futuresource.com [208.10.26.74])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id n2GIoSwH025258
	for <linux-lvm@redhat.com>; Mon, 16 Mar 2009 14:50:28 -0400
Received: from ns1.futuresource.com ([10.207.192.126])
	by mailmx.futuresource.com (8.13.8/8.13.8) with ESMTP id n2GIoRcI013931
	for <linux-lvm@redhat.com>; Mon, 16 Mar 2009 13:50:27 -0500
Received: from [10.207.193.131] (les-xp.futuresource.com [10.207.193.131])
	by ns1.futuresource.com (8.11.6/8.11.6) with ESMTP id n2GIoRr15206
	for <linux-lvm@redhat.com>; Mon, 16 Mar 2009 13:50:27 -0500
Message-ID: <49BE9F73.8050109@gmail.com>
Date: Mon, 16 Mar 2009 13:50:27 -0500
From: Les Mikesell <lesmikesell@gmail.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] fsync() and LVM
References: <49BA9BF9.3070507@esiway.net><Pine.LNX.4.64.0903131552560.2685@bmsred.bmsi.com>	<20090313203812.GK7445@agk.fab.redhat.com>	<7B7881568CF40E4388B615CD06F87B98098BDA@clara.maurer-it.com>	<Pine.LNX.4.64.0903141028190.6115@bmsred.bmsi.com>	<49BC511E.5040402@esiway.net>
	<Pine.LNX.4.64.0903161314310.22113@bmsred.bmsi.com>
In-Reply-To: <Pine.LNX.4.64.0903161314310.22113@bmsred.bmsi.com>
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

Stuart D. Gathman wrote:
>
>> No, it's more than that. PostgreSQL gurus say LVM doesn't honor fsync(),
> 
> That is clearly wrong - since fsync() isn't LVM's responsibility.
> I think they mean that fsync() can't garrantee that any writes are
> actually on the platter.
> 
>> that data doesn't even get to the controller, and it doesn't matter
>> if the disks have write caches enabled or not. Or if they have battery backed
>> caches. Please read the thread I linked. If what they say it's true,
> 
> That is clearly wrong.  If writes don't work, nothing works.
> 
>> you can't use LVM for anything that needs fsync(), including mail queues
>> (sendmail), mail storage (imapd), as such. So I'd really like to know.
> 
> fsync() is a file system call that writes dirty buffers, and then waits
> for the physical writes to complete.  It is only the waiting part that
> is broken.

It's a yes or no question...  Fsync() either guarantees that the write 
is committed to physical media so the application can continue knowing 
that it's own transactional expectations are met (i.e. you can crash and 
recover that piece of data), or it is broken.  If it doesn't wait for 
completion, it can't possibly report the correct status.

-- 
   Les Mikesell
    lesmikesell@gmail.com
