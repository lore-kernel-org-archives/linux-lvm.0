Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06CAAC43334
	for <linux-lvm@archiver.kernel.org>; Mon,  6 Jun 2022 17:33:45 +0000 (UTC)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-298-gsgcqLkwPtei6tsGMIsLrQ-1; Mon, 06 Jun 2022 13:33:41 -0400
X-MC-Unique: gsgcqLkwPtei6tsGMIsLrQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 78E6B802E5B;
	Mon,  6 Jun 2022 17:33:39 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7B62B1121314;
	Mon,  6 Jun 2022 17:33:35 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 170B3194707E;
	Mon,  6 Jun 2022 17:33:35 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id C35E6194706E
 for <linux-lvm@listman.corp.redhat.com>; Mon,  6 Jun 2022 17:33:33 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 9E52F1410F3B; Mon,  6 Jun 2022 17:33:33 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
 (mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9A6BC1410F39
 for <linux-lvm@redhat.com>; Mon,  6 Jun 2022 17:33:33 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 83623185A79C
 for <linux-lvm@redhat.com>; Mon,  6 Jun 2022 17:33:33 +0000 (UTC)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com
 [209.85.208.52]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-256-0066TRJPOLWRCFeqJ8pgJw-1; Mon, 06 Jun 2022 13:33:31 -0400
X-MC-Unique: 0066TRJPOLWRCFeqJ8pgJw-1
Received: by mail-ed1-f52.google.com with SMTP id n28so19777776edb.9
 for <linux-lvm@redhat.com>; Mon, 06 Jun 2022 10:33:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=Z6mBoa8CmeD1Mj6RntOyjfeyzdns4dCpwMtfntiyu2Q=;
 b=FinI1ayqa24Dv0+BHsfUNXqS4G9ECuCH66ynj+Rj1y11W3qn4PG38a+nnMhlsLvYOS
 YE6zbmEAvMA4LDEm0+cLHVDDWl0wCvsJjFMF8/3/E2c0Ko78kdjVw3B6CecNZPeH0oBK
 vpDLm6D49rcG+bGcBxb/PkRlOwoWMHvqzl2SijYSTfACU9CbEFxE08Y5JJQ5tCVny70L
 zqZw9BeJ7szqPM2b//Vo1EczMhiD4lBRphWLK26qHA1FDmpATK5cUrO9QK8DD9wu03EZ
 krjFn/cSTYbNNampnZi8mx2cRVfcrkzfMNls7qb+6OE3Bd33EAoSxS6cCMIZdAchUQtd
 ngaA==
X-Gm-Message-State: AOAM531bydK6dtkPjEQbvekOcAMRfIYtMyJra+6DDZBwWivDF9mlFCua
 UiJsjXDNCVr+3htE5fGg+Vw4TZXhtR79Jn8LXvn2u6shcnNNIA==
X-Google-Smtp-Source: ABdhPJzzP93plEdr8ZucTAhavF4bSkxztjYGjtMXtVNCh9+JBJQTqarvtWnW9OOb0ho7IMZmcw6Kk/0T196eM82BbWw=
X-Received: by 2002:a50:fc0d:0:b0:42d:c1ae:28bc with SMTP id
 i13-20020a50fc0d000000b0042dc1ae28bcmr28849317edr.24.1654536810131; Mon, 06
 Jun 2022 10:33:30 -0700 (PDT)
MIME-Version: 1.0
From: CoolCold <coolthecold@gmail.com>
Date: Tue, 7 Jun 2022 00:33:17 +0700
Message-ID: <CAGqmV7o+nFVUkbSpt_oRVbHshv-yWn56Rxk6b7=rpZC7fiLrdg@mail.gmail.com>
To: linux-lvm@redhat.com
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Subject: [linux-lvm] dm-cache / lvmcache - no cleanup for dirty data in
 writeback/cleaner mode
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

Good day!

Main issue as I see it: dirty data size grows, cached data size
declines, no automagic flushing happens (or much slower than growing
up)
Sub issue: cleaner policy flushes data back to origin device very slowly.

  LVM version:     2.03.07(2) (2019-11-30)
  Kernel 5.4.0-109-generic #123-Ubuntu SMP Fri Apr 8 09:10:54 UTC 2022
x86_64 x86_64 x86_64 GNU/Linux

Sizes: 2TB origin/700GB cache device
  [cachedata_cpool]       vg0 Cwi---C--- 700.00g
         99.99  21.21           72.70
  [cachedata_cpool_cdata] vg0 Cwi-ao---- 700.00g
  [cachedata_cpool_cmeta] vg0 ewi-ao----  20.00m

Let's start from cleaner mode, as it what is happening on server right now:

root@TasteWP2:~# lvs -o+cache_policy,cache_settings
  LV       VG  Attr       LSize   Pool              Origin       Data%
 Meta%  Move Log Cpy%Sync Convert CachePolicy CacheSettings
  data     vg0 Cwi-aoC---   2.00t [cachedata_cpool] [data_corig] 99.99
 21.21           72.70            cleaner
migration_threshold=65536

and Cpy%Sync moving down very slowly - over 4 hours, it moved from
72.74% to 72.70% only.

The origin device (a couple of HDDs in mdadm RAID1) is almost idling,
5-15% busy based on iostat.

graphical representation from collectd/rrd - https://snipboard.io/WNdGhz.jpg

What I've tried to do: play around setting migration_threshhold, but
see no changes
lvchange --cachesettings 'migration_threshold=65536' vg0/data
lvchange --cachesettings 'migration_threshold=8192' vg0/data

 ---
I think this subissue leads to the main issue with dirty growing up,
not leaving space for "real" data.

My very limited knowledge, checking through history on github
https://github.com/torvalds/linux/commits/master/drivers/md/dm-cache-target.c
back to 2019 (time of kernel release)
have not provided any hints on fixes/changes added here, so I'm bit
lost. Help is appreciated.

-- 
Best regards,
[COOLCOLD-RIPN]

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

