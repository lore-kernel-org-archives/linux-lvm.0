Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1645CC19F2A
	for <linux-lvm@archiver.kernel.org>; Sun,  7 Aug 2022 20:46:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1659905183;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=GZzKjXzQIdocB0n27No1nbCtJ4CGHq44Czb6cBSHP+o=;
	b=Xbd1vFR6wVX2q9FgCfwiEHfrPj/00+BPH4HZ8e99YJKIzJDI3E/jRZNPc0vbCYZSQrtiUI
	9ekJhIedxW1GVM8RsJqSBIBEj5yrDHftkrdYPXuuznQeh18KQRAe+puaVno18OtPlbqZb1
	4PXAhgIvw8yD+PN7gR7Zt86PtCzbX80=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-609-i-a7KUFdNCG_Jre0sRsSlg-1; Sun, 07 Aug 2022 16:46:20 -0400
X-MC-Unique: i-a7KUFdNCG_Jre0sRsSlg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 82BA180A0BF;
	Sun,  7 Aug 2022 20:46:17 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E52C21410DDA;
	Sun,  7 Aug 2022 20:46:01 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 903341946A55;
	Sun,  7 Aug 2022 20:46:01 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 5FDE61946A41
 for <linux-lvm@listman.corp.redhat.com>; Sun,  7 Aug 2022 20:46:00 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 51D0C1410DDA; Sun,  7 Aug 2022 20:46:00 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
 (mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4DD051400C30
 for <linux-lvm@redhat.com>; Sun,  7 Aug 2022 20:46:00 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 34D22801585
 for <linux-lvm@redhat.com>; Sun,  7 Aug 2022 20:46:00 +0000 (UTC)
Received: from mail-41104.protonmail.ch (mail-41104.protonmail.ch
 [185.70.41.104]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-335-tcwP67MrPeq-VxVipDulKg-1; Sun, 07 Aug 2022 16:45:56 -0400
X-MC-Unique: tcwP67MrPeq-VxVipDulKg-1
Date: Sun, 07 Aug 2022 20:38:42 +0000
To: "linux-lvm@redhat.com" <linux-lvm@redhat.com>
From: cd <cd@terminal.space>
Message-ID: <37yG0UFnzHTZ7-GIuAOuBTpDHSZJcVJ4ptbi_8EqOtSEECEfjYVz6XXafSGqH7Xh2NeCgynDhaXOdwakzIZp4WN-nGyyXmky3nZu2IP-5Jg=@terminal.space>
Feedback-ID: 31246798:user:proton
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Subject: [linux-lvm] Creating/restoring snapshots in early userspace
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
Errors-To: linux-lvm-bounces@redhat.com
Sender: "linux-lvm" <linux-lvm-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hello,

I have created some scripts which runs in the initramfs during the boot process. Very specifically, it's an initcpio runtime hook https://man.archlinux.org/man/mkinitcpio.8#ABOUT_RUNTIME_HOOKS
Question: Is this a supported environment which to create/restore snapshots?

When my script runs lvm lvconvert --merge testvg/lvmautosnap-root-1659902622-good
it appears to succeed (exit code is 0, and the restore appears to work properly). However, the following warnings appear in stderr as part of the restore process:

/usr/bin/dmeventd: stat failed: No such file or directory
WARNING: Failed to unmonitor testvg/lvmautosnap-root-1659902622-good.
/usr/bin/dmeventd: stat failed: No such file or directory
WARNING: Failed to unmonitor testvg/lvmautosnap-root-1659902707-pending-2.
/usr/bin/dmeventd: stat failed: No such file or directory
WARNING: Failed to monitor testvg/lvmautosnap-root-1659902707-pending-2.
Merging of volume testvg/lvmautosnap-root-1659902622-good started.
/run/lvm/lvmpolld.socket: connect failed: No such file or directory
WARNING: Failed to connect to lvmpolld. Proceeding with polling without using lvmpolld.
WARNING: Check global/use_lvmpolld in lvm.conf or the lvmpolld daemon state.
testvg/root: Merged: 97.92%
testvg/root: Merged: 100.00%
Merge of snapshot into logical volume testvg/root has finished.
/usr/bin/dmeventd: stat failed: No such file or directory
WARNING: Failed to unmonitor testvg/lvmautosnap-root-1659902707-pending-2.
/usr/bin/dmeventd: stat failed: No such file or directory
WARNING: Failed to monitor testvg/lvmautosnap-root-1659902707-pending-2.
Logical volume "lvmautosnap-root-1659902622-good" successfully removed.

And I get similar errors when trying to create new volumes with lvm lvcreate --permission=r --snapshot --monitor n --name my_snapshot
 /usr/bin/dmeventd: stat failed: No such file or directory
WARNING: Failed to unmonitor testvg/lvmautosnap-root-1659902707-pending-2.
Logical volume "lvmautosnap-root-1659903385-pending" created.'
+ lvm_handle_error 0 '  /usr/bin/dmeventd: stat failed: No such file or directory
WARNING: Failed to unmonitor testvg/lvmautosnap-root-1659902707-pending-2.
Logical volume "lvmautosnap-root-1659903385-pending" created

I have noticed the --monitor n option exists for lvcreate, and that does seem to cut down on the error messages. However, trying to use the --driverloaded n flag always fails,
with a message like "Failed to find logical volume".

In summary, I'm happy to just ignore the warning messages. I just want to make sure I'm not risking the integrity of the lvm volumes by modifying them during this part of the boot process.

Kindly,
Anil Kulkarni

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

