Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CBB0C77B6E
	for <linux-lvm@archiver.kernel.org>; Fri, 14 Apr 2023 06:53:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1681455202;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=blONSgCo4efJxqHC/TnP7T3UGTrbkOZbtYniOYyg098=;
	b=Kem/DDf3GPma7kOOE0+lX7XukIF19ITWKGlkmS1BE50LdbDmf0PJGqGz4l+DogxvzbqUFr
	FgUjulZfQcEKp76+vDadNFezDMZRXSZRS+ON2O2szxOQQOubLZQnhVT8jTJitnuDkZtgQi
	kZweoWMjWmvsfx5B8P8xE/1M8t3Ij1Q=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-447-l59StC5oMaKAGrjuXjaEQg-1; Fri, 14 Apr 2023 02:52:18 -0400
X-MC-Unique: l59StC5oMaKAGrjuXjaEQg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D67578996FF;
	Fri, 14 Apr 2023 06:52:15 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1CF972027044;
	Fri, 14 Apr 2023 06:52:12 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id C84921946A76;
	Fri, 14 Apr 2023 06:52:11 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id E647519465B6
 for <linux-lvm@listman.corp.redhat.com>; Fri, 14 Apr 2023 03:55:33 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id C95392027045; Fri, 14 Apr 2023 03:55:33 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
 (mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C1FE42027044
 for <linux-lvm@redhat.com>; Fri, 14 Apr 2023 03:55:33 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 757CE3806702
 for <linux-lvm@redhat.com>; Fri, 14 Apr 2023 03:55:33 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com
 [209.85.214.179]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-403-Gr3GzEZSO0-vTBnoZNU2pg-1; Thu, 13 Apr 2023 23:55:31 -0400
X-MC-Unique: Gr3GzEZSO0-vTBnoZNU2pg-1
Received: by mail-pl1-f179.google.com with SMTP id
 d9443c01a7336-1a67bcde3a7so5804645ad.3
 for <linux-lvm@redhat.com>; Thu, 13 Apr 2023 20:55:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681444530; x=1684036530;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=tJqP5uP7vBBoWqoQJVMGiaXTRa1FL4ZXmtz/eatGSjA=;
 b=LfLIAMiflqMjEZzh0SFH2G5HvK/dFLqohrx/G4ygQMDzqgC7iWl6CFJ6C2gYwOLVMf
 m/y17mdVINdlL0LE1gekVmf6A8RDhbGG+yabCHSCnZPmGZWsNKwYmVOTSKgLnsJTV1t7
 ALNsZ3LqtIUdx2gDGHxS7JYITnNWjF/UB8fv3WExNrVOZkgc3stxUdVl1WsZxr47I0C8
 L4U1EYid1LAO4/WkyGHNCED0xdtC5XWNlXyh2ThLfjPqhHjMzZZC9a1Tia7vhH6V/4Oo
 qzFN353C+MTXGt4Ctz2OkD0+4WaNo1N0nmNEbmxcmD8Dsip0tYmtByeOeRXHuAgoJBwz
 9gWw==
X-Gm-Message-State: AAQBX9fpw1rPq8aZ5wKMjYkg1+1o5KUop5GV2H4fM6Gh6jAUuctAz6lT
 zDkinaB25aK1q7s+Gs2dQmGiYWxH+PnwYeL1Hy0=
X-Google-Smtp-Source: AKy350bO3vgb3iVHhZ1ThGpWeaWmy2EBXBLNrF8STJagpdksO9jPgE0U//7cPHkW3n+QLLAjLxWB6w==
X-Received: by 2002:a05:6a00:2314:b0:63a:75a4:b2d4 with SMTP id
 h20-20020a056a00231400b0063a75a4b2d4mr6840959pfh.24.1681444530125; 
 Thu, 13 Apr 2023 20:55:30 -0700 (PDT)
Received: from [10.87.56.20] ([139.177.225.237])
 by smtp.gmail.com with ESMTPSA id
 t2-20020a634602000000b0050f93a3586fsm2047814pga.37.2023.04.13.20.55.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Apr 2023 20:55:29 -0700 (PDT)
Message-ID: <f98d6a2b-5ab8-0b32-8ff3-27bc3aedfb8f@bytedance.com>
Date: Fri, 14 Apr 2023 11:55:26 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
To: David Teigland <teigland@redhat.com>
References: <ac0f39c8-932d-293a-b7aa-568532bda22a@bytedance.com>
 <20230411133147.GB27598@redhat.com>
 <e318740a-bb17-8e38-ed3f-f1776292b47c@bytedance.com>
 <20230413202859.GC15123@redhat.com>
From: Zhiyong Ye <yezhiyong@bytedance.com>
In-Reply-To: <20230413202859.GC15123@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Mailman-Approved-At: Fri, 14 Apr 2023 06:52:11 +0000
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: bytedance.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"

Hi Dave,

Thank you for your patience and explanations.

When I filtered out the sda device on the lvm configuration file it 
works fine. I will test it again with the latest version of lvm and 
compare which patches have been added.

I learned a lot from our discussions and thank you again for your help.

Regards

Zhiyong

On 4/14/23 4:28 AM, David Teigland wrote:
> On Wed, Apr 12, 2023 at 05:16:41PM +0800, Zhiyong Ye wrote:
>> configure mpath on sda alone on the current stock of machines. And I tested
>> this in my environment using lvchange --refresh, but it doesn't switch the
>> active LV to use mpatha.
> 
> It seems to work for me with the latest version of lvm, which may be due
> to improved multipath component detection and/or improved handling of
> duplicate PVs.  So the current upstream code might work for you also.
> 
> # pvs
>    PV         VG           Fmt  Attr PSize    PFree
>    /dev/sdf   ff           lvm2 a--  <931.01g <930.76g
> 
> # lvs -o+devices
>    LV    VG           Attr       LSize    Origin Devices
>    lvol1 ff           -wi-ao----  256.00m        /dev/sdf(1)
> 
> # mount | grep ff
> /dev/mapper/ff-lvol1 on /mnt type xfs (rw,relatime,seclabel,attr2,inode64,logbufs=8,logbsize=32k,noquota)
> 
> # multipath -a /dev/sdf
> wwid '3690b11c0000438ad0000057150910423' added
> 
> # multipath -l
> mpatha (3690b11c0000438ad0000057150910423) dm-4 DELL,MD32xxi
> size=931G features='2 pg_init_retries 50' hwhandler='1 rdac' wp=rw
> `-+- policy='service-time 0' prio=0 status=active
>    `- 7:0:0:4 sdf 8:80 active undef running
> 
> # pvs
>    WARNING: Device mismatch detected for ff/lvol1 which is accessing /dev/sdf instead of /dev/mapper/mpatha.
>    PV                 VG           Fmt  Attr PSize    PFree
>    /dev/mapper/mpatha ff           lvm2 a--  <931.01g <930.76g
> 
> # lvs ff
>    WARNING: Device mismatch detected for ff/lvol1 which is accessing /dev/sdf instead of /dev/mapper/mpatha.
>    LV    VG Attr       LSize
>    lvol1 ff -wi-ao---- 256.00m
> 
> # dmsetup table ff-lvol1
> 0 524288 linear 8:80 10240
> 
> # lvchange --refresh ff/lvol1
> 
> # dmsetup table ff-lvol1
> 0 524288 linear 253:4 10240
> 
> # pvs
>    PV                 VG           Fmt  Attr PSize    PFree
>    /dev/mapper/mpatha ff           lvm2 a--  <931.01g <930.76g
> 
> # lvs -o+devices ff
>    LV    VG Attr       LSize   Devices
>    lvol1 ff -wi-ao---- 256.00m /dev/mapper/mpatha(1)
> 
> Dave
> 

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

