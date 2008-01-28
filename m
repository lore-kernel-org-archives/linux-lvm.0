Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m0SJsn20004242
	for <linux-lvm@redhat.com>; Mon, 28 Jan 2008 14:54:49 -0500
Received: from smtp-3.hut.fi (smtp-3.hut.fi [130.233.228.93])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id m0SJsBIh006809
	for <linux-lvm@redhat.com>; Mon, 28 Jan 2008 14:54:12 -0500
Date: Mon, 28 Jan 2008 21:53:37 +0200 (EET)
From: Vesa-Pekka Palmu <palmu@aski.hut.fi>
Subject: Re: [linux-lvm] LVM limits?
In-Reply-To: <200801281801.m0SI10Xi010185@beta.mvs.co.il>
Message-ID: <Pine.LNX.4.64.0801282152350.4629@aski.hut.fi>
References: <479DAD35.1080209@cesca.es> <479E2BEF.1090703@cesca.es>
	<1201541894.30560.24.camel@behemoth.csg.stercomm.com>
	<200801281801.m0SI10Xi010185@beta.mvs.co.il>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: ehud@unix.mvs.co.il, LVM general discussion and development <linux-lvm@redhat.com>

On Mon, 28 Jan 2008, Ehud Karni wrote:

> On Mon, 28 Jan 2008 11:38:14 Chris Cox wrote:
>>
>> Ok.  But it's really impractical to have large multi-terabyte
>> single filesystem today.  What are you wanting to do?  Ever fsck a
>> 2TB filesystem?  Consider yourself warned.
>
> Just last night I ran fsck on my home 1.5 TB file server (it is software
> RAID-5 - mdadm, built on 7200 RPM, 500GB SATA2 x 4, ext3 without LVM).
> It has went 191 days without fsck so when I booted the machine (I just
> upgraded to 2.6.18-53.1.6.el5) it did the fsck automaticaly.
>
> It took less then 90 minutes.
>

ext3 isn't the best filesystem for large volumes, it's worth considering 
alternatives like jfs.
