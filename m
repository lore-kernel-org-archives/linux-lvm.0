Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E37DC433F5
	for <linux-lvm@archiver.kernel.org>; Thu, 29 Sep 2022 11:42:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1664451721;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=VBJXSjMh5Jwy9t65oOzGRu8OTkd2YTqIuuYklXvAowE=;
	b=J4WIoMzs+ktjMDs0nQ67Ws7/msU7iMli64J5yaWP60kbbwKBqREMGxw9bf7vEk8ioqCgph
	uMsTABpNdBpiXJwOuI7v6EGDjjhPJan+Rt57JBnJoXOUnpyWbD6v4sMFM8qBqQwonSCibw
	1LgGEsdb3kvjvROY+Em9Xrk7RRA8R0k=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-149-8XtVPCzDOJyqtniQfpbwAw-1; Thu, 29 Sep 2022 07:41:58 -0400
X-MC-Unique: 8XtVPCzDOJyqtniQfpbwAw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 39120101A52A;
	Thu, 29 Sep 2022 11:41:55 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D1830492B04;
	Thu, 29 Sep 2022 11:41:53 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id A214D1946A47;
	Thu, 29 Sep 2022 11:41:53 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 7F14E19465B8
 for <linux-lvm@listman.corp.redhat.com>; Thu, 29 Sep 2022 11:41:52 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 5F8E01415114; Thu, 29 Sep 2022 11:41:52 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
 (mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6063C140EBF3
 for <linux-lvm@redhat.com>; Thu, 29 Sep 2022 11:41:45 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 43266833948
 for <linux-lvm@redhat.com>; Thu, 29 Sep 2022 11:41:45 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-43-xv8WaY6cPbWdJee9mvfyWw-1; Thu, 29 Sep 2022 07:41:43 -0400
X-MC-Unique: xv8WaY6cPbWdJee9mvfyWw-1
Received: by mail-wr1-f46.google.com with SMTP id n10so1723970wrw.12
 for <linux-lvm@redhat.com>; Thu, 29 Sep 2022 04:41:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=dc6BfUOOWMeYBZRQht/OJ+CvRkejvCbSQvLu4H0evqY=;
 b=7wW7ZswgaIdP1+qyOpLOOLLwqMGnk9OMWpq44qh7bvKWeVP/0dOqDpftR+NltGgkmG
 US7CEOtPgM8zmMHsVj/FA6nm25fT7OXox441ci45j7y56FdkAmFl+RUEp8yJ7MrXCcGN
 VRBbaKA5iHxc2TwpImXCzhJV3enB1wl3jK0lkcwlnaGpMdbksLHfvn8GssKsFUM7Lw2Z
 UwM3iQQ+DVw7q8joqGQZ1rWe98hBFy+pWpxf8K1Q2dDdSGV0REoz6VAQAFOEdhjZJE7i
 SPbkzIt/E1jDuhM9+kfCXLDdYWK3sts3tpD6pttSQ9Iq0SG0DLv2cPqOO8X7UO/IN3gD
 KQaQ==
X-Gm-Message-State: ACrzQf0aUWq6RW8COVDbkywieWWcwss+JU0SAa/Fv8QVK0ca5FLRotNX
 9bGi/ts205e782uw/bzGLjudmR4wuws=
X-Google-Smtp-Source: AMsMyM4cDmWBqgLj6OfV19kkICkkN1z064HgmgdAfrdzNM/XPgYye/umscz1ZIh8C65n0MiAz5zDgA==
X-Received: by 2002:a5d:54ce:0:b0:22a:e653:654 with SMTP id
 x14-20020a5d54ce000000b0022ae6530654mr1991976wrv.134.1664451702259; 
 Thu, 29 Sep 2022 04:41:42 -0700 (PDT)
Received: from [192.168.0.177] ([83.148.32.207])
 by smtp.gmail.com with ESMTPSA id
 s7-20020a1cf207000000b003b49aa8083esm4034867wmc.42.2022.09.29.04.41.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Sep 2022 04:41:41 -0700 (PDT)
Message-ID: <7f7db1ac-fe8a-851f-ef38-8aa85f9353c2@gmail.com>
Date: Thu, 29 Sep 2022 13:41:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.2.1
To: Roberto Fastec <roberto.fastec@gmail.com>
References: <CADoUXWv+Po7pdhcAUk=JSwaDYJ2qp6B7aXm_djOuaOB0r9Usrw@mail.gmail.com>
 <6c03a8e8-c4ed-4c2a-a23b-bf4513577d1e@gmail.com>
 <6f7d32a9-a6f3-44b7-a4be-53c9372e00b4@gmail.com>
From: Zdenek Kabelac <zdenek.kabelac@gmail.com>
In-Reply-To: <6f7d32a9-a6f3-44b7-a4be-53c9372e00b4@gmail.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Subject: Re: [linux-lvm] LVM2 Metadata structure, extents ordering,
 metadata corruptions
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"

Dne 29. 09. 22 v 13:15 Roberto Fastec napsal(a):
> Hello Zdenek
> Thank you for the explanation
> 
> May I kindly ask you what/which is the command line API to access and 
> manipulate those metadata?
> 

'command line API' in the mean of:

To create LV --   'lvcreate'....
To remove LV --   'lvremove'....


Note - many command can actually work without physical interaction with DM 
layer  (--driverloaded n) - however in some case some targets require presence 
of DM.

lvm2 commands are the way how to change your metadata properly.


> And when you say vi editor, do you kindly mean direct edit of HEX values on 
> the raw metadata?

No way -  you can't change metadata on disk - unless you would be basically 
precisely copying what lvm2 command does  -  so what would be the point ??

Simply use lvm2 command to make the job.  Unless I'm missing some important 
point why would you need to work  with lvm2 metadata but without lvm2 ??


> 
> Thank you
> 
> If you kindly may have some link to some documentation, thank you even more
> 
> Though here it is not the configuration that got lost

Well yeah - it will take some time - but i.e. RHEL storage documentation might 
be a good way to go through it.



> Also, additional info, we now got that all the cases do have active the 
> thin-provisionin and looks like that these are additional/different metadata 
> tables

This-provisioning is handled by LVM2 only to provide  LVs for metadata and 
data LVs - and then the  thinLVs to a user.

Physical block layout for thin-provisioning is fully stored inside 
thin-pool's metadata device.

To explore those mappings you need to use tools like 'thin_dump', 'thin_ls'

> 
> So if these got messed/corrupted...
> 

If these thin-pool metadata get corrupted, there is tool: 'thin_repair'.

Note: corruption of some high-level bTree nodes may result a severe damage to 
whole metadata structure ->  i.e. lots of thinLVs being lost.

It's a good idea to keep such metadata on some resilient type of storage 
(raid) and of course  rule #1  - create regular backups of your thin 
volumes...   (snapshot of thinLV is not a backup!).


> In QNAP looks they have made some customization and so thin-provision LVM 
> metadata are on a dedicated partition
> 
> we observed the HEX inside there and got partially the logic
> 
> About thin-provisioning, again, any "fsck"-like is available? (I suppose no, 
> but just as confirmation)

This tool is called  'thin_check'

(and this tool is in fact executed with every thin-pool activation & 
deactivation by default by lvm2)

Note: just like with lvm2 metadata - also thin-pool's kernel metadata are 
check-summed (protected agains disc bit corruptions), so again zero chance 
with any 'hex-editor' to manipulate them - unless you would 'recreate' 
thin-pool engine...


Regards

Zdenek


_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

