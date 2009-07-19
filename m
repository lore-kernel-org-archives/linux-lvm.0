Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n6JGdV80015718
	for <linux-lvm@redhat.com>; Sun, 19 Jul 2009 12:39:31 -0400
Received: from bigone.karlsbakk.net (karlsbakk.net [213.236.233.92])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n6JGdFNM014864
	for <linux-lvm@redhat.com>; Sun, 19 Jul 2009 12:39:15 -0400
Received: from bigone.karlsbakk.net (localhost [127.0.0.1])
	by bigone.karlsbakk.net (Postfix) with ESMTP id 1D98B2804A5E
	for <linux-lvm@redhat.com>; Sun, 19 Jul 2009 18:39:14 +0200 (CEST)
Received: from [IPv6:::1] (localhost [127.0.0.1])
	by bigone.karlsbakk.net (Postfix) with ESMTP id 01F032803364
	for <linux-lvm@redhat.com>; Sun, 19 Jul 2009 18:39:13 +0200 (CEST)
Message-Id: <C6D45487-DB5B-40EA-AFEF-D2A0D81FB096@karlsbakk.net>
From: Roy Sigurd Karlsbakk <roy@karlsbakk.net>
In-Reply-To: <4A5CEA53.8010604@cox.net>
Mime-Version: 1.0 (Apple Message framework v935.3)
Subject: Re: [linux-lvm] question about lvcreate --stripesize
Date: Sun, 19 Jul 2009 18:39:13 +0200
References: <4A5CEA53.8010604@cox.net>
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

On 14. juli. 2009, at 22.28, Ron Johnson wrote:

> Does setting this make a multi-PV LV act like a RAID-0 stripeset?


IIRC LVA will stripe by default if laid on > 1 PV.

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
