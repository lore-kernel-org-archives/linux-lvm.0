Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l5IJEfiK024266
	for <linux-lvm@redhat.com>; Mon, 18 Jun 2007 15:14:41 -0400
Received: from mail.ukfsn.org (s2.ukfsn.org [217.158.120.143])
	by mx1.redhat.com (8.13.1/8.13.1) with ESMTP id l5IJEcaV031415
	for <linux-lvm@redhat.com>; Mon, 18 Jun 2007 15:14:38 -0400
Message-ID: <4676D97E.4000403@dgreaves.com>
Date: Mon, 18 Jun 2007 20:14:06 +0100
From: David Greaves <david@dgreaves.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] 2.6.22-rc4 XFS fails after hibernate/resume
References: <46744065.6060605@dgreaves.com> <4674645F.5000906@gmail.com>
	<46751D37.5020608@dgreaves.com> <4676390E.6010202@dgreaves.com>
	<20070618145007.GE85884050@sgi.com>
In-Reply-To: <20070618145007.GE85884050@sgi.com>
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
To: David Chinner <dgc@sgi.com>
Cc: linux-pm <linux-pm@lists.osdl.org>, "'linux-kernel@vger.kernel.org'" <linux-kernel@vger.kernel.org>, xfs@oss.sgi.com, LinuxRaid <linux-raid@vger.kernel.org>, LVM general discussion and development <linux-lvm@redhat.com>

OK, just an quick ack

When I resumed tonight (having done a freeze/thaw over the suspend) some libata 
errors threw up during the resume and there was an eventual hard hang. Maybe I 
spoke to soon?

I'm going to have to do some more testing...

David Chinner wrote:
> On Mon, Jun 18, 2007 at 08:49:34AM +0100, David Greaves wrote:
>> David Greaves wrote:
>> So doing:
>> xfs_freeze -f /scratch
>> sync
>> echo platform > /sys/power/disk
>> echo disk > /sys/power/state
>> # resume
>> xfs_freeze -u /scratch
>>
>> Works (for now - more usage testing tonight)
> 
> Verrry interesting.
Good :)


> What you were seeing was an XFS shutdown occurring because the free space
> btree was corrupted. IOWs, the process of suspend/resume has resulted
> in either bad data being written to disk, the correct data not being
> written to disk or the cached block being corrupted in memory.
That's the kind of thing I was suspecting, yes.

> If you run xfs_check on the filesystem after it has shut down after a resume,
> can you tell us if it reports on-disk corruption? Note: do not run xfs_repair
> to check this - it does not check the free space btrees; instead it simply
> rebuilds them from scratch. If xfs_check reports an error, then run xfs_repair
> to fix it up.
OK, I can try this tonight...

> FWIW, I'm on record stating that "sync" is not sufficient to quiesce an XFS
> filesystem for a suspend/resume to work safely and have argued that the only
> safe thing to do is freeze the filesystem before suspend and thaw it after
> resume. This is why I originally asked you to test that with the other problem
> that you reported. Up until this point in time, there's been no evidence to
> prove either side of the argument......
> 
> Cheers,
> 
> Dave.
