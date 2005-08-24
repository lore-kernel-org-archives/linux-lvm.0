Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j7ODmXV25106
	for <linux-lvm@redhat.com>; Wed, 24 Aug 2005 09:48:33 -0400
Received: from mail.astral.ro (mail.astral.ro [193.230.240.11])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id j7ODmOBa008006
	for <linux-lvm@redhat.com>; Wed, 24 Aug 2005 09:48:25 -0400
Received: from 127.0.0.1 (localhost.localdomain [127.0.0.1])
	by mail.astral.ro (Postfix) with SMTP id D657B305E2
	for <linux-lvm@redhat.com>; Wed, 24 Aug 2005 16:48:16 +0300 (EEST)
Received: from [192.168.25.222] (dummy.cluj.astral.ro [193.230.240.25])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.astral.ro (Postfix) with ESMTP id D13D9305C0
	for <linux-lvm@redhat.com>; Wed, 24 Aug 2005 16:48:16 +0300 (EEST)
Message-ID: <430C7AA0.4010000@astral.ro>
Date: Wed, 24 Aug 2005 16:48:16 +0300
From: Imre Gergely <imre.gergely@astral.ro>
MIME-Version: 1.0
Subject: Re: [linux-lvm] multiple snapshots
References: <4300816B.8060208@astral.ro>
	<430189C1.8030000@astral.ro>	<430192F7.5010801@astral.ro>
	<430B25B9.8060207@astral.ro>
	<20050823171301.GA8612@kaliba.pf.mhnet.de>
In-Reply-To: <20050823171301.GA8612@kaliba.pf.mhnet.de>
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>


Micha Holzmann wrote:
> Imre Gergely wrote:
> 
>>anybody anything? i still have this problem... the main question is: can
>>one have multiple snapshots of the same LV, without problems? with one
>>snapshot e ok, but as soon as i create another snapshot, and try to do
>>something on the origin LV, it hangs, it oops-es.
> 
> 
> Same on my machines, if more than one snapshot the system freezes after
> a little time totally. Even the shutdown command does not work. I can
> login via ssh an can see as many shutdown processes in ps list as i
> issued. At the moment i assume that snapshots are not working as
> expected or announced in the doku. These are my observations.

i tried on a real machine, the same thing happened. the only thing
different is that i don't see any oopses, or any error messages
indicating that something is wrong...
