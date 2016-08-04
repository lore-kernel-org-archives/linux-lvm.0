Received: from mx1.redhat.com (ext-mx10.extmail.prod.ext.phx2.redhat.com
	[10.5.110.39])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u74CsCCg008248
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO) for <linux-lvm@redhat.com>; Thu, 4 Aug 2016 08:54:12 -0400
Received: from mail.ant.gliwice.pl (mail.ant.gliwice.pl [93.179.197.152])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id DDA1963707
	for <linux-lvm@redhat.com>; Thu,  4 Aug 2016 12:54:09 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.ant.gliwice.pl (Postfix) with ESMTP id CE5FE36A510
	for <linux-lvm@redhat.com>; Thu,  4 Aug 2016 14:45:20 +0200 (CEST)
Received: from mail.ant.gliwice.pl ([127.0.0.1])
	by localhost (beauty.ant.gliwice.pl [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id JNgIOMBkX5aJ for <linux-lvm@redhat.com>;
	Thu,  4 Aug 2016 14:45:20 +0200 (CEST)
Received: from matkor-lenovo.localnet (aela111.neoplus.adsl.tpnet.pl
	[79.191.26.111])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.ant.gliwice.pl (Postfix) with ESMTPSA id 4B96D36A509
	for <linux-lvm@redhat.com>; Thu,  4 Aug 2016 14:45:20 +0200 (CEST)
From: Mateusz Korniak <mateusz-lists@ant.gliwice.pl>
Date: Thu, 04 Aug 2016 12:45:15 +0000
Message-ID: <1944618.qWRikSC7le@matkor-lenovo>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] After system reboot lvm2 is copying _from_ cachepool LV
	to origin (cached write-through) LV ?
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
To: LVM general discussion and development <linux-lvm@redhat.com>

I "lost" one of HDD  which contained origin cached LV.

After hard reboot, I see HDD back, but LVM is syncing _from_ cachepool to 
origin (cached) disk .

As it is write-through cache it makes no sense to me. :/

Can anybody explain what is going on here? 
TIA, regards,


# lvs -o+cache_policy,cache_settings,chunksize,devices
  LV               VG               Attr       LSize  Pool                         
Origin Data%  Meta%  Move Log Cpy%Sync Convert CachePolicy CacheSettings             
Chunk  Devices                  
  cass1_biuro_data vg_cached     Cwi-aoC---  1.76t 
[cass1_biuro_data_cachepool]        100.00 26.06           88.68            mq          
read_promote_adjustment=1 64.00k cass1_biuro_data_corig(0)


# dmsetup status vg_cached-cass1_biuro_data                                                                                                                                                                                                          
0 3783884800 cache 8 5605/21504 128 1884160/1884160 9886481 17995266 908336 
1489671 0 3 1657503 1 writethrough 2 migration_threshold 2048 mq 10 
random_threshold 0 sequential_threshold 0 discard_promote_adjustment 0 
read_promote_adjustment 0 write_promote_adjustment 0 rw - 

Linux host8 4.6.3-1 #1 SMP Sun Jun 26 11:11:38 CEST 2016 x86_64 
AMD_Phenom(tm)_II_X6_1090T_Processor PLD Linux

# rpm -q lvm2                                                                                                                                                                                                                                           
lvm2-2.02.149-1.x86_64


-- 
Mateusz Korniak
"(...) mam brata - poważny, domator, liczykrupa, hipokryta, pobożniś,
 	krótko mówiąc - podpora społeczeństwa."
				Nikos Kazantzakis - "Grek Zorba"
