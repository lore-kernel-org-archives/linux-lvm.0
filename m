Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n5AIxQEb030681
	for <linux-lvm@redhat.com>; Wed, 10 Jun 2009 14:59:26 -0400
Received: from bigone.karlsbakk.net (karlsbakk.net [213.236.233.92])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n5AIxAoM016429
	for <linux-lvm@redhat.com>; Wed, 10 Jun 2009 14:59:10 -0400
Received: from bigone.karlsbakk.net (localhost [127.0.0.1])
	by bigone.karlsbakk.net (Postfix) with ESMTP id EFD3C2804F8E
	for <linux-lvm@redhat.com>; Wed, 10 Jun 2009 20:59:09 +0200 (CEST)
Received: from [IPv6:::1] (localhost [127.0.0.1])
	by bigone.karlsbakk.net (Postfix) with ESMTP id C2DCB2804F7F
	for <linux-lvm@redhat.com>; Wed, 10 Jun 2009 20:59:09 +0200 (CEST)
Message-Id: <38673305-3BDC-49F8-A04A-F327034D9D59@karlsbakk.net>
From: Roy Sigurd Karlsbakk <roy@karlsbakk.net>
In-Reply-To: <4A30015D.1010409@gmail.com>
Mime-Version: 1.0 (Apple Message framework v935.3)
Subject: Re: [linux-lvm] Data deduplication in LVM?
Date: Wed, 10 Jun 2009 20:59:09 +0200
References: <4855BFEA-C772-4B98-A18E-C406FD5737DD@karlsbakk.net>
	<4A30015D.1010409@gmail.com>
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

On 10. juni. 2009, at 20.54, Les Mikesell wrote:

> Roy Sigurd Karlsbakk wrote:
>> Hi all
>> I've been reading up a little about data deduplication, and have  
>> been in search for an OSS filesystem with dedup without much luck.  
>> While testing snapshots and so on in LVM, I started wondering if  
>> dedup would be better off in LVM than in the filesystem. Would it  
>> be possible/efficient to add dedup to the LVM layer, or perhaps a  
>> layer above LVM? This could make dedup work for all or most of  
>> filesystems. Make a hash table with 4k (or whatever) blocks, make  
>> virtual blocks pointing to the physical blocks and run a remapping/ 
>> deduping job at night. If written to, copy-on-write could be used  
>> to increase speed.
>> Is this nonsense, or might it be an idea?
>
> This is "supposed" to be coming in the next OpenSolaris/ZFS release  
> (per the roadmap with the just-released 2009.06 version).


What about Linux/LVM? Or did I misunderstand you?

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
