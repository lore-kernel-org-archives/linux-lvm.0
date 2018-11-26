Received: from mx1.redhat.com (ext-mx19.extmail.prod.ext.phx2.redhat.com
	[10.5.110.48])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E1C6860141
	for <linux-lvm@redhat.com>; Mon, 26 Nov 2018 07:25:37 +0000 (UTC)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
	[209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 72A76307D931
	for <linux-lvm@redhat.com>; Mon, 26 Nov 2018 07:25:36 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id p17so12724199lfh.4
	for <linux-lvm@redhat.com>; Sun, 25 Nov 2018 23:25:36 -0800 (PST)
MIME-Version: 1.0
References: <90473b46-274c-55af-3887-f058f2cf05dd@gmail.com>
In-Reply-To: <90473b46-274c-55af-3887-f058f2cf05dd@gmail.com>
From: Jack Wang <jack.wang.usish@gmail.com>
Date: Mon, 26 Nov 2018 08:25:21 +0100
Message-ID: <CA+res+RFOnZczi4_jWess1JabXr-yOO9O4O95EP6VzYqUK9hNw@mail.gmail.com>
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] LVM RAID: task mdX_raid1:221 blocked for more than
 120 seconds
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
Content-Type: text/plain; charset="utf-8"
To: LVM general discussion and development <linux-lvm@redhat.com>, linux-raid <linux-raid@vger.kernel.org>

+cc linux-raid

The call trace looks kinds of deadlock in raid
Cesare Leonardi <celeonar@gmail.com> 于2018年11月25日周日 上午12:31写道：
>
> Since my message did not reach the list, I'm resending, but first I've
> subscribed myself.
>
> ------------------
> Hello, I'm writing here to have your opinion and possibly some advice
> about some Debian bugs related to LVM RAID that are still unresolved:
> https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=913119
> https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=913138
> https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=904822
>
> Bug #913119 was filed by me, so I can personally provide some more
> information and do tests.
>
> Premises related di Debian unstable:
> * Debian's kernel is currently 4.18.20.
> * From kernel 4.17~rc7 Debian enabled SCSI_MQ_DEFAULT and DM_MQ_DEFAULT.
> * Debian's LVM userland is 2.02.176
>
> The above reports shows blocked I/O with different type of LVM RAID and
> with #913119 I've succesfully workarounded passing the following kernel
> parameters:
> scsi_mod.use_blk_mq=0 dm_mod.use_blk_mq=0
>
> I've read that RHEL will default to enabling SCSI_MQ_DEFAULT and
> DM_MQ_DEFAULT and will use kernel 4.18. Maybe you have already
> encountered this bug and it's already resolved. Or there are patches
> pending.
>
> What do you think? Should I file a bug in Red Hat bug tracker?
>
> Cesare.
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
