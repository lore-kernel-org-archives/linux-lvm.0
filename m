Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n5BAKCkN029261
	for <linux-lvm@redhat.com>; Thu, 11 Jun 2009 06:20:12 -0400
Received: from bigone.karlsbakk.net (karlsbakk.net [213.236.233.92])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n5BAJuMJ018522
	for <linux-lvm@redhat.com>; Thu, 11 Jun 2009 06:19:56 -0400
Received: from bigone.karlsbakk.net (localhost [127.0.0.1])
	by bigone.karlsbakk.net (Postfix) with ESMTP id 8949E2804FA8
	for <linux-lvm@redhat.com>; Thu, 11 Jun 2009 12:19:55 +0200 (CEST)
Received: from [IPv6:::1] (localhost [127.0.0.1])
	by bigone.karlsbakk.net (Postfix) with ESMTP id 776C62804F8E
	for <linux-lvm@redhat.com>; Thu, 11 Jun 2009 12:19:55 +0200 (CEST)
Message-Id: <0CCC4321-943D-406A-A1BB-48E2BD6B0857@karlsbakk.net>
From: Roy Sigurd Karlsbakk <roy@karlsbakk.net>
In-Reply-To: <Pine.LNX.4.64.0906101822350.30724@bmsred.bmsi.com>
Mime-Version: 1.0 (Apple Message framework v935.3)
Subject: Re: [linux-lvm] Data deduplication in LVM?
Date: Thu, 11 Jun 2009 12:19:55 +0200
References: <4855BFEA-C772-4B98-A18E-C406FD5737DD@karlsbakk.net>
	<Pine.LNX.4.64.0906101822350.30724@bmsred.bmsi.com>
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

On 11. juni. 2009, at 00.30, Stuart D. Gathman wrote:

> One OSS backup product that does
> deduplication is BackupPC (written in Perl).  In the backup server,  
> every file
> gets hard linked to a name in a special directory that is its md5  
> checksum
> (plus some fiddly logic to handle metadata)


This sounds like file-level deduplication. Most storage systems sing  
dedup, uses block-level dedup. NetApp is one example; they dedup  
everything with 4k blocks, doing the actual deduplication at night.

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
