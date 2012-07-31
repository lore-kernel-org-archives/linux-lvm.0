Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.18])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id q6VA2Xqx012819
	for <linux-lvm@redhat.com>; Tue, 31 Jul 2012 06:02:33 -0400
Received: from mail.gdp-group.com (mail.gdp-group.com [212.79.9.154])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q6VA2UqX021177
	for <linux-lvm@redhat.com>; Tue, 31 Jul 2012 06:02:32 -0400
Received: from localhost (localhost [127.0.0.1])
	by mail.gdp-group.com (Postfix) with ESMTP id 8F9A86C350B
	for <linux-lvm@redhat.com>; Tue, 31 Jul 2012 12:02:28 +0200 (CEST)
Received: from mail.gdp-group.com ([127.0.0.1])
	by localhost (mail.gdp-group.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 19749-02 for <linux-lvm@redhat.com>;
	Tue, 31 Jul 2012 12:02:26 +0200 (CEST)
Received: from [195.27.99.205] (unknown [195.27.99.205])
	by mail.gdp-group.com (Postfix) with ESMTP id EF5ED914AD2
	for <linux-lvm@redhat.com>; Tue, 31 Jul 2012 12:02:25 +0200 (CEST)
Message-ID: <5017AD32.8010300@gdp-group.com>
Date: Tue, 31 Jul 2012 12:02:26 +0200
From: andreas nastke <nastke@gdp-group.com>
MIME-Version: 1.0
References: <5016DD33.3050000@profihost.ag>	<CANN7Ug1O7oJiqK8OZpT9uqZoDXoa6Q048ZtMWNn34CEWQgu-TQ@mail.gmail.com>
	<50177A60.7020707@profihost.ag>
In-Reply-To: <50177A60.7020707@profihost.ag>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] how to online resize pv?
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

how about

- create new part on other drive
- add that to vg
- pvmove part 2 to other drive
- remove part2 from vg
- pvremove part 2
- delete part 2
- create new (larger) part 2
- partprobe
- then add new part to vg and 'pvmove' back

andreas

Stefan Priebe schrieb:
> Am 30.07.2012 21:25, schrieb Scott Merrilees:
>> partprobe ?
> 
> does not work when the partition is mounted
> 
> Stefan
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
