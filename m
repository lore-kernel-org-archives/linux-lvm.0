Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n2HIDTuo003674
	for <linux-lvm@redhat.com>; Tue, 17 Mar 2009 14:13:29 -0400
Received: from mailmx.futuresource.com (mailmx.futuresource.com [208.10.26.74])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n2HICj4u012167
	for <linux-lvm@redhat.com>; Tue, 17 Mar 2009 14:12:45 -0400
Received: from ns1.futuresource.com (ns3.futuresource.com [10.207.192.125])
	by mailmx.futuresource.com (8.13.8/8.13.8) with ESMTP id n2HICiJY028288
	for <linux-lvm@redhat.com>; Tue, 17 Mar 2009 13:12:44 -0500
Received: from [10.207.193.131] (les-xp.futuresource.com [10.207.193.131])
	by ns1.futuresource.com (8.11.6/8.11.6) with ESMTP id n2HIChr32685
	for <linux-lvm@redhat.com>; Tue, 17 Mar 2009 13:12:44 -0500
Message-ID: <49BFE81B.9040701@gmail.com>
Date: Tue, 17 Mar 2009 13:12:43 -0500
From: Les Mikesell <lesmikesell@gmail.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] fsync() and LVM
References: <49BA9BF9.3070507@esiway.net><Pine.LNX.4.64.0903131552560.2685@bmsred.bmsi.com><20090313203812.GK7445@agk.fab.redhat.com><7B7881568CF40E4388B615CD06F87B98098BDA@clara.maurer-it.com>	<Pine.LNX.4.64.0903141028190.6115@bmsred.bmsi.com>
	<7B7881568CF40E4388B615CD06F87B98098BDD@clara.maurer-it.com>
In-Reply-To: <7B7881568CF40E4388B615CD06F87B98098BDD@clara.maurer-it.com>
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

Dietmar Maurer wrote:
>>> Does that mean I should never use more than one device if I have
>>> applications depending on fsync (databases)?
>> It just means that write barriers won't get passed to the device.
>> This is only a problem if the devices have write caches.
> 
> But fsync is implemented using 'write barriers' - so fsync does not
> work?
> 
> After fsync, all data should be sent from the OS to the disk controller:
> 
> a.) this work perfectly using LVM?
> 
> b.) this does not work at all using LVM?
> 
> c.) it works when you use one single physical drive with LVM?
> 
> I am confused. The thread on the postfix list claims that it does not
> work at
> all?

Everything will seem to work until you have an inconvenient crash or 
disk error.  That is, data will be written normally - whether you fsync 
or not.  The point of fsync() though, is for an application to confirm 
that the file is committed to stable media and will be recoverable even 
if the application (or OS) crashes or the system loses power.  The 
correct next action of the application will depend on the return status 
of the fsync() operation (e.g., acknowledging receipt of a mail message, 
considering a database change to be committed, etc.).   What I believe 
is happening is that fsync() always returns as though it were successful 
even though the underlying operations haven't completed.  That's 
ummm..., optimistic at best.   But, everything will still work (and more 
quickly) as long as the physical write of the file and associated 
directory metadata eventually succeeds.   Realistically, for most things 
it doesn't matter because for critical data you still have to deal with 
the possibility of a disk write that succeeds being unreadable later for 
a variety of reasons - and the rest isn't critical anyway.  However, it 
would be good to know exactly what to expect here.

-- 
  Les Mikesell
    lesmikesell@gmail.com
