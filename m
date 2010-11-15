Received: from mx1.redhat.com (ext-mx05.extmail.prod.ext.phx2.redhat.com
	[10.5.110.9])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id oAF2HlTk028224
	for <linux-lvm@redhat.com>; Sun, 14 Nov 2010 21:17:47 -0500
Received: from mail-fx0-f46.google.com (mail-fx0-f46.google.com
	[209.85.161.46])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id oAF2HXTo019812
	for <linux-lvm@redhat.com>; Sun, 14 Nov 2010 21:17:34 -0500
Received: by fxm6 with SMTP id 6so1445636fxm.33
	for <linux-lvm@redhat.com>; Sun, 14 Nov 2010 18:17:33 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <339142753.20101115022914@snet.sk>
References: <606057079.20101114024527@snet.sk>
	<AANLkTi=TdgXybQ_QREODKdrsyamot_cAHnrywom4bdxu@mail.gmail.com>
	<339142753.20101115022914@snet.sk>
From: Eugene Vilensky <evilensky@gmail.com>
Date: Sun, 14 Nov 2010 20:17:13 -0600
Message-ID: <AANLkTikGxC0yvY8Aqb4RS5mRorqfnyEzwHyPpFsk-sTD@mail.gmail.com>
Subject: Re: [linux-lvm] LVM volume umask change
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
Content-Transfer-Encoding: 7bit
Cc: LVM general discussion and development <linux-lvm@redhat.com>

2010/11/14 Marek Soha <marek@snet.sk>:
> Hehe :)
>
> You are joking, aren't you?
>
> Please look into lvm.conf and try to find umask part...
> System umask is set correctly and this issue is happening only in LVM
> mount.

This umask is for the files and directories that lvmtools create.
