Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n5OJhk4J024539
	for <linux-lvm@redhat.com>; Wed, 24 Jun 2009 15:43:46 -0400
Received: from bigone.karlsbakk.net (karlsbakk.net [213.236.233.92])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n5OJhRel016043
	for <linux-lvm@redhat.com>; Wed, 24 Jun 2009 15:43:28 -0400
Received: from bigone.karlsbakk.net (localhost [127.0.0.1])
	by bigone.karlsbakk.net (Postfix) with ESMTP id 931452804A5D
	for <linux-lvm@redhat.com>; Wed, 24 Jun 2009 21:43:27 +0200 (CEST)
Received: from [IPv6:::1] (localhost [127.0.0.1])
	by bigone.karlsbakk.net (Postfix) with ESMTP id 9A42A2804A5C
	for <linux-lvm@redhat.com>; Wed, 24 Jun 2009 21:43:26 +0200 (CEST)
Message-Id: <5B37648E-D434-4E65-BE0F-1243C8959419@karlsbakk.net>
From: Roy Sigurd Karlsbakk <roy@karlsbakk.net>
In-Reply-To: <4A427DC4.7050805@gmail.com>
Mime-Version: 1.0 (Apple Message framework v935.3)
Subject: Re: [linux-lvm] Data deduplication for Linux : lessfs
Date: Wed, 24 Jun 2009 21:43:24 +0200
References: <4A42424B.1080208@gmail.com>
	<BE6893A3-3CF3-4B26-B23D-3951C1BF5034@karlsbakk.net>
	<4A427DC4.7050805@gmail.com>
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

On 24. juni. 2009, at 21.25, Mark Ruijter wrote:

> Hi Roy,
>>
>> It's a good idea, but given the current traffic on the lessfs  
>> mailing list, I'm not sure if much work is done. I have been a  
>> member of that list since June 1 and haven't received more than one  
>> message, which was the one I wrote myself.
>>
>
> Almost all the traffic is on the forum - open discussion.
> Only one person posted to the mailing list. ;-)

Why??
Mailing lists are so much easier to use. Instead of visiting a bunch  
of websites, they all sit in my mailbox.

>> If done smartly, this may perhaps be possible, but the problem is  
>> the filesystem's metadata. Is this going to be dedup'ed? How much  
>> will this take? A simple backup will update atime on all the files  
>> backed up, and although atime isn't always wanted or needed, the  
>> problem occurs elsewhere.
>
> Typically the meta data on production systems is approx 10%~20% of  
> the deduplicated stored data.
> Stored data is on my systems 40x less then the data written to the  
> filesystem.


The problems with metadata is not that they take up a lot of space,  
but that they are updated so regularly. As Greg Freemyer pointed out,  
relatime will help a lot, but still, deduplicating metadata may take  
up a serious amount of time because of the frequent updates.

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
