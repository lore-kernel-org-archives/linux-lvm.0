Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n5AJ52sQ002432
	for <linux-lvm@redhat.com>; Wed, 10 Jun 2009 15:05:02 -0400
Received: from bigone.karlsbakk.net (karlsbakk.net [213.236.233.92])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n5AJ4k6o019560
	for <linux-lvm@redhat.com>; Wed, 10 Jun 2009 15:04:46 -0400
Received: from bigone.karlsbakk.net (localhost [127.0.0.1])
	by bigone.karlsbakk.net (Postfix) with ESMTP id 1B50928050C2
	for <linux-lvm@redhat.com>; Wed, 10 Jun 2009 21:04:46 +0200 (CEST)
Received: from [IPv6:::1] (localhost [127.0.0.1])
	by bigone.karlsbakk.net (Postfix) with ESMTP id EA30A2804FDF
	for <linux-lvm@redhat.com>; Wed, 10 Jun 2009 21:04:45 +0200 (CEST)
Message-Id: <BB1D8FC0-E624-4B3A-A270-AA05E765B241@karlsbakk.net>
From: Roy Sigurd Karlsbakk <roy@karlsbakk.net>
In-Reply-To: <4855BFEA-C772-4B98-A18E-C406FD5737DD@karlsbakk.net>
Mime-Version: 1.0 (Apple Message framework v935.3)
Subject: Re: [linux-lvm] Data deduplication in LVM?
Date: Wed, 10 Jun 2009 21:04:45 +0200
References: <4855BFEA-C772-4B98-A18E-C406FD5737DD@karlsbakk.net>
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

On 10. juni. 2009, at 20.41, Roy Sigurd Karlsbakk wrote:

> Hi all
>
> I've been reading up a little about data deduplication, and have  
> been in search for an OSS filesystem with dedup without much luck.  
> While testing snapshots and so on in LVM, I started wondering if  
> dedup would be better off in LVM than in the filesystem. Would it be  
> possible/efficient to add dedup to the LVM layer, or perhaps a layer  
> above LVM? This could make dedup work for all or most of  
> filesystems. Make a hash table with 4k (or whatever) blocks, make  
> virtual blocks pointing to the physical blocks and run a remapping/ 
> deduping job at night. If written to, copy-on-write could be used to  
> increase speed.


Answering myself, it seems there can be a problem with this without a  
rather large change in the APIs. If I understand it correctly, if  
metadata is deduplicated, it may impose a rather large performance  
impact on writes, and from the block layer, how do you know what's  
metadata and what's not?

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
