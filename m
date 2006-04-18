Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.11.6) with ESMTP id
	k3IIQrZb024431
	for <linux-lvm@redhat.com>; Tue, 18 Apr 2006 14:26:53 -0400
Received: from merlin.prohost.de (merlin.prohost.de [216.71.84.194])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k3IIQfdj000773
	for <linux-lvm@redhat.com>; Tue, 18 Apr 2006 14:26:43 -0400
Received: from www.jdcassidy.net (localhost [127.0.0.1])
	by merlin.prohost.de (8.11.6/8.11.6) with ESMTP id k3IIQdY10245
	for <linux-lvm@redhat.com>; Tue, 18 Apr 2006 20:26:39 +0200
Message-ID: <51656.83.181.109.47.1145384799.squirrel@www.jdcassidy.net>
In-Reply-To: <4445294D.6050500@conterra.de>
References: <AAB83747-D6F3-4148-9836-7E22B8AD9ABF@isg.si>
	<4445294D.6050500@conterra.de>
Date: Tue, 18 Apr 2006 20:26:39 +0200 (CEST)
Subject: Re: [linux-lvm] physical volume smaller than partition?
From: "John Cassidy" <Sean@JDCassidy.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Reply-To: Sean@JDCassidy.net,
	LVM general discussion and development <linux-lvm@redhat.com>
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
To: LVM general discussion and development <linux-lvm@redhat.com>

http://www.europeunited.org





Was denkst Du??


> Martin Gombac wrote
>> and noticed 277.60 GB != 291.08..GB. So my question is where did the
>> rest of disk space went to?
>
> it depends on counting "kilo" as 1000 or 1024.
> This happens even twice for kb -> mb -> gb.
>
> Thus:  277.60 * 1.024 * 1.024 = 291.08
>
> Memory capacity is calculated using 1024 where as disk manufacturer
> like using 1000, as this results in bigger numbers
> (but does not result in more space :-(
>
> Dieter.
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>


John Cassidy (Dipl.-Ingr.)

Berninastrasse 9

8057 Zuerich

Europe

Telephone: +41 (0) 43 300 4602

Mobile:    +41 (0) 79 207 3268

HTTP: www.JDCassidy.net / www.Eurological.eu
