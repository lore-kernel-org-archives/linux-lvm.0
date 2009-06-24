Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n5OK9wL0015228
	for <linux-lvm@redhat.com>; Wed, 24 Jun 2009 16:09:58 -0400
Received: from bigone.karlsbakk.net (karlsbakk.net [213.236.233.92])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id n5OK9dW4014511
	for <linux-lvm@redhat.com>; Wed, 24 Jun 2009 16:09:40 -0400
Received: from bigone.karlsbakk.net (localhost [127.0.0.1])
	by bigone.karlsbakk.net (Postfix) with ESMTP id 2055C2804A5A
	for <linux-lvm@redhat.com>; Wed, 24 Jun 2009 22:09:39 +0200 (CEST)
Received: from [IPv6:::1] (localhost [127.0.0.1])
	by bigone.karlsbakk.net (Postfix) with ESMTP id E43EA28040CD
	for <linux-lvm@redhat.com>; Wed, 24 Jun 2009 22:09:38 +0200 (CEST)
Message-Id: <02E64FEE-285B-4C41-93FE-9DC40E1A4538@karlsbakk.net>
From: Roy Sigurd Karlsbakk <roy@karlsbakk.net>
In-Reply-To: <4A4286E1.9080004@gmail.com>
Mime-Version: 1.0 (Apple Message framework v935.3)
Subject: Re: [linux-lvm] Data deduplication for Linux : lessfs
Date: Wed, 24 Jun 2009 22:09:38 +0200
References: <4A42424B.1080208@gmail.com>
	<BE6893A3-3CF3-4B26-B23D-3951C1BF5034@karlsbakk.net>
	<4A4286E1.9080004@gmail.com>
Content-Transfer-Encoding: 8bit
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
Content-Type: text/plain; charset="utf-8"; format="flowed"; delsp="yes"
To: LVM general discussion and development <linux-lvm@redhat.com>

On 24. juni. 2009, at 22.04, Les Mikesell wrote:

> Roy Sigurd Karlsbakk wrote:
>> On 24. juni. 2009, at 17.12, Mark Ruijter wrote:
>>> For those who need OpenSource data deduplication today instead of
>>> tomorrow one might take a look at lessfs.
>>> http://www.lessfs.com
>> It's a good idea, but given the current traffic on the lessfs  
>> mailing list, I'm not sure if much work is done. I have been a  
>> member of that list since June 1 and haven't received more than one  
>> message, which was the one I wrote myself.
>>>
>>> I am thinking about starting to work on a data deduplicating
>>> blockdevice, a kernel module called blockless.
>> If done smartly, this may perhaps be possible, but the problem is  
>> the filesystem's metadata. Is this going to be dedup'ed? How much  
>> will this take? A simple backup will update atime on all the files  
>> backed up, and although atime isn't always wanted or needed, the  
>> problem occurs elsewhere.
>
> Block level deduplication isn't going to know/care about the  
> difference between file contents and metadata.  It is either stored  
> in blocks that match other blocks or not and the difference should  
> not be visible to the filesystem living on top of the block device.


My point exactly. If dedup was to be done on the block layer, you'd  
need flag to say "do not dedup this".

roy
--
Roy Sigurd Karlsbakk
(+47) 97542685
roy@karlsbakk.net
http://blogg.karlsbakk.net/
--
I all pedagogikk er det essensielt at pensum presenteres  
intelligibelt. Det er et element�rt imperativ for alle pedagoger �  
unng� eksessiv anvendelse av idiomer med fremmed opprinnelse. I de  
fleste tilfeller eksisterer adekvate og relevante synonymer p� norsk.
