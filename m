Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n5OLMF5d028543
	for <linux-lvm@redhat.com>; Wed, 24 Jun 2009 17:22:15 -0400
Received: from mailmx.futuresource.com (mailmx.futuresource.com [208.10.26.74])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n5OLM2MC008222
	for <linux-lvm@redhat.com>; Wed, 24 Jun 2009 17:22:02 -0400
Received: from ns1.futuresource.com ([10.207.192.125])
	by mailmx.futuresource.com (8.13.8/8.13.8) with ESMTP id n5OLM1bj019218
	for <linux-lvm@redhat.com>; Wed, 24 Jun 2009 16:22:01 -0500
Received: from [10.207.193.131] (xplmikesell.esignalcorp.com [10.207.193.131])
	by ns1.futuresource.com (8.11.6/8.11.6) with ESMTP id n5OLM0r01539
	for <linux-lvm@redhat.com>; Wed, 24 Jun 2009 16:22:00 -0500
Message-ID: <4A4298F7.1020101@gmail.com>
Date: Wed, 24 Jun 2009 16:21:59 -0500
From: Les Mikesell <lesmikesell@gmail.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Data deduplication for Linux : lessfs
References: <4A42424B.1080208@gmail.com>	<BE6893A3-3CF3-4B26-B23D-3951C1BF5034@karlsbakk.net>	<4A4286E1.9080004@gmail.com>	<02E64FEE-285B-4C41-93FE-9DC40E1A4538@karlsbakk.net>	<4A4293B9.4090200@gmail.com>
	<20090624210344.GA12984@us.ibm.com>
In-Reply-To: <20090624210344.GA12984@us.ibm.com>
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

malahal@us.ibm.com wrote:
> 
>>>> Block level deduplication isn't going to know/care about the difference 
>>>> between file contents and metadata.  It is either stored in blocks that 
>>>> match other blocks or not and the difference should not be visible to the 
>>>> filesystem living on top of the block device.
>>> My point exactly. If dedup was to be done on the block layer, you'd need 
>>> flag to say "do not dedup this".
>> Why?  How can it possibly make any difference? It's not likely that you'd 
>> have dupes in the metadata block, but if you do it doesn't matter that they 
>> are transparently mapped into one.  You need a copy-on-write mechanism 
>> anyway since if you write to either they won't be dups any more.
> 
> Because some file systems create duplicate copies of metadata for
> recovery if there is some sectors go bad on the media. You really don't
> want to merge them!

My experience with disks is that if any part of them fails you don't 
want to trust data from any other part.  So I'd consider this a big 
waste of time and generally keep data that matters on mirrored drives. 
Hmmm, I suppose you would want it to know not to de-dup the mirrored 
blocks..

-- 
   Les Mikesell
    lesmikesell@gmail.com
