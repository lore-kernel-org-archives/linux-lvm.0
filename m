Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 481AEC433F5
	for <linux-lvm@archiver.kernel.org>; Thu,  6 Jan 2022 14:42:56 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-549-WnnUVCKKOoCwRcfKQTdqjA-1; Thu, 06 Jan 2022 09:42:50 -0500
X-MC-Unique: WnnUVCKKOoCwRcfKQTdqjA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2F8501923B82;
	Thu,  6 Jan 2022 14:42:43 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B627779529;
	Thu,  6 Jan 2022 14:42:38 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 864561809CB8;
	Thu,  6 Jan 2022 14:42:21 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
	[10.11.54.9])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 206EgGxe027950 for <linux-lvm@listman.util.phx.redhat.com>;
	Thu, 6 Jan 2022 09:42:16 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 83D73492D4A; Thu,  6 Jan 2022 14:42:16 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7FFB6492D1F
	for <linux-lvm@redhat.com>; Thu,  6 Jan 2022 14:42:16 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 65F4C8011A5
	for <linux-lvm@redhat.com>; Thu,  6 Jan 2022 14:42:16 +0000 (UTC)
Received: from mail.gathman.org (mail.gathman.org [70.184.247.44]) by
	relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-447-9hyTPAVeP1qzZUv3Dwvqhg-1; Thu, 06 Jan 2022 09:42:14 -0500
X-MC-Unique: 9hyTPAVeP1qzZUv3Dwvqhg-1
Received: from mail.gathman.org (wiki.gathman.org [IPv6:2001:470:8:809::1010])
	(authenticated bits=0)
	by mail.gathman.org (8.14.7/8.14.7) with ESMTP id 206Dl9M0021143
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Thu, 6 Jan 2022 08:47:09 -0500
Date: Thu, 6 Jan 2022 08:47:09 -0500 (EST)
From: Stuart D Gathman <stuart@gathman.org>
To: LVM general discussion and development <linux-lvm@redhat.com>
In-Reply-To: <a6e37c26-77c4-2a8e-ab81-3a909c477a47@web.de>
Message-ID: <19a37b3-165e-78fb-f36-f86af8b18b26@gathman.org>
References: <97c9434a-d291-dc92-4418-89ab2c7d48e1@web.de>
	<20220102231242.jebpzbtuxgio7l2m@bitfolk.com>
	<a6e37c26-77c4-2a8e-ab81-3a909c477a47@web.de>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
X-loop: linux-lvm@redhat.com
Subject: Re: [linux-lvm] convert logical sector -> physical sector + pv/vg
 extent number
X-BeenThere: linux-lvm@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
Sender: linux-lvm-bounces@redhat.com
Errors-To: linux-lvm-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-lvm-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed;
	boundary="-1203360521-1065983026-1641476829=:20488"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.
---1203360521-1065983026-1641476829=:20488
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mail.gathman.org id
	206Dl9M0021143

On Mon, 3 Jan 2022, Roland wrote:

> any chance to get retrieve this information for automated/script based
> processing ?

You might find this script enlightening:

https://github.com/sdgathman/lbatofile

It maps bad sectors to partition,LV,file,etc

The relevant function for your question is findlv()
Some of the commands run are:

pvdisplay --units k -m '/dev/lvm_pv'
pvs --units k -o+pe_start '/dev/lvm_pv'

> Am 03.01.22 um 00:12 schrieb Andy Smith:
>>  On Sun, Jan 02, 2022 at 08:00:30PM +0100, Roland wrote:
>>>  if i have a logical sector/block "x" on a lvm logical volume ,=C2=A0 i=
s there
>>>  a way to easily calculate/determine (optimally by script/cli) the
>>>  corresponding physical sector of the physical device it belongs to and
>>>  the extent number of the appropiate pv/vg where it resides ?
---1203360521-1065983026-1641476829=:20488
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
---1203360521-1065983026-1641476829=:20488--

