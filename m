Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j7NHDMV08717
	for <linux-lvm@redhat.com>; Tue, 23 Aug 2005 13:13:22 -0400
Received: from natnoddy.rzone.de (natnoddy.rzone.de [81.169.145.166])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id j7NHD7lk021455
	for <linux-lvm@redhat.com>; Tue, 23 Aug 2005 13:13:16 -0400
Received: from mail.mhnet.de (p54A33221.dip0.t-ipconnect.de [84.163.50.33])
	by post.webmailer.de (8.13.1/8.13.1) with ESMTP id j7NHD1w8020180
	for <linux-lvm@redhat.com>; Tue, 23 Aug 2005 19:13:02 +0200 (MEST)
Received: from mail.mhnet.de (localhost [127.0.0.1])
	by mail.mhnet.de (Postfix) with ESMTP id CC8E363DB86
	for <linux-lvm@redhat.com>; Tue, 23 Aug 2005 19:13:01 +0200 (CEST)
Date: Tue, 23 Aug 2005 19:13:01 +0200
From: Micha Holzmann <holzmann@mhnet.de>
Subject: Re: [linux-lvm] multiple snapshots
Message-ID: <20050823171301.GA8612@kaliba.pf.mhnet.de>
References: <4300816B.8060208@astral.ro> <430189C1.8030000@astral.ro>
	<430192F7.5010801@astral.ro> <430B25B9.8060207@astral.ro>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <430B25B9.8060207@astral.ro>
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
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

Imre Gergely wrote:
> 
> anybody anything? i still have this problem... the main question is: can
> one have multiple snapshots of the same LV, without problems? with one
> snapshot e ok, but as soon as i create another snapshot, and try to do
> something on the origin LV, it hangs, it oops-es.

Same on my machines, if more than one snapshot the system freezes after
a little time totally. Even the shutdown command does not work. I can
login via ssh an can see as many shutdown processes in ps list as i
issued. At the moment i assume that snapshots are not working as
expected or announced in the doku. These are my observations.

Best regards,
Micha Holzmann

-- 
Programmers don't die, they just GOSUB without RETURN.
