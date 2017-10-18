Received: from mx1.redhat.com (ext-mx10.extmail.prod.ext.phx2.redhat.com
	[10.5.110.39])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B4D8560C16
	for <linux-lvm@redhat.com>; Wed, 18 Oct 2017 05:36:10 +0000 (UTC)
Received: from homiemail-a51.g.dreamhost.com (sub5.mail.dreamhost.com
	[208.113.200.129])
	(using TLSv1.1 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9994A33A170
	for <linux-lvm@redhat.com>; Wed, 18 Oct 2017 05:36:09 +0000 (UTC)
Received: from homiemail-a51.g.dreamhost.com (localhost [127.0.0.1])
	by homiemail-a51.g.dreamhost.com (Postfix) with ESMTP id D624E6004519
	for <linux-lvm@redhat.com>; Tue, 17 Oct 2017 22:36:08 -0700 (PDT)
Received: from [192.168.0.102] (livid.ministerer.volia.net [93.75.41.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: tanstaafl@libertytrek.org)
	by homiemail-a51.g.dreamhost.com (Postfix) with ESMTPSA id 3292F600450E
	for <linux-lvm@redhat.com>; Tue, 17 Oct 2017 22:36:07 -0700 (PDT)
References: <cdc20ea7-200b-d998-a7f5-85ed622e84e2@yahoo.co.uk>
	<23013.8606.182033.796766@quad.stoffel.home>
	<4195b442-7241-1415-64bd-c626e0e7f4ef@yahoo.co.uk>
	<alpine.LRH.2.21.1710171644400.1285@fairfax.gathman.org>
From: Tanstaafl <tanstaafl@libertytrek.org>
Message-ID: <b3ac5f10-c2f5-621b-71bc-151ae3114827@libertytrek.org>
Date: Wed, 18 Oct 2017 01:36:02 -0400
MIME-Version: 1.0
In-Reply-To: <alpine.LRH.2.21.1710171644400.1285@fairfax.gathman.org>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] raid10 to raid what? - convert
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
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@redhat.com

On 10/17/2017, 4:57:10 PM, Stuart D. Gathman <stuart@gathman.org> wrote:
> First off, raid10 is a linux specialty (I didn't know LVM supported it,
> thanks!),

Eh? Not sure what you mean by that, RAID10 is used by many hardware RAID
controllers, so is certainly not some kind of esoteric linux
'specialty', unless I misunderstood.

I've been using RAID10 exclusively for over 10 years ever since I
narrowly avoided a major catastrophe with RAID5.

> and is not the same as raid1+0 (raid1 on top of raid0).

Not according to everything I've ever read about it... for example:

http://www.thegeekstuff.com/2011/10/raid10-vs-raid01

> But this is not certain as raid10 works perfectly well with 2 or 3
> disks, including the redundancy.
You must be talking about something else... RAID10 requires at least 4
disks, and always an even number, although most RAID controllers support
the designation of at least one hot spare (so it will auto-rebuild using
the hot spare in the event of a failure). Been using this configuration
in my 5 drive QNAP NAS's for along time.
