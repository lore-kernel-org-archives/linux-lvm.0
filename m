Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D74F3C77B73
	for <linux-lvm@archiver.kernel.org>; Mon, 22 May 2023 06:58:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1684738705;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=uwnxbJOIUxTzh/kZU4pRHTWjpR9WTVoIidcVttGkR90=;
	b=T8jsTzUcT20qXVpy+eCm8aKHSU44N4fEXyo6ocH/CUbSl/fxe/PD3r8LLOgJg3rMmv3zXA
	IXreMHyGAaSHhkAW4c+TcDP51y1ab/zjX4OSoazBS4EPQGghyVqPHOHaXm6iwwrDUBZBUO
	4J5pcYRmJ7bnwKzUkPphM7RZ+umPk1o=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-588-ADMR-ANgMaSs3pxEPboQ3g-1; Mon, 22 May 2023 02:58:24 -0400
X-MC-Unique: ADMR-ANgMaSs3pxEPboQ3g-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CB6C085A5B5;
	Mon, 22 May 2023 06:58:21 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A0D0A492B0A;
	Mon, 22 May 2023 06:58:16 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 7DBA419465A0;
	Mon, 22 May 2023 06:58:16 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id E26A519465A0
 for <linux-lvm@listman.corp.redhat.com>; Sat, 20 May 2023 22:32:56 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id C1011140E955; Sat, 20 May 2023 22:32:56 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
 (mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B951A140E954
 for <linux-lvm@redhat.com>; Sat, 20 May 2023 22:32:56 +0000 (UTC)
Received: from us-smtp-inbound-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 99002380673F
 for <linux-lvm@redhat.com>; Sat, 20 May 2023 22:32:56 +0000 (UTC)
Received: from avasout-peh-004.plus.net (avasout-peh-004.plus.net
 [212.159.14.20]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-425-bUfxLSqiPGyWpebHPa7TAA-1; Sat, 20 May 2023 18:32:54 -0400
X-MC-Unique: bUfxLSqiPGyWpebHPa7TAA-1
Received: from ybox.home ([84.92.34.227]) by smtp with ESMTP
 id 0V5DqrFZE64vm0V5EqwLGG; Sat, 20 May 2023 23:29:52 +0100
X-Clacks-Overhead: "GNU Terry Pratchett"
X-CM-Score: 0.00
X-CNFS-Analysis: v=2.4 cv=PdfsOwtd c=1 sm=1 tr=0 ts=646949e0
 a=Ve4+HNLzg+PBEez4TumTVA==:117 a=Ve4+HNLzg+PBEez4TumTVA==:17
 a=dLZJa+xiwSxG16/P+YVxDGlgEgI=:19 a=P0xRbXHiH_UA:10 a=r77TgQKjGQsHNAKrUKIA:9
 a=kLaR9Frj5zW1WBhdf7EA:9 a=QEXdDO2ut3YA:10 a=HdVc9NuRalwErinBDYIA:9
 a=He-mCU1CnSnnqZ-1:21 a=_W_S_7VecoQA:10
Received: from nuc.home ([10.117.1.107]:35444)
 by ybox.home with esmtp (Exim 4.94.2)
 (envelope-from <graeme.lvm@vetterlein.com>) id 1q0V5C-00E1He-RI
 for linux-lvm@redhat.com; Sat, 20 May 2023 23:29:50 +0100
Message-ID: <60e1a6cf-0384-5f6b-299b-a40c60a0b1a4@vetterlein.com>
Date: Sat, 20 May 2023 23:29:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
To: linux-lvm@redhat.com
From: graeme vetterlein <graeme.lvm@vetterlein.com>
X-ACL-Warn: GPV SMTP mail message (  )
X-ACL-Warn: GPV acl_check_rcpt will do DKIM check soon [ host=X recipients= ]
X-CMAE-Envelope: MS4xfN2jgOaNYtJwSGm0vxsjAVZ7OxvXuDjnX9Tmxl9smVAIZdcT4C//Z4ros7wwi51JYnluNOSg0fGkNeeKtAKOrviaE/RLxg9CHB9g/iKJ1MdIyeHiPO3b
 9eFH7hoohS76YGJhBfqK09AuXiLnXSQy28U0BMeqfCRY5aycEIM3cydMFQf50Ctk24+IOm85uFZfjQ==
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mailman-Approved-At: Mon, 22 May 2023 06:58:15 +0000
Subject: [linux-lvm] badblocks
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
Errors-To: linux-lvm-bounces@redhat.com
Sender: "linux-lvm" <linux-lvm-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: vetterlein.com
Content-Language: en-GB
Content-Type: multipart/mixed; boundary="===============4196432742346217895=="

This is a multi-part message in MIME format.
--===============4196432742346217895==
Content-Type: multipart/alternative;
 boundary="------------aqCEgQu1km0r7MQHVtNThANa"
Content-Language: en-GB

This is a multi-part message in MIME format.
--------------aqCEgQu1km0r7MQHVtNThANa
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

This is my 1st post to this group.

I'm not aware of anywhere I can search for "known issues" or similar 
...short of opening each archive  and searching it.

(happy to be corrected on this)


I have a desktop Linux box (Debian Sid) with a clutch of disks in it (4 
or 5)  and have mostly defined each disk as a volume group.


Now a key point is *some of the disks are NAS grade disks.* This means 
they do NOT reallocate bad sectors silently. They report IO errors and 
leave it to the OS (i.e. the old fashion way of doing this)


One of the disks (over 10 years old) had started reporting errors. I ran 
fsck with -cc but it never found the issue. In the end I bough a new 
disk and did:

  * *vgextend* -- to add the new disk
  * *pvmove*   -- move volumes off "bad" disk
  * *vgreduce* -- remove bad disk from group

While the pvmove is running I had plenty of time to think....


The filesystem in the LV on the "bad disk" is now moving to the "new 
disk"  ...had the fsck managed to mark bad blocks, these would be in 
terms of the LV in which it sat and would be meaningless on  the new disk.


Then *the penny dropped!* The only component that has a view on the real 
physical disk is lvm2 and in particular the PV ...so if anybody can 
mark(and avoid) badblocks it's the PV...so I should be looking for 
something akin to the -cc option of fsck , applied to a PV command?


Googling around I see lots of ill-informed comments by people who's 
never seen a read "bad block" and assume all modern disks solve this for 
you.


--


Graeme



--------------aqCEgQu1km0r7MQHVtNThANa
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html>
  <head>

    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><font size="4">This is my 1st post to this group.</font></p>
    <p><font size="4">I'm not aware of anywhere I can search for "known
        issues" or similar ...short of opening each archive  and
        searching it.</font></p>
    <p>(happy to be corrected on this)</p>
    <p><br>
    </p>
    <p>I have a desktop Linux box (Debian Sid) with a clutch of disks in
      it (4 or 5)  and have mostly defined each disk as a volume group.</p>
    <p><br>
    </p>
    <p>Now a key point is <b>some of the disks are NAS grade disks.</b>
      This means they do NOT reallocate bad sectors silently. They
      report IO errors and leave it to the OS (i.e. the old fashion way
      of doing this)</p>
    <p><br>
    </p>
    <p>One of the disks (over 10 years old) had started reporting
      errors. I ran fsck with -cc but it never found the issue. In the
      end I bough a new disk and did:</p>
    <ul>
      <li><b>vgextend</b> -- to add the new disk</li>
      <li><b>pvmove</b>   -- move volumes off "bad" disk<br>
      </li>
      <li><b>vgreduce</b> -- remove bad disk from group<br>
      </li>
    </ul>
    <p>While the pvmove is running I had plenty of time to think....<br>
    </p>
    <p><br>
    </p>
    <p>The filesystem in the LV on the "bad disk" is now moving to the
      "new disk"  ...had the fsck managed to mark bad blocks, these
      would be in terms of the LV in which it sat and would be
      meaningless on  the new disk.</p>
    <p><br>
    </p>
    <p>Then <b>the penny dropped!</b> The only component that has a
      view on the real physical disk is lvm2 and in particular the PV
      ...so if anybody can mark(and avoid) badblocks it's the PV...so I
      should be looking for something akin to the -cc option of fsck ,
      applied to a PV command?</p>
    <p><br>
    </p>
    <p>Googling around I see lots of ill-informed comments by people
      who's never seen a read "bad block" and assume all modern disks
      solve this for you.<br>
    </p>
    <p><br>
    </p>
    <p>--</p>
    <p><br>
    </p>
    <p>Graeme</p>
    <p><br>
    </p>
    <p><br>
    </p>
  </body>
</html>

--------------aqCEgQu1km0r7MQHVtNThANa--

--===============4196432742346217895==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

--===============4196432742346217895==--

