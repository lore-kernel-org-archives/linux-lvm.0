Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l4DGkCvg015036
	for <linux-lvm@redhat.com>; Sun, 13 May 2007 12:46:12 -0400
Received: from mailmx.futuresource.com (mailmx.futuresource.com [208.10.26.74])
	by mx1.redhat.com (8.13.1/8.13.1) with ESMTP id l4DGk9qJ008810
	for <linux-lvm@redhat.com>; Sun, 13 May 2007 12:46:09 -0400
Received: from ns1.futuresource.com (ns3.futuresource.com [10.207.192.125])
	by mailmx.futuresource.com (8.12.11.20060308/8.12.11) with ESMTP id
	l4DGk84E026317
	for <linux-lvm@redhat.com>; Sun, 13 May 2007 11:46:08 -0500
Received: from Jill-Mikesells-Computer.local (les2-openvpn.futuresource.com
	[10.200.1.18])
	by ns1.futuresource.com (8.11.6/8.11.6) with ESMTP id l4DGk7h15498
	for <linux-lvm@redhat.com>; Sun, 13 May 2007 11:46:07 -0500
Message-ID: <464740CD.1080807@gmail.com>
Date: Sun, 13 May 2007 11:46:05 -0500
From: Les Mikesell <lesmikesell@gmail.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] LVM on SATA/PATA disks
References: <Pine.LNX.4.44.0705122130070.27083-100000@bmsred.bmsi.com>
	<464672A6.3000408@davidb.org>
In-Reply-To: <464672A6.3000408@davidb.org>
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

David Brown wrote:
> Stuart D. Gathman wrote:
> 
>>> How does SATA fit in with all of this?  Is it basically the same
>>> limitations on the bus as IDE/PATA, so that you'd really not want to put
>>> more than 1 device per bus?
>> SATA mandates at most 1 disk per channel, making the issue moot.  It is
>> still true that there is only one active disk on a bus.  But then there
>> is only one disk on a bus.
> 
> Newer SATA drives, with proper newer controllers and proper device
> driver support will support NCQ (native command queueing), which
> allows the drive to re-order requests.  It appears that the Linux ACHI
> and Nvidia SATA drivers support this capability in recent kernels.
> 
> Of course, any of the re-ordering (SCSI TCQ, or SATA NCQ) requires
> filesystem and driver support of write barriers for reliability.
> Write barriers are not implement in DM, hence LVM, so there is a
> reliability risk in going with this kind of solution.  Depending on
> the filesystem this can result in power failures resulting in files
> having inconsistent data.

Are you saying that LVM on SCSI is not safe in this scenario?

-- 
   Les Mikesell
    lesmikesell@gmail.com
