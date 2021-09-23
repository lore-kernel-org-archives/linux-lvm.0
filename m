Return-Path: <SRS0=gv72=OO=redhat.com=linux-lvm-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	HTML_MESSAGE,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D54B5C433EF
	for <linux-lvm@archiver.kernel.org>; Fri, 24 Sep 2021 06:39:39 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 429D0610C7
	for <linux-lvm@archiver.kernel.org>; Fri, 24 Sep 2021 06:39:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 429D0610C7
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1632465578;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=uP+CE7CsZw1//lOhTSK4F9v2VV6KVmw3XPUeova4/U8=;
	b=CVa0XjrlffIHhfGhCidnRy+YM5Gq3H6D1ifdIwj7n0kMMJmOskjKfqkD/r+/THeBVQILqC
	4CsuNKxImVG4cFa74CiK9kE6VIURqDwunqcK3UL3F6VlAAhr4MfobAF9hVlGz8LCVTAoOD
	+FC4EGMBTsQRa5F0Wr8JfI/UoQQ0Xfw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-279-71-sboh0OOWXhwcqA8oDjQ-1; Fri, 24 Sep 2021 02:39:36 -0400
X-MC-Unique: 71-sboh0OOWXhwcqA8oDjQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2885910168C6;
	Fri, 24 Sep 2021 06:39:31 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6971D60BE5;
	Fri, 24 Sep 2021 06:39:30 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8D0AF4EA29;
	Fri, 24 Sep 2021 06:39:10 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 18NIhppQ019916 for <linux-lvm@listman.util.phx.redhat.com>;
	Thu, 23 Sep 2021 14:43:51 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 70C176091B; Thu, 23 Sep 2021 18:43:51 +0000 (UTC)
Received: from [10.40.192.69] (unknown [10.40.192.69])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 53D8A608BA;
	Thu, 23 Sep 2021 18:43:31 +0000 (UTC)
Message-ID: <b212e911-58f5-ebb0-b9b8-eda19c76c904@redhat.com>
Date: Thu, 23 Sep 2021 20:43:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
	Firefox/91.0 Thunderbird/91.1.0
To: alessandro macuz <alessandro.macuz@gmail.com>
References: <CAFrGbuU63mCLDc47aiY6PuEf4C1B=CL3Dh1=GB+p_rRWkV8S4g@mail.gmail.com>
	<CAFrGbuWKxbB=2Q6QygfN5mLh1MU7ztwXOouiRF2ynP-BcjhfXA@mail.gmail.com>
	<bd2ffcd6-e067-8152-fd2f-6d5036cb2ec6@redhat.com>
	<CAFrGbuUDO-RwHwOKvMjU5ni7_jjS2BpACPMsWFQgKpW5=Fz9mw@mail.gmail.com>
From: Zdenek Kabelac <zkabelac@redhat.com>
In-Reply-To: <CAFrGbuUDO-RwHwOKvMjU5ni7_jjS2BpACPMsWFQgKpW5=Fz9mw@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: linux-lvm@redhat.com
X-Mailman-Approved-At: Fri, 24 Sep 2021 02:37:52 -0400
Cc: LVM general discussion and development <linux-lvm@redhat.com>
Subject: Re: [linux-lvm] " Failed to find physical volume <ZFS block device"
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-lvm-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: multipart/mixed; boundary="===============7822722983966513606=="

This is a multi-part message in MIME format.
--===============7822722983966513606==
Content-Type: multipart/alternative;
	boundary="------------is6gZ0Tjvlh8k43pNL2wHtQv"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------is6gZ0Tjvlh8k43pNL2wHtQv
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Dne 23. 09. 21 v 20:03 alessandro macuz napsal(a):
> Thanks Zdenek,
>
> so it might be that metadata is corrupted somehow and hence the pvs program 
> doesn't recognize that partition as physical volume?
> That may explain why lvmdiskscan reports physical disks (by just looking at 
> the partition type 8e) and pvs completely ignores it.
> Am I correct?
>

Hi


Yes - if your disk header part has lost/damaged its content - it will not be 
recognized as PV - thus completely ignored.

Note - the easiest is to check the verbose output of  'pvs -vvv' - where you 
could follow up what is command doing in relatively 'readable' form - if you 
can't follow it - just attach to the email for overlook why could be your disk 
eventually ignored.

Note - the other reason could be the device got filtered by some filter - but 
I assume you've not changed your configuration on your system ?


Zdenek


> Le jeu. 23 sept. 2021 à 15:52, Zdenek Kabelac <zkabelac@redhat.com> a écrit :
>
>     Dne 22. 09. 21 v 18:48 alessandro macuz napsal(a):
>     > fdisk correctly identifies the extended partition as 8e.
>     > I wonder which kind of data lvmdiskscan and pvs use in order to list LVM
>     > physical volumes.
>     > Does PVS check some specific metadata within the partition without just
>     > relying on the type of partition displayed by fdisk?
>     >
>     >
>
>     Hi
>
>     Yes - PVs do have header signature keeping information about PV attributes
>     and also has the storage area to keep lvm2 metadata.
>
>     Partition flags known to fdisk are irrelevant.
>
>
>     Regards
>
>     Zdenek
>

--------------is6gZ0Tjvlh8k43pNL2wHtQv
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <div class="moz-cite-prefix">Dne 23. 09. 21 v 20:03 alessandro macuz
      napsal(a):<br>
    </div>
    <blockquote type="cite"
cite="mid:CAFrGbuUDO-RwHwOKvMjU5ni7_jjS2BpACPMsWFQgKpW5=Fz9mw@mail.gmail.com">
      <meta http-equiv="content-type" content="text/html; charset=UTF-8">
      <div dir="ltr">
        <div>Thanks Zdenek,</div>
        <div><br>
        </div>
        <div>so it might be that metadata is corrupted somehow and hence
          the pvs program doesn't recognize that partition as physical
          volume?</div>
        <div>That may explain why lvmdiskscan reports physical disks (by
          just looking at the partition type 8e) and pvs completely
          ignores it.</div>
        <div>Am I correct?</div>
        <br>
      </div>
    </blockquote>
    <p><br>
    </p>
    <p>Hi</p>
    <p><br>
    </p>
    <p>Yes - if your disk header part has lost/damaged its content - it
      will not be recognized as PV - thus completely ignored.<br>
    </p>
    <p>Note - the easiest is to check the verbose output of  'pvs -vvv' 
      - where you could follow up what is command doing in relatively
      'readable' form - if you can't follow it - just attach to the
      email for overlook why could be your disk eventually ignored.</p>
    <p>Note - the other reason could be the device got filtered by some
      filter - but I assume you've not changed your configuration on
      your system ?</p>
    <p><br>
    </p>
    <p>Zdenek</p>
    <p><br>
    </p>
    <blockquote type="cite"
cite="mid:CAFrGbuUDO-RwHwOKvMjU5ni7_jjS2BpACPMsWFQgKpW5=Fz9mw@mail.gmail.com">
      <div class="gmail_quote">
        <div dir="ltr" class="gmail_attr">Le jeu. 23 sept. 2021 à 15:52,
          Zdenek Kabelac &lt;<a href="mailto:zkabelac@redhat.com"
            moz-do-not-send="true" class="moz-txt-link-freetext">zkabelac@redhat.com</a>&gt;
          a écrit :<br>
        </div>
        <blockquote class="gmail_quote" style="margin:0px 0px 0px
          0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Dne
          22. 09. 21 v 18:48 alessandro macuz napsal(a):<br>
          &gt; fdisk correctly identifies the extended partition as 8e.<br>
          &gt; I wonder which kind of data lvmdiskscan and pvs use in
          order to list LVM <br>
          &gt; physical volumes.<br>
          &gt; Does PVS check some specific metadata within the
          partition without just <br>
          &gt; relying on the type of partition displayed by fdisk?<br>
          &gt; <br>
          &gt;<br>
          <br>
          Hi<br>
          <br>
          Yes - PVs do have header signature keeping information about
          PV attributes<br>
          and also has the storage area to keep lvm2 metadata.<br>
          <br>
          Partition flags known to fdisk are irrelevant.<br>
          <br>
          <br>
          Regards<br>
          <br>
          Zdenek<br>
          <br>
        </blockquote>
      </div>
    </blockquote>
    <p><br>
    </p>
  </body>
</html>
--------------is6gZ0Tjvlh8k43pNL2wHtQv--

--===============7822722983966513606==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
--===============7822722983966513606==--

