Return-Path: <SRS0=atth=G4=redhat.com=linux-lvm-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1FAEC433E0
	for <linux-lvm@archiver.kernel.org>; Mon, 25 Jan 2021 08:49:23 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DFAD72071C
	for <linux-lvm@archiver.kernel.org>; Mon, 25 Jan 2021 08:49:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DFAD72071C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=johannes-niess.de
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=linux-lvm-bounces@redhat.com
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-447-awO1j_ebNF2A8uUL7bkTEQ-1; Mon, 25 Jan 2021 03:49:18 -0500
X-MC-Unique: awO1j_ebNF2A8uUL7bkTEQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F170380A5C4;
	Mon, 25 Jan 2021 08:49:11 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DAA7D5D9D7;
	Mon, 25 Jan 2021 08:49:06 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6C2984BB7B;
	Mon, 25 Jan 2021 08:48:50 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 10OJmrJb014049 for <linux-lvm@listman.util.phx.redhat.com>;
	Sun, 24 Jan 2021 14:48:53 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 3840A112C082; Sun, 24 Jan 2021 19:48:53 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 342EB112C081
	for <linux-lvm@redhat.com>; Sun, 24 Jan 2021 19:48:50 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 49E66800889
	for <linux-lvm@redhat.com>; Sun, 24 Jan 2021 19:48:50 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.131])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-270-6IfChzc_NpO655wvSiCd8w-1; Sun, 24 Jan 2021 14:48:47 -0500
X-MC-Unique: 6IfChzc_NpO655wvSiCd8w-1
Received: from [192.168.178.27] ([5.10.6.45]) by mrelayeu.kundenserver.de
	(mreue012 [212.227.15.167]) with ESMTPSA (Nemesis) id
	1MOm9H-1lMfj61C99-00Q88R for <linux-lvm@redhat.com>; Sun, 24 Jan 2021
	20:43:43 +0100
To: linux-lvm@redhat.com
From: =?UTF-8?Q?Johannes_Nie=c3=9f?= <linux@johannes-niess.de>
Message-ID: <c673b13b-8742-d4e6-9249-6cdc9146b8b4@johannes-niess.de>
Date: Sun, 24 Jan 2021 20:43:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
	Firefox/78.0 Thunderbird/78.6.1
MIME-Version: 1.0
X-Provags-ID: V03:K1:W0NxEvcdxJxYr93o1hWftUtjwzbVjObja9BQjwV6KqXeymG3Z1X
	DAlgGc7a6XEnYCiXZXa51fzz+X+OMquA0Le3l4t0Ho4ae22lROZx7QoTESm12Mf17EXu3rP
	k33AkE1A+6UKspr3oyuoUz7l9aaOSFMIEE1QkVRWZyPD4E9ySdM+j7lQPeg85/I7pwWZbCM
	Lkkj6UuKYPc5uWXatiLsQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:5O81OQyxqbs=:72Bc6Z3KKLC3ttDoUgu0mb
	CgH6kpZJ0iRR7VZMaT/EYcmR/feSFMkfH4RDgP3zzMawlfR5khUV27OstRSkUH24JRGwJFyJs
	4D1jMwWxWojk+JVpowxPtMt71bx/5bTPAg5CzQ3VUHpr8GI+XK1pIV9UdbocUrh/r/f4MCDFb
	gSoVAPT8sZAj6koN6r25hF18c4E3t41R5SSFlzJHNTs0WFzKWaePn9/1/ANqUP6cK5VJ0+l/J
	9cAtuKAIJO6Q6I9VHEt65fv8b2CjiErZcUaBBoEblRnCtPrMXmu2YfaERK8fYpG/UtOMHs4lD
	myeg7PhHUrvfpbEWEYHeTcTLCiYL3NS1V6ANII/rnFPT/27+GdEkUTdNw0WX9iBFNGedRJJE/
	s4TwcnN4URceKwHBHtJPU6+7tC0Md+ZzGXOa6xJxyBApxYGBcZaNhBwA7lnDn9DyOcPB8+qTM
	K/IsnnOiaiWlOXlmNwNt6lJScs75LX0=
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: linux-lvm@redhat.com
X-Mailman-Approved-At: Mon, 25 Jan 2021 03:48:46 -0500
Subject: [linux-lvm] RFE: Convert standard LV to Thin and vice versa
X-BeenThere: linux-lvm@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
Sender: linux-lvm-bounces@redhat.com
Errors-To: linux-lvm-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-lvm-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: multipart/mixed; boundary="===============8090465059075182512=="

This is a multi-part message in MIME format.
--===============8090465059075182512==
Content-Type: multipart/alternative;
	boundary="------------1AB1AA35A68A433631E19BFC"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------1AB1AA35A68A433631E19BFC
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

Currently we can convert a standard LV to a thin LV with an external, 
read only origin as per man lvmthin. Unwritten portions of the thin LV 
are read from the external LV. I assume that new portions are written to 
a thin snapshot, but the man page is silent about this.

lvconvert --type thin --thinpool VG/ThinPoolLV --originname 
NewExternalOriginLV VG/ExampleLV


This means the external LV is needed forever, even if all of its extents 
are outdated and replaced by thin extents. I'd like to get a full 
conversion to a ThinLV by modifying only meta data.

Within lvconvert:
0) Use external thin LV as above as the starting point
1) Create new ThinLV stub
2) Assign extents of external LV to thin pool in a 'used', read only state.
3) Assign extents of external LV to new ThinLV .
4) Switch link of the thin snapshot to the new ThinLV
5) Make ThinLV read only
6) Remove external LV stub

To release the outdated ThinLV extents, we just need to merge the 
initial thin snapshot with it.

One great use case is instant bare metal recovery: Create an empty 
ThinPool on proper HW and just activate the external volumes (on USB 
Disks). Redundancy is then restored in the background by converting to a 
Thin LV as above and 'pvmove'ing.

Creating these backups would also need a way to 'unthin' an LV snapshot 
to a 'thick' LV with an independent copy of all extents. Can we already 
to this by e. g. creating and splitting a mirror? Or by merging with an 
empty 'thick' LV? Or do we need the above steps in the opposite direction?


--------------1AB1AA35A68A433631E19BFC
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>

    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Hi,</p>
    <p>Currently we can convert a standard LV to a thin LV with an
      external, read only origin as per man lvmthin. Unwritten portions
      of the thin LV are read from the external LV. I assume that new
      portions are written to a thin snapshot, but the man page is
      silent about this.<br>
    </p>
    <p><font face="Courier New, Courier, monospace">lvconvert --type
        thin --thinpool VG/ThinPoolLV --originname NewExternalOriginLV
        VG/ExampleLV</font></p>
    <p><br>
    </p>
    <p>This means the external LV is needed forever, even if all of its
      extents are outdated and replaced by thin extents. I'd like to get
      a full conversion to a ThinLV by modifying only meta data.<br>
    </p>
    <p>Within lvconvert: <br>
      0) Use external thin LV as above as the starting point<br>
      1) Create new ThinLV stub<br>
      2) Assign extents of external LV to thin pool in a 'used', read
      only state.<br>
      3) Assign extents of external LV to new ThinLV .<br>
      4) Switch link of the thin snapshot to the new ThinLV<br>
      5) Make ThinLV read only<br>
      6) Remove external LV stub</p>
    <p>To release the outdated ThinLV extents, we just need to merge the
      initial thin snapshot with it. <br>
    </p>
    <p>One great use case is instant bare metal recovery: Create an
      empty ThinPool on proper HW and just activate the external volumes
      (on USB Disks). Redundancy is then restored in the background by
      converting to a Thin LV as above and 'pvmove'ing.<br>
    </p>
    <p>Creating these backups would also need a way to 'unthin' an LV
      snapshot to a 'thick' LV with an independent copy of all extents.
      Can we already to this by e. g. creating and splitting a mirror?
      Or by merging with an empty 'thick' LV? Or do we need the above
      steps in the opposite direction? <br>
    </p>
  </body>
</html>

--------------1AB1AA35A68A433631E19BFC--

--===============8090465059075182512==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://www.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
--===============8090465059075182512==--

