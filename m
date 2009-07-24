Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n6OCcCCd017964
	for <linux-lvm@redhat.com>; Fri, 24 Jul 2009 08:38:12 -0400
Received: from bigone.karlsbakk.net (karlsbakk.net [213.236.233.92])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id n6OCbuDk001907
	for <linux-lvm@redhat.com>; Fri, 24 Jul 2009 08:37:56 -0400
Received: from bigone.karlsbakk.net (localhost [127.0.0.1])
	by bigone.karlsbakk.net (Postfix) with ESMTP id 6BC0E2804A65
	for <linux-lvm@redhat.com>; Fri, 24 Jul 2009 14:37:55 +0200 (CEST)
Received: from [IPv6:::1] (localhost [127.0.0.1])
	by bigone.karlsbakk.net (Postfix) with ESMTP id 4B4212804A64
	for <linux-lvm@redhat.com>; Fri, 24 Jul 2009 14:37:55 +0200 (CEST)
Message-Id: <D9F5ECBD-38D9-4526-8021-40B0F26E09AE@karlsbakk.net>
From: Roy Sigurd Karlsbakk <roy@karlsbakk.net>
In-Reply-To: <e61979140907240521w4d4257a7q7aed92f7bb31c1df@mail.gmail.com>
Mime-Version: 1.0 (Apple Message framework v935.3)
Subject: Re: [linux-lvm] lvm or raid 0?
Date: Fri, 24 Jul 2009 14:37:55 +0200
References: <e61979140907240521w4d4257a7q7aed92f7bb31c1df@mail.gmail.com>
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

On 24. juli. 2009, at 14.21, vishesh kumar wrote:

> Dear all
>
>     Is is true that LVM use RAID 0 ?

LVM /may/ use RAID 0 if you tell it to

>    Does RAID 0 is more reliable than LVM ?


RAID 0 with md or LVM will give you approxmately the same performance  
gain and the same level of reliability; it works like hell until a  
drive dies, then it all dies. Don't use it unless you know what you're  
doing.

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
