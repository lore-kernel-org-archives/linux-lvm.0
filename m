Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n6SCcO2P006813
	for <linux-lvm@redhat.com>; Tue, 28 Jul 2009 08:38:24 -0400
Received: from bigone.karlsbakk.net (karlsbakk.net [213.236.233.92])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n6SCc8Fd001269
	for <linux-lvm@redhat.com>; Tue, 28 Jul 2009 08:38:08 -0400
Received: from bigone.karlsbakk.net (localhost [127.0.0.1])
	by bigone.karlsbakk.net (Postfix) with ESMTP id 24D7E2804A76
	for <linux-lvm@redhat.com>; Tue, 28 Jul 2009 14:38:07 +0200 (CEST)
Received: from [IPv6:::1] (localhost [127.0.0.1])
	by bigone.karlsbakk.net (Postfix) with ESMTP id 17E032804A75
	for <linux-lvm@redhat.com>; Tue, 28 Jul 2009 14:38:07 +0200 (CEST)
Message-Id: <52F0ADF3-B499-4EE4-BDA1-B8DED2C9BD42@karlsbakk.net>
From: Roy Sigurd Karlsbakk <roy@karlsbakk.net>
In-Reply-To: <20090727135628.GA3782@us.ibm.com>
Mime-Version: 1.0 (Apple Message framework v935.3)
Subject: Re: [linux-lvm] Mirroring implementation
Date: Tue, 28 Jul 2009 14:38:06 +0200
References: <29ae894c0907260312m3b2ffb2ex5cbef456f3c49bee@mail.gmail.com>
	<20090727135628.GA3782@us.ibm.com>
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

On 27. juli. 2009, at 15.56, malahal@us.ibm.com wrote:

> It writes in parallel. Reads from a single device (switches on a  
> device
> failure only).


Wouldn't it be better to read in parallel, from different places? I've  
heard some controllers can do this, so that the reading will be  
somehow like reading from a RAID-0 stripe.

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
