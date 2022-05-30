Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 563FCC433EF
	for <linux-lvm@archiver.kernel.org>; Mon, 30 May 2022 15:20:27 +0000 (UTC)
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-387-hG9PDao_OqWkKLXT8KBmXQ-1; Mon, 30 May 2022 11:20:22 -0400
X-MC-Unique: hG9PDao_OqWkKLXT8KBmXQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5F6CF1C01B49;
	Mon, 30 May 2022 15:20:20 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 86739492C3B;
	Mon, 30 May 2022 15:20:19 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 3D5291947056;
	Mon, 30 May 2022 15:20:19 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id EF99C19466DF
 for <linux-lvm@listman.corp.redhat.com>; Mon, 30 May 2022 15:20:18 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id D3C6A40CFD0A; Mon, 30 May 2022 15:20:18 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
 (mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CFDEE40CF8EE
 for <linux-lvm@redhat.com>; Mon, 30 May 2022 15:20:18 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BCE75185A7B2
 for <linux-lvm@redhat.com>; Mon, 30 May 2022 15:20:18 +0000 (UTC)
Received: from ciao.gmane.io (ciao.gmane.io [116.202.254.214]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-274-G42MxPSSPlOvvnQNVqX9hQ-1; Mon, 30 May 2022 11:20:17 -0400
X-MC-Unique: G42MxPSSPlOvvnQNVqX9hQ-1
Received: from list by ciao.gmane.io with local (Exim 4.92)
 (envelope-from <gllg-linux-lvm@m.gmane-mx.org>) id 1nvh6q-0009Df-Pe
 for linux-lvm@redhat.com; Mon, 30 May 2022 17:15:08 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: linux-lvm@redhat.com
From: Zdenek Kabelac <zdenek.kabelac@gmail.com>
Date: Mon, 30 May 2022 17:15:03 +0200
Message-ID: <e1896ba1-fc6f-b4f1-d4f9-fac91193dcbc@gmail.com>
References: <CAM3OQJGWsYo=boQBHqmLj1HRRtg14p3-Tp3yeu7KMYcKV2_hOA@mail.gmail.com>
Mime-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.9.1
In-Reply-To: <CAM3OQJGWsYo=boQBHqmLj1HRRtg14p3-Tp3yeu7KMYcKV2_hOA@mail.gmail.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Subject: Re: [linux-lvm] lvm commands hanging when run from inside a
 kubernetes pod
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
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-lvm-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Message-ID: <20220530151503.UdV8qWHb2jhcXV1ATqMdACiklJeuFLhOpTONjy3G0wI@z>

Dne 27. 05. 22 v 9:02 Abhishek Agarwal napsal(a):
> When a kubernetes pod is scheduled on the node having lvm2 libraries already 
> installed and trying to run lvm commands using those node binaries from inside 
> the pod container, the commands hang and are waiting on something to complete. 
> Although when ctrl+c is pressed the terminal session resumes and checking the 
> final code for the execution returns a "0" error code and the commands 
> operation is also carried out successfully.
> 
> 

lvm2 is *NOT* designed to be executed in/from a container.

It cannot work properly as it directly communicates with system's udevd - 
which you likely don't have running in your container.

You could kind of 'fake it' by running lvm2 wihout udev synchronization - but 
this will just open another cave of other problems (missing synchronization).

So your lvm2 command should be always executed on your hosting machine
(since it does control resources without containerization support - like 
devices) and then you should 'pass' created LV to  your container in some way.

Regards

Zdenek

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

