Received: from mx1.redhat.com (ext-mx02.extmail.prod.ext.phx2.redhat.com
	[10.5.110.26])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2463B9D7A5
	for <linux-lvm@redhat.com>; Thu, 31 Aug 2017 19:36:13 +0000 (UTC)
Received: from mail.stoffel.org (mail.stoffel.org [104.236.43.127])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5146180C11
	for <linux-lvm@redhat.com>; Thu, 31 Aug 2017 19:36:12 +0000 (UTC)
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Message-ID: <22952.25484.926754.730502@quad.stoffel.home>
Date: Thu, 31 Aug 2017 15:29:16 -0400
From: "John Stoffel" <john@stoffel.org>
In-Reply-To: <dc1799b9-07ff-b0b9-d152-4102d878422e@redhat.com>
References: <CABWX_dqg3za8oGq9-ohoCvDiJbmLs36Jgqy2a6NSa82Gxrr8tg@mail.gmail.com>
	<ebead878-135f-a69c-455a-0c08e4947996@redhat.com>
	<20170829162340.GB12503@redhat.com>
	<CABWX_dqRON_r+NdkUKT7FKjKbqxYG2gE4J=LbMQc6Mxx4O2Dxw@mail.gmail.com>
	<dc1799b9-07ff-b0b9-d152-4102d878422e@redhat.com>
Subject: Re: [linux-lvm] Distributed Locking of LVM
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
To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: Kalyana sundaram <kalyanceg@gmail.com>

>>>>> "Zdenek" == Zdenek Kabelac <zkabelac@redhat.com> writes:

Zdenek> Dne 31.8.2017 v 08:32 Kalyana sundaram napsal(a):
>> Thanks all people
>> I understand reboot/fencing is mandatory
>> I hope the visibility might be better in external locking tool like redis
>> With lvmlockd I find no deb available for ubuntu, and documentations for clvm 
>> to handle an issue is difficult to find

Zdenek> Unfortunately Debian based distros are not 'the best fit' for
Zdenek> anything lvm2 related and it's not lvm2 fault ;) and it's
Zdenek> pretty hard to fix....

Can you please elaborate on this?  I use Debian distros by
preference. Is it because they've changed stuff to fit the debian
ideals too much?  

John
