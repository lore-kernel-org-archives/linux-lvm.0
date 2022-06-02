Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1ABCFC43334
	for <linux-lvm@archiver.kernel.org>; Thu,  2 Jun 2022 19:01:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1654196470;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=2TJ8eCc0JjvPG42hFc7AMhVFmQmXMVqA9BNEliu0JuU=;
	b=Edgasvx8UhCE9IiDh4dZRZoHP4vvYwEKTbes+c877LnHzZ6T0CLWTXV+8jTDcjftKis9Kf
	zlt2SLXMjpIvufRcP8Xi/5yfg5NNShE8ClVvu1gmcIPTHmySXQr4e8qmwOxgpk1cRwDxzg
	56DflCUF6K6yDzbq1KURivSIvdGpRuc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-642-kZ38UGouMvWVvhMVlMk8hg-1; Thu, 02 Jun 2022 15:01:06 -0400
X-MC-Unique: kZ38UGouMvWVvhMVlMk8hg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7645283396E;
	Thu,  2 Jun 2022 19:01:03 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A066B1121314;
	Thu,  2 Jun 2022 19:00:59 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 6B6D11947042;
	Thu,  2 Jun 2022 19:00:59 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id A3A3E19466DF
 for <linux-lvm@listman.corp.redhat.com>; Thu,  2 Jun 2022 19:00:58 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 8D6A03323E; Thu,  2 Jun 2022 19:00:58 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
 (mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 884461731B
 for <linux-lvm@redhat.com>; Thu,  2 Jun 2022 19:00:58 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6C9B02809CD7
 for <linux-lvm@redhat.com>; Thu,  2 Jun 2022 19:00:58 +0000 (UTC)
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-452-_H9FJrJeOGOsYmvznM3Okw-1; Thu, 02 Jun 2022 15:00:57 -0400
X-MC-Unique: _H9FJrJeOGOsYmvznM3Okw-1
Received: by mail-lf1-f72.google.com with SMTP id
 p36-20020a05651213a400b004779d806c13so2965184lfa.10
 for <linux-lvm@redhat.com>; Thu, 02 Jun 2022 12:00:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:content-transfer-encoding;
 bh=lG7QkSj8OucUSBW0G6x2yQDYngHIL5Qi5e8BJKykH10=;
 b=hkPRaVqrVFQjhnyxMrz5TzgdzWC/UkhOp2+f1kJnBXE6DP986SBipTU3N2NaA/Av49
 vP3q/OTCygoQwNr4XMb+op7/gsJl45+VEub6a5BLpJCsbulBF+mKHBiBE1vqygqwUSzO
 aGJhxe0hbbzoopxNPFbAgnL+JJDcaTgKTAjxr0N8K7l3knFk/FnjEWVMSvfIEVWxPIpj
 4/OLqXPUQx+lNyyfOuGh4HMCVuKpNvhc83on7jWEs/M7NBQCpKSiIObCTbWcWtP/5ggA
 0J843ohxYnZIbxObDwODkVfq52X2yNyZB6D2CegdmYtJlUuy6oX1SvUGaexoi0iKdlMm
 L45A==
X-Gm-Message-State: AOAM533wj7Lzvm7jWUNUqMpH/u5abptbJ4BZ8l7dvcvCvNm51T1/omk/
 koBdKbXpI7m2Lz6+Z1VnfAJ068kd2jeDFM3iCXspzhDJTxQaOUiLasRP5CjbDZA7S4AYO01M8iY
 rEO1GIp9/serWITOhWXoG/emdwa3VDpBe
X-Received: by 2002:a2e:a796:0:b0:255:528d:3483 with SMTP id
 c22-20020a2ea796000000b00255528d3483mr10534730ljf.453.1654196452323; 
 Thu, 02 Jun 2022 12:00:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw5wPHysU8QS0Wb3flzzEJJ/A96VeEa+DnAs+vDTf/MaOInEeltJXN+J9sYBNgNtyepsZ3YIpg/4s/kLqE439g=
X-Received: by 2002:a2e:a796:0:b0:255:528d:3483 with SMTP id
 c22-20020a2ea796000000b00255528d3483mr10534724ljf.453.1654196452087; Thu, 02
 Jun 2022 12:00:52 -0700 (PDT)
MIME-Version: 1.0
References: <CAM3OQJGWsYo=boQBHqmLj1HRRtg14p3-Tp3yeu7KMYcKV2_hOA@mail.gmail.com>
 <CAAMCDecMgzcyQOdb2n-zLRwrHhK9wFSicHJDeA_9zhvSQbyPdw@mail.gmail.com>
 <CAM3OQJEEttEn22Ao3GJK=GYKSUj3Sp0brU1mv2_s1dnMeFUg5g@mail.gmail.com>
 <YpcUpGsiSjwK8cG2@itl-email>
 <CAM3OQJHe3GKfAqR4A3QT6Q6TgiG-qpHNBHfnEczD3eH+ruq0VA@mail.gmail.com>
In-Reply-To: <CAM3OQJHe3GKfAqR4A3QT6Q6TgiG-qpHNBHfnEczD3eH+ruq0VA@mail.gmail.com>
From: Nir Soffer <nsoffer@redhat.com>
Date: Thu, 2 Jun 2022 22:00:35 +0300
Message-ID: <CAMRbyyuLG9WTo31mAzo0tVMTANmEEnJ+JnfxSAuDyB25Fo3FFg@mail.gmail.com>
To: LVM general discussion and development <linux-lvm@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-lvm-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Jun 2, 2022 at 9:41 AM Abhishek Agarwal
<mragarwal.developer@gmail.com> wrote:
>
> These are not different LVM processes. The container process is using the LVM binary that the node itself has. We have achieved this by using scripts that point to the same lvm binary that is used by the node.
>
> Configmap(~shell script) used for the same has the following contents where `/host` refers to the root directory of the node:
>
> get_bin_path: |
>   #!/bin/sh
>   bin_name=$1
>   if [ -x /host/bin/which ]; then
>     echo $(chroot /host /bin/which $bin_name | cut -d ' ' -f 1)
>   elif [ -x /host/usr/bin/which ]; then
>     echo $(chroot /host /usr/bin/which $bin_name | cut -d ' ' -f 1)
>   else
>     $(chroot /host which $bin_name | cut -d ' ' -f 1)
>   fi
>
> lvcreate: |
>   #!/bin/sh
>   path=$(/sbin/lvm-eg/get_bin_path "lvcreate")
>   chroot /host $path "$@"
>
> Also, the above logs in the pastebin link have errors because the vg lock has not been acquired and hence creation commands will fail. Once the lock is acquired, the `strace -f` command gives the following output being stuck. Check out this link for full details -> https://pastebin.com/raw/DwQfdmr8
>
> P.S: We at OpenEBS are trying to provide lvm storage to cloud native workloads with the help of kubernetes CSI drivers and since all these drivers run as pods and help dynamic provisioning of kubernetes volumes(storage) for the application, the lvm commands needs to be run from inside the pod. Reference -> https://github.com/openebs/lvm-localpv

For using LVM in Kubernetes, why not toplvm?
https://github.com/topolvm/topolvm

The design looks right, running lvm commands on the host:
https://github.com/topolvm/topolvm/blob/main/docs/design.md

Nir

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

