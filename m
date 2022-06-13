Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B4C3C433EF
	for <linux-lvm@archiver.kernel.org>; Tue, 14 Jun 2022 06:38:02 +0000 (UTC)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-148-YhULXkGPN_OjIhUBsdElSA-1; Tue, 14 Jun 2022 02:37:57 -0400
X-MC-Unique: YhULXkGPN_OjIhUBsdElSA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C0F3A811E7A;
	Tue, 14 Jun 2022 06:37:55 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5F942400F3FF;
	Tue, 14 Jun 2022 06:37:49 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 14D57194706F;
	Tue, 14 Jun 2022 06:37:49 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id B01D9194705B
 for <linux-lvm@listman.corp.redhat.com>; Mon, 13 Jun 2022 08:49:16 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 9E30D4010E4D; Mon, 13 Jun 2022 08:49:16 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
 (mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 987BF404E4C3
 for <linux-lvm@redhat.com>; Mon, 13 Jun 2022 08:49:16 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 80B89185A79C
 for <linux-lvm@redhat.com>; Mon, 13 Jun 2022 08:49:16 +0000 (UTC)
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com
 [209.85.215.175]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-125-4EUZuqFNP4aZh2pzhozchw-1; Mon, 13 Jun 2022 04:49:14 -0400
X-MC-Unique: 4EUZuqFNP4aZh2pzhozchw-1
Received: by mail-pg1-f175.google.com with SMTP id f65so4962583pgc.7
 for <linux-lvm@redhat.com>; Mon, 13 Jun 2022 01:49:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:to:from
 :subject:content-transfer-encoding;
 bh=FpHaZet4m3o3e+zddZzkf7twUv85SJ/XeUBjfxuaZ5o=;
 b=b343lPQw4EQwflqNM8Yp7FGT22aiX1+H3+kW3g2OnXlrn5vzkwSqzxOZ1GV8jihk83
 V9SULHXkbs4+FXDwq7JFyd702DN+ixiA3o5sik+9VgV/aalVuJ5gkhb+DJZpDbDSNrE5
 B1TBTJvKPBuUZ9bUhcF1ssiHTPEXRliXgHkK6DuD5RU2rRm/E00wBaAuSHEQBi8xisBb
 xbbbsf28C9o8Q/vShF53O0daMOh9wFflZgUcF//TuQPsYI0bZhWJ4BJMJBcAEyXFAtQh
 ffWK9x1P+JsA1mpPUrUeKjlGDc2R8GorcK7+XrbzCVaNOznhNx0GEcgRQlEr0N37qBuS
 vbYw==
X-Gm-Message-State: AOAM530dvnlTNxLM4xbNYpMPsIasdKlTuXEz8FHsx9GBra3Rh6G/n+Va
 +ynY5/gTFlElNOZRRHqR/3HqAYaNDI4CPg==
X-Google-Smtp-Source: ABdhPJyib3t3ABAyK7tVVkfvbo9mvTfI1/2XiJINN0WIX88Oz5lQsMvC2rvUYtgx5H2/EoOUccctDg==
X-Received: by 2002:a05:6a00:10d3:b0:4fe:5d:75c8 with SMTP id
 d19-20020a056a0010d300b004fe005d75c8mr58220205pfu.6.1655110153463; 
 Mon, 13 Jun 2022 01:49:13 -0700 (PDT)
Received: from [10.4.113.62] ([139.177.225.233])
 by smtp.gmail.com with ESMTPSA id
 iz3-20020a170902ef8300b0015e9d4a5d27sm4517503plb.23.2022.06.13.01.49.12
 for <linux-lvm@redhat.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Jun 2022 01:49:13 -0700 (PDT)
Message-ID: <9c22b11a-b539-1974-7994-6835eea82bfd@bytedance.com>
Date: Mon, 13 Jun 2022 16:49:10 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.0
To: linux-lvm@redhat.com
From: Zhiyong Ye <yezhiyong@bytedance.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
X-Mailman-Approved-At: Tue, 14 Jun 2022 06:37:47 +0000
Subject: [linux-lvm] Why is the performance of my lvmthin snapshot so poor
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
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-lvm-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"

Hi all,

I am new to lvmthin. When I created snapshots using lvmthin, the write 
performance of the original lvm was poor.

After I create thin lv with zeroing disabled, I first write the whole 
volume with fio, then create snapshot, and finally test the write 
performance of this volume with fio again. The performance after 
creating a snapshot is very poor, only 10% of the thick lv, and also 
much worse than the performance of the first write of thin lv. The 
performance data for random writes in my environment fio is as follows:
case                    iops
thick lv                63043
thin lv                 42130
snapshotted thin lv     5245

It is mentioned in the lvmthin main page under "Chunk size" that the 
size of chunksize has an impact on snapshot performance. So I tested the 
write performance after creating snapshots with different chunksize. The 
data is shown below:
chunksize               iops
64k                     5245
256k                    2115
1024k                   509

The performance degradation after snapshotting is expected as writing to 
a snapshotted lv involving reading the original data, writing it 
elsewhere and then writing new data into the original chunk. But the 
performance loss was so much more than I expected. Is there any way to 
improve performance after creating a snapshot? Can I ask for your help?

Regards,

Zhiyong Ye

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

