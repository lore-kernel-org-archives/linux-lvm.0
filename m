Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37F11C76196
	for <linux-lvm@archiver.kernel.org>; Tue, 11 Apr 2023 13:33:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1681219982;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=UR0N4JOUZxKUzawLrNX15tmLtnzGTEcIVwGwrydlZAk=;
	b=eTClHfQ4IZvTOpcMc4AvjBqwstvy4rwjP/TUxX7YpYyQnEgeSZWE6K4t7wqhHJa/dTq6xF
	XqQrbNIXL1IUQ9OJDlvQAoFkcaULZ/G224M4S5DIiiBlP121cB9o/LX7g8drVmc2LeOojg
	7eF2n0DLjK2TXzjHKBiRUfqKHrps3e4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-235-VyqBgVSNP7iIj9hHyRwVkw-1; Tue, 11 Apr 2023 09:32:00 -0400
X-MC-Unique: VyqBgVSNP7iIj9hHyRwVkw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3E53A88B7A0;
	Tue, 11 Apr 2023 13:31:52 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8CE722166B30;
	Tue, 11 Apr 2023 13:31:49 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 678CB1946A40;
	Tue, 11 Apr 2023 13:31:49 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 3200E1946586
 for <linux-lvm@listman.corp.redhat.com>; Tue, 11 Apr 2023 13:31:48 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 11D0A2166B31; Tue, 11 Apr 2023 13:31:48 +0000 (UTC)
Received: from redhat.com (null.msp.redhat.com [10.15.80.136])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D38192166B30;
 Tue, 11 Apr 2023 13:31:47 +0000 (UTC)
Date: Tue, 11 Apr 2023 08:31:48 -0500
From: David Teigland <teigland@redhat.com>
To: Zhiyong Ye <yezhiyong@bytedance.com>
Message-ID: <20230411133147.GB27598@redhat.com>
References: <ac0f39c8-932d-293a-b7aa-568532bda22a@bytedance.com>
MIME-Version: 1.0
In-Reply-To: <ac0f39c8-932d-293a-b7aa-568532bda22a@bytedance.com>
User-Agent: Mutt/1.8.3 (2017-05-23)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Subject: Re: [linux-lvm] How to convert a single path to a multipath after
 using dm-multipath
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
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>
Errors-To: linux-lvm-bounces@redhat.com
Sender: "linux-lvm" <linux-lvm-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Apr 11, 2023 at 01:29:42PM +0800, Zhiyong Ye wrote:
> and lv on it. I then turn on the multipath function and merge the two paths
> into a new device (/dev/mapper/matha), and I get the following error when I
> execute the lvm command.
> 
> # pvs
> WARNING: Not using device /dev/mapper/matha for PV
> HgL3xR-qTio-m75Q-nGAO-Un0U-8uHk-wHbH25.
> WARNING: PV HgL3xR-qTio-m75Q-nGAO-Un0U-8uHk-wHbH25 prefers device /dev/sda
> because device is used by LV.
> PV           VG                      Fmt  Attr PSize  PFree
> /dev/sda     is-he57e6mr4wemb19kgf8i lvm2 a--  10.00t 9.98t

> May you please advise how one can convert the pv used by vg from sda to
> matha without affecting the current lv usage.

lvchange --refresh should refresh the active LV to use mpatha.  To avoid
this, you might configure mpath on sda alone prior to adding the second
path.

Dave
_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

