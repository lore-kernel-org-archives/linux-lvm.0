Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62164C00140
	for <linux-lvm@archiver.kernel.org>; Mon,  8 Aug 2022 18:23:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1659982986;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=piWBtnqk00/uGJK9IahY7Y4WQ+A51TSi/rvdkOeeKXw=;
	b=V1qHQWUUTq7liZagBwYvp4mwR2/m/zSKYEF/zsOMwZijhyNreovFePQ+kEDu72BZ+R/NRD
	YBXIGxJl2IupZVEw8SlxjXRWTB5N3hCPV4gOgQnOMV/ffjyFxbMbCLwReMCM38pI1xGM+5
	2fn75H7tdUc29ccqgO5ZM7czYTE+zVM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-215-Z-7VAw_IM2m5xUwmlO3FeA-1; Mon, 08 Aug 2022 14:23:02 -0400
X-MC-Unique: Z-7VAw_IM2m5xUwmlO3FeA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D0C221035347;
	Mon,  8 Aug 2022 18:22:59 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3F2132166B2A;
	Mon,  8 Aug 2022 18:22:56 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id F11F81946A64;
	Mon,  8 Aug 2022 18:22:55 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id A46F41946A49
 for <linux-lvm@listman.corp.redhat.com>; Mon,  8 Aug 2022 18:15:16 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 853662026D64; Mon,  8 Aug 2022 18:15:16 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
 (mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 81C262026D4C
 for <linux-lvm@redhat.com>; Mon,  8 Aug 2022 18:15:16 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 67A9A1019DE2
 for <linux-lvm@redhat.com>; Mon,  8 Aug 2022 18:15:16 +0000 (UTC)
Received: from mail-41104.protonmail.ch (mail-41104.protonmail.ch
 [185.70.41.104]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-610-wGuIAurnMmiAwHcZVT9xmw-1; Mon, 08 Aug 2022 14:15:13 -0400
X-MC-Unique: wGuIAurnMmiAwHcZVT9xmw-1
Date: Mon, 08 Aug 2022 18:14:51 +0000
To: Zdenek Kabelac <zdenek.kabelac@gmail.com>
From: cd <cd@terminal.space>
Message-ID: <DsA-kai9sqaBsEnyYy0G8i3RWSSTHr2ww3B8Q6RtQSVh1uULit6cXAZC0dOf3GkwGBUwL8ievZojvSe1d5enC2pzSDBNTJzmWvPnDZ6Zbcg=@terminal.space>
In-Reply-To: <05af76bc-f2e5-e048-4cee-046a7a3fff6c@gmail.com>
References: <37yG0UFnzHTZ7-GIuAOuBTpDHSZJcVJ4ptbi_8EqOtSEECEfjYVz6XXafSGqH7Xh2NeCgynDhaXOdwakzIZp4WN-nGyyXmky3nZu2IP-5Jg=@terminal.space>
 <05af76bc-f2e5-e048-4cee-046a7a3fff6c@gmail.com>
Feedback-ID: 31246798:user:proton
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Subject: Re: [linux-lvm] Creating/restoring snapshots in early userspace
X-BeenThere: linux-lvm@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/linux-lvm>,
 <mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/linux-lvm/>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/linux-lvm>,
 <mailto:linux-lvm-request@redhat.com?subject=subscribe>
Reply-To: cd <cd@terminal.space>,
 LVM general discussion and development <linux-lvm@redhat.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>
Errors-To: linux-lvm-bounces@redhat.com
Sender: "linux-lvm" <linux-lvm-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

>
>
> Dne 07. 08. 22 v 22:38 cd napsal(a):
>
> > Hello,
> >
> > I have created some scripts which runs in the initramfs during the boot process. Very specifically, it's an initcpio runtime hook https://man.archlinux.org/man/mkinitcpio.8#ABOUT_RUNTIME_HOOKS
> > Question: Is this a supported environment which to create/restore snapshots?
> >
> > When my script runs lvm lvconvert --merge testvg/lvmautosnap-root-1659902622-good
> > it appears to succeed (exit code is 0, and the restore appears to work properly). However, the following warnings appear in stderr as part of the restore process:
> >
> > /usr/bin/dmeventd: stat failed: No such file or directory
> > WARNING: Failed to unmonitor testvg/lvmautosnap-root-1659902622-good.
> > /usr/bin/dmeventd: stat failed: No such file or directory
>
>
> Hi
>
> Your initramfs likely needs to contain 'modified' version of your system's
> lvm.conf where 'monitoring' will be disabled (set to 0) - as you do not want
> to start your monitoring while you are operating in your ramdisk.
>
> Once you flip to your rootfs with your regular /etc/lvm/lvm.conf - you need
> to start monitoring of you activated LVs (vgchange --monitor y)
>
> > Merging of volume testvg/lvmautosnap-root-1659902622-good started.
> > /run/lvm/lvmpolld.socket: connect failed: No such file or directory
>
>
> Again a thing you do not want to run in your ramdisk - lvmpolld is another
> service/daemon you should run while you are in your rootfs.
>
> fully removed.
>
> > And I get similar errors when trying to create new volumes with lvm lvcreate --permission=r --snapshot --monitor n --name my_snapshot
> > /usr/bin/dmeventd: stat failed: No such file or directory
> >
> > In summary, I'm happy to just ignore the warning messages. I just want to make sure I'm not risking the integrity of the lvm volumes by modifying them during this part of the boot process.
>
>
> It looks like you are trying to do something in your ramdisk you really should
> be doing once you flip to your rootfs - ramdisk is purely meant to be used
> to get things 'booting' and flip to rootfs ASAP - doing things in your
> ramdisk which is really not a 'working environment' sounds like you are
> asking yourself for some big troubles with resolving error paths (i.e. using
> unmonitored devices like 'snapshot/mirror/raids/thin...' for longer period of
> time is simply 'bad design/plan' - switch to rootfs should happen quickly
> after you initiate things in your initramdfs...
>
> Regards
>
> Zdenek

Thanks for the insightful response. Indeed, setting monitoring = 0 in lvm.conf makes the warning messages go away. Interestingly, on arch, the initcpio hook for lvm2 _does_ attempt to set this setting:
with sed -i '/^\smonitoring =/s/1/0/' "${BUILDROOT}/etc/lvm/lvm.conf"
https://github.com/archlinux/svntogit-packages/blob/packages/lvm2/trunk/lvm2_install#L38

However, the sed pattern fails to match because the line is commented out in lvm.conf.
I've filed a bug with arch to address this: https://bugs.archlinux.org/task/75552?project=1&string=lvm2

Thanks again!
Anil

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

