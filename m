Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51A81C77B6E
	for <linux-lvm@archiver.kernel.org>; Thu, 13 Apr 2023 20:30:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1681417803;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=cHRA8tR41EtmFlFF0NMeho4wHcf0ueD6I9O1eKeQ9B0=;
	b=d4QTGLiM8MYXxCfR/PsU22KMLS9cd2DqMFGQU5EUnXA778TDhbgwhQlTHFPbX086kgkmVd
	BQgWPD6RzFlR8h+NllBheoEnMxcZzQUV4BkPcL9A5GO/f5G8q/ZL5bszdfvrnLo83bFcW0
	UsUOH8PNcTm20sM8Yd89DSsb5gyP0jw=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-586-EnGelAYWPQudaJ_S3OQv8A-1; Thu, 13 Apr 2023 16:29:31 -0400
X-MC-Unique: EnGelAYWPQudaJ_S3OQv8A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7A6B81C04326;
	Thu, 13 Apr 2023 20:29:28 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8AF952027043;
	Thu, 13 Apr 2023 20:29:22 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 6234D1946A46;
	Thu, 13 Apr 2023 20:29:22 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 1C7CC19465B7
 for <linux-lvm@listman.corp.redhat.com>; Thu, 13 Apr 2023 20:28:59 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 688D2492B01; Thu, 13 Apr 2023 20:28:59 +0000 (UTC)
Received: from redhat.com (null.msp.redhat.com [10.15.80.136])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3A443492B00;
 Thu, 13 Apr 2023 20:28:59 +0000 (UTC)
Date: Thu, 13 Apr 2023 15:28:59 -0500
From: David Teigland <teigland@redhat.com>
To: Zhiyong Ye <yezhiyong@bytedance.com>
Message-ID: <20230413202859.GC15123@redhat.com>
References: <ac0f39c8-932d-293a-b7aa-568532bda22a@bytedance.com>
 <20230411133147.GB27598@redhat.com>
 <e318740a-bb17-8e38-ed3f-f1776292b47c@bytedance.com>
MIME-Version: 1.0
In-Reply-To: <e318740a-bb17-8e38-ed3f-f1776292b47c@bytedance.com>
User-Agent: Mutt/1.8.3 (2017-05-23)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
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
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Apr 12, 2023 at 05:16:41PM +0800, Zhiyong Ye wrote:
> configure mpath on sda alone on the current stock of machines. And I tested
> this in my environment using lvchange --refresh, but it doesn't switch the
> active LV to use mpatha.

It seems to work for me with the latest version of lvm, which may be due
to improved multipath component detection and/or improved handling of
duplicate PVs.  So the current upstream code might work for you also.

# pvs
  PV         VG           Fmt  Attr PSize    PFree   
  /dev/sdf   ff           lvm2 a--  <931.01g <930.76g

# lvs -o+devices 
  LV    VG           Attr       LSize    Origin Devices                      
  lvol1 ff           -wi-ao----  256.00m        /dev/sdf(1)                  

# mount | grep ff
/dev/mapper/ff-lvol1 on /mnt type xfs (rw,relatime,seclabel,attr2,inode64,logbufs=8,logbsize=32k,noquota)

# multipath -a /dev/sdf
wwid '3690b11c0000438ad0000057150910423' added

# multipath -l
mpatha (3690b11c0000438ad0000057150910423) dm-4 DELL,MD32xxi
size=931G features='2 pg_init_retries 50' hwhandler='1 rdac' wp=rw
`-+- policy='service-time 0' prio=0 status=active
  `- 7:0:0:4 sdf 8:80 active undef running

# pvs
  WARNING: Device mismatch detected for ff/lvol1 which is accessing /dev/sdf instead of /dev/mapper/mpatha.
  PV                 VG           Fmt  Attr PSize    PFree   
  /dev/mapper/mpatha ff           lvm2 a--  <931.01g <930.76g

# lvs ff
  WARNING: Device mismatch detected for ff/lvol1 which is accessing /dev/sdf instead of /dev/mapper/mpatha.
  LV    VG Attr       LSize   
  lvol1 ff -wi-ao---- 256.00m

# dmsetup table ff-lvol1
0 524288 linear 8:80 10240

# lvchange --refresh ff/lvol1

# dmsetup table ff-lvol1
0 524288 linear 253:4 10240

# pvs
  PV                 VG           Fmt  Attr PSize    PFree   
  /dev/mapper/mpatha ff           lvm2 a--  <931.01g <930.76g

# lvs -o+devices ff
  LV    VG Attr       LSize   Devices              
  lvol1 ff -wi-ao---- 256.00m /dev/mapper/mpatha(1)

Dave
_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

