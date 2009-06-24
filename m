Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n5OL429h018519
	for <linux-lvm@redhat.com>; Wed, 24 Jun 2009 17:04:02 -0400
Received: from e6.ny.us.ibm.com (e6.ny.us.ibm.com [32.97.182.146])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n5OL3k1H030816
	for <linux-lvm@redhat.com>; Wed, 24 Jun 2009 17:03:46 -0400
Received: from d01relay04.pok.ibm.com (d01relay04.pok.ibm.com [9.56.227.236])
	by e6.ny.us.ibm.com (8.13.1/8.13.1) with ESMTP id n5OL6l69031290
	for <linux-lvm@redhat.com>; Wed, 24 Jun 2009 17:06:47 -0400
Received: from d01av04.pok.ibm.com (d01av04.pok.ibm.com [9.56.224.64])
	by d01relay04.pok.ibm.com (8.13.8/8.13.8/NCO v9.2) with ESMTP id
	n5OL3kCW255724
	for <linux-lvm@redhat.com>; Wed, 24 Jun 2009 17:03:46 -0400
Received: from d01av04.pok.ibm.com (loopback [127.0.0.1])
	by d01av04.pok.ibm.com (8.12.11.20060308/8.13.3) with ESMTP id
	n5OL3jkW030633
	for <linux-lvm@redhat.com>; Wed, 24 Jun 2009 17:03:45 -0400
Received: from malahal.localdomain (malahal.beaverton.ibm.com [9.47.17.130])
	by d01av04.pok.ibm.com (8.12.11.20060308/8.12.11) with ESMTP id
	n5OL3ifu030529
	for <linux-lvm@redhat.com>; Wed, 24 Jun 2009 17:03:45 -0400
Date: Wed, 24 Jun 2009 14:03:44 -0700
From: malahal@us.ibm.com
Subject: Re: [linux-lvm] Data deduplication for Linux : lessfs
Message-ID: <20090624210344.GA12984@us.ibm.com>
References: <4A42424B.1080208@gmail.com>
	<BE6893A3-3CF3-4B26-B23D-3951C1BF5034@karlsbakk.net>
	<4A4286E1.9080004@gmail.com>
	<02E64FEE-285B-4C41-93FE-9DC40E1A4538@karlsbakk.net>
	<4A4293B9.4090200@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4A4293B9.4090200@gmail.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

Les Mikesell [lesmikesell@gmail.com] wrote:
> Roy Sigurd Karlsbakk wrote:
>> >>>> I am thinking about starting to work on a data deduplicating
>>>>> blockdevice, a kernel module called blockless.
>>>> If done smartly, this may perhaps be possible, but the problem is the 
>>>> filesystem's metadata. Is this going to be dedup'ed? How much will this 
>>>> take? A simple backup will update atime on all the files backed up, and 
>>>> although atime isn't always wanted or needed, the problem occurs 
>>>> elsewhere.
>>>
>>> Block level deduplication isn't going to know/care about the difference 
>>> between file contents and metadata.  It is either stored in blocks that 
>>> match other blocks or not and the difference should not be visible to the 
>>> filesystem living on top of the block device.
>> My point exactly. If dedup was to be done on the block layer, you'd need 
>> flag to say "do not dedup this".
>
> Why?  How can it possibly make any difference? It's not likely that you'd 
> have dupes in the metadata block, but if you do it doesn't matter that they 
> are transparently mapped into one.  You need a copy-on-write mechanism 
> anyway since if you write to either they won't be dups any more.

Because some file systems create duplicate copies of metadata for
recovery if there is some sectors go bad on the media. You really don't
want to merge them!
