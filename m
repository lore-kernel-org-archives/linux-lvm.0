Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C253C77B6C
	for <linux-lvm@archiver.kernel.org>; Thu, 13 Apr 2023 06:55:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1681368913;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=o81x4BxRo+5XjYXELv4hoe/xdPlpawLUEdfqtmL3Xq4=;
	b=L+bKs2mpyJbFmikxTsgt3RoMVjqeOuY/gsUIGbZ6te+azYQrHmU12ydu9CSc5nkOGhNQ5s
	cyaL5HZjudE/lPmAz8Cnc7CbtnY2uIlwBkDxiCoKoGs8G5AKmMlHpv2/9inWL9on8HrubY
	2ZHh69IP/CRb9o3zE0eOgqb9LAgHfpE=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-371-UZqb9kFtOoiVzzrTZbmfEg-1; Thu, 13 Apr 2023 02:55:09 -0400
X-MC-Unique: UZqb9kFtOoiVzzrTZbmfEg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DCF5729DD997;
	Thu, 13 Apr 2023 06:55:06 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6561E1121320;
	Thu, 13 Apr 2023 06:55:03 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 1B2E819465B3;
	Thu, 13 Apr 2023 06:55:03 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id D7B8319466DF
 for <linux-lvm@listman.corp.redhat.com>; Wed, 12 Apr 2023 09:16:48 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id A84FF1400C1C; Wed, 12 Apr 2023 09:16:48 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
 (mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A0B721402BDB
 for <linux-lvm@redhat.com>; Wed, 12 Apr 2023 09:16:48 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 84D0285A588
 for <linux-lvm@redhat.com>; Wed, 12 Apr 2023 09:16:48 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com
 [209.85.214.175]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-428-TcDxD86PMKij7ufoNb4Bfg-1; Wed, 12 Apr 2023 05:16:46 -0400
X-MC-Unique: TcDxD86PMKij7ufoNb4Bfg-1
Received: by mail-pl1-f175.google.com with SMTP id kh6so9142658plb.0
 for <linux-lvm@redhat.com>; Wed, 12 Apr 2023 02:16:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681291005; x=1683883005;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=XJOwoNWitdAdFka31ZQTc0QIJJVik+M4QKN4JF2kPHE=;
 b=QkcQ9NbvDUm01IS3uR0AgbRezbgMJ9e/CNrF+ALEZXMZCotnsP3HS7l+rbt5qTwZye
 oZuCqvcBTi4peTipATOnEedGyLYEFapFfjP3yJDettYdIjfVCDJDNSpodDj4Z678NzR2
 zJXdXIeJPUERM3K7CClIRhpGJEM04Ts0jVuE1XbQtnt/XLlEdX1kOVj1v3XHlVD5DsiO
 HX9TCTisPx3Uv7GehB0DPSO9sbsiDmbtF2ZarE239JNP7WFNxrokgHUOKQW4Y5DeV2JS
 wWEheKa6gGZRxom1KfwBG3+sMzARQIaSQif8yF6vFoPn3z52AL/ZAc1suMbASLILh1Sb
 1z6w==
X-Gm-Message-State: AAQBX9f/BZfhVWK5i62blZA+olC+C4vuz3w6usZTrjeHbBxAYlPeeYOM
 sTJpnvPxIUelJTwLVk2thBq/iu9ClZVUbNgo4EM=
X-Google-Smtp-Source: AKy350ZAbN9+TMTL7JE2zceBElw4Jb57cRtaUO+dSYb6YuhbXUV7jagbiohHQBYZrTdfltEY832l2w==
X-Received: by 2002:a17:90a:e7c5:b0:246:97d2:dc27 with SMTP id
 kb5-20020a17090ae7c500b0024697d2dc27mr7832024pjb.42.1681291005632; 
 Wed, 12 Apr 2023 02:16:45 -0700 (PDT)
Received: from ?IPV6:fdbd:ff1:ce00:1371:1854:aca7:3e89:8ad6?
 ([2404:9dc0:cd01::21]) by smtp.gmail.com with ESMTPSA id
 c5-20020a170902c1c500b001a63c61f06esm5552871plc.195.2023.04.12.02.16.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Apr 2023 02:16:45 -0700 (PDT)
Message-ID: <e318740a-bb17-8e38-ed3f-f1776292b47c@bytedance.com>
Date: Wed, 12 Apr 2023 17:16:41 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
To: David Teigland <teigland@redhat.com>
References: <ac0f39c8-932d-293a-b7aa-568532bda22a@bytedance.com>
 <20230411133147.GB27598@redhat.com>
From: Zhiyong Ye <yezhiyong@bytedance.com>
In-Reply-To: <20230411133147.GB27598@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mailman-Approved-At: Thu, 13 Apr 2023 06:55:02 +0000
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: bytedance.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"


Hi Dave,

Thank you for your reply.

Because I had not considered multi-pathing before, there is no way to 
configure mpath on sda alone on the current stock of machines. And I 
tested this in my environment using lvchange --refresh, but it doesn't 
switch the active LV to use mpatha.

# lvchange --refresh is-he57e6mr4wemb19kgf8i
WARNING: Not using device /dev/mapper/mpatha for PV 
HgL3xR-qTio-m75Q-nGAO-Un0U-8uHk-wHbH25.
WARNING: PV HgL3xR-qTio-m75Q-nGAO-Un0U-8uHk-wHbH25 prefers device 
/dev/sda because device is used by LV.

# pvs
WARNING: Not using device /dev/mapper/mpatha for PV 
HgL3xR-qTio-m75Q-nGAO-Un0U-8uHk-wHbH25.
WARNING: PV HgL3xR-qTio-m75Q-nGAO-Un0U-8uHk-wHbH25 prefers device 
/dev/sda because device is used by LV.
PV           VG                      Fmt  Attr PSize  PFree
/dev/sda     is-he57e6mr4wemb19kgf8i lvm2 a--  10.00t 9.98t

This is because duplicate PVs are encountered during the disk discovery 
phase, but lvmcache tends to use sda because it is currently being used 
by LV and mpatha will be dropped.

I debugged the _choose_duplicates function in lvmcache and printed the 
following log:
lvm[3352450]: PV HgL3xRqTiom75QnGAOUn0U8uHkwHbH25 compare duplicates: 
/dev/mapper/mpatha 254:3. /dev/sda 8:16. device_hint /dev/sda.
vm[3352450]: PV HgL3xRqTiom75QnGAOUn0U8uHkwHbH25: size 21474836480. 
/dev/mapper/mpatha is 21474836480. /dev/sda is 21474836480.
lvm[3352450]: PV HgL3xRqTiom75QnGAOUn0U8uHkwHbH25: /dev/mapper/mpatha 
was prev <none>. /dev/sda was prev <none>.
lvm[3352450]: PV HgL3xRqTiom75QnGAOUn0U8uHkwHbH25: /dev/mapper/mpatha is 
in subsystem. /dev/sda is not in subsystem.
lvm[3352450]: PV HgL3xRqTiom75QnGAOUn0U8uHkwHbH25: /dev/mapper/mpatha is 
dm. /dev/sda is not dm.
lvm[3352450]: PV HgL3xRqTiom75QnGAOUn0U8uHkwHbH25: /dev/mapper/mpatha 
has no mounted fs. /dev/sda has no mounted fs.
lvm[3352450]: PV HgL3xRqTiom75QnGAOUn0U8uHkwHbH25: /dev/mapper/mpatha is 
not used for LV. /dev/sda is used for LV.
lvm[3352450]: PV HgL3xRqTiom75QnGAOUn0U8uHkwHbH25 with duplicates will 
change from /dev/mapper/mpatha to /dev/sda.
lvm[3352450]: Dropping unchosen duplicate /dev/mapper/mpatha
lvm[3352450]: Adding chosen duplicate /dev/sda

Is there any way to change the PV preference policy in _choose_duplicates?

Regards

Zhiyong

On 4/11/23 9:31 PM, David Teigland wrote:
> On Tue, Apr 11, 2023 at 01:29:42PM +0800, Zhiyong Ye wrote:
>> and lv on it. I then turn on the multipath function and merge the two paths
>> into a new device (/dev/mapper/matha), and I get the following error when I
>> execute the lvm command.
>>
>> # pvs
>> WARNING: Not using device /dev/mapper/matha for PV
>> HgL3xR-qTio-m75Q-nGAO-Un0U-8uHk-wHbH25.
>> WARNING: PV HgL3xR-qTio-m75Q-nGAO-Un0U-8uHk-wHbH25 prefers device /dev/sda
>> because device is used by LV.
>> PV           VG                      Fmt  Attr PSize  PFree
>> /dev/sda     is-he57e6mr4wemb19kgf8i lvm2 a--  10.00t 9.98t
> 
>> May you please advise how one can convert the pv used by vg from sda to
>> matha without affecting the current lv usage.
> 
> lvchange --refresh should refresh the active LV to use mpatha.  To avoid
> this, you might configure mpath on sda alone prior to adding the second
> path.
> 
> Dave
> 

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

