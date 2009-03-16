Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n2GLHFbT025466
	for <linux-lvm@redhat.com>; Mon, 16 Mar 2009 17:17:15 -0400
Received: from mailmx.futuresource.com (mailmx.futuresource.com [208.10.26.74])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n2GLH1Ui000950
	for <linux-lvm@redhat.com>; Mon, 16 Mar 2009 17:17:01 -0400
Received: from ns1.futuresource.com (ns3.futuresource.com [10.207.192.125])
	by mailmx.futuresource.com (8.13.8/8.13.8) with ESMTP id n2GLH1gq015408
	for <linux-lvm@redhat.com>; Mon, 16 Mar 2009 16:17:01 -0500
Received: from [10.207.193.131] (les-xp.futuresource.com [10.207.193.131])
	by ns1.futuresource.com (8.11.6/8.11.6) with ESMTP id n2GLH0r16946
	for <linux-lvm@redhat.com>; Mon, 16 Mar 2009 16:17:01 -0500
Message-ID: <49BEC1CC.5050900@gmail.com>
Date: Mon, 16 Mar 2009 16:17:00 -0500
From: Les Mikesell <lesmikesell@gmail.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] fsync() and LVM
References: <49BA9BF9.3070507@esiway.net>	<Pine.LNX.4.64.0903131552560.2685@bmsred.bmsi.com>	<20090313203812.GK7445@agk.fab.redhat.com>	<7B7881568CF40E4388B615CD06F87B98098BDA@clara.maurer-it.com>	<Pine.LNX.4.64.0903141028190.6115@bmsred.bmsi.com>	<49BC511E.5040402@esiway.net>	<Pine.LNX.4.64.0903161314310.22113@bmsred.bmsi.com>	<49BE9F73.8050109@gmail.com>	<87f94c370903161236y197edd7ehef3dc8eefc6d617b@mail.gmail.com>	<49BEB683.7020209@gmail.com>
	<87f94c370903161354v2e43f13ci914f45175ca6af6f@mail.gmail.com>
In-Reply-To: <87f94c370903161354v2e43f13ci914f45175ca6af6f@mail.gmail.com>
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

Greg Freemyer wrote:
> 
>>> Those are some very significant subsystems.  I have to believe
>>> filesystems have another way to implement fsync if barriers are not
>>> supported in the stack of block susbsystems.
>> If you can't get the completion status from the underlying layer, how can a
>> filesystem possibly implement it?
> 
> Barriers is a specific technology and they were just implemented in
> linux around 2005 I think.  (see documentation/barriers.txt)
> 
> Surely there was a mechanism in place before that.

I'm not sure that's a reasonable assumption.

>>> Maybe this discussion needs to move to a filesystem list, since it is
>>> the filesystem that is responsible for making fsync() work even in the
>>> absence of barriers.
>> I though linux ended up doing a sync of the entire outstanding buffered data
>> for a partition with horrible performance, at least on ext3.
> 
> Yes, I understand fsync is horribly slow in ext3 and that may be the
> reason.  Supposedly much better in ext4.  Still if a userspace app
> calls fsync and in turn the filesystem does something really slow due
> to the lack of barriers, then this conversation should be about the
> poor performance of fsync() when using lvm (or mdraid, or drdb), not
> the total lack of fsync() support.

I haven't seen anyone claim yet that there is support for fsync(), which 
must return the status of the completion of the operation to the 
application.  If it does, then the discussion could turn to performance.

-- 
   Les Mikesell
    lesmikesell@gmail.com
