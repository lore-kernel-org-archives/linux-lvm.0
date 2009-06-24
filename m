Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n5OK5CIA012886
	for <linux-lvm@redhat.com>; Wed, 24 Jun 2009 16:05:12 -0400
Received: from mailmx.futuresource.com (mailmx.futuresource.com [208.10.26.74])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n5OK4siI030553
	for <linux-lvm@redhat.com>; Wed, 24 Jun 2009 16:04:55 -0400
Received: from ns1.futuresource.com ([10.207.192.125])
	by mailmx.futuresource.com (8.13.8/8.13.8) with ESMTP id n5OK4paw018373
	for <linux-lvm@redhat.com>; Wed, 24 Jun 2009 15:04:51 -0500
Received: from [10.207.193.131] (xplmikesell.esignalcorp.com [10.207.193.131])
	by ns1.futuresource.com (8.11.6/8.11.6) with ESMTP id n5OK4or32073
	for <linux-lvm@redhat.com>; Wed, 24 Jun 2009 15:04:51 -0500
Message-ID: <4A4286E1.9080004@gmail.com>
Date: Wed, 24 Jun 2009 15:04:49 -0500
From: Les Mikesell <lesmikesell@gmail.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Data deduplication for Linux : lessfs
References: <4A42424B.1080208@gmail.com>
	<BE6893A3-3CF3-4B26-B23D-3951C1BF5034@karlsbakk.net>
In-Reply-To: <BE6893A3-3CF3-4B26-B23D-3951C1BF5034@karlsbakk.net>
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

Roy Sigurd Karlsbakk wrote:
> On 24. juni. 2009, at 17.12, Mark Ruijter wrote:
> 
>> For those who need OpenSource data deduplication today instead of
>> tomorrow one might take a look at lessfs.
>> http://www.lessfs.com
> 
> It's a good idea, but given the current traffic on the lessfs mailing 
> list, I'm not sure if much work is done. I have been a member of that 
> list since June 1 and haven't received more than one message, which was 
> the one I wrote myself.
>>
>> I am thinking about starting to work on a data deduplicating
>> blockdevice, a kernel module called blockless.
> 
> If done smartly, this may perhaps be possible, but the problem is the 
> filesystem's metadata. Is this going to be dedup'ed? How much will this 
> take? A simple backup will update atime on all the files backed up, and 
> although atime isn't always wanted or needed, the problem occurs elsewhere.

Block level deduplication isn't going to know/care about the difference 
between file contents and metadata.  It is either stored in blocks that 
match other blocks or not and the difference should not be visible to 
the filesystem living on top of the block device.

-- 
   Les Mikesell
    lesmikesell@gmail.com
