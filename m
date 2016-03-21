Received: from mx1.redhat.com (ext-mx08.extmail.prod.ext.phx2.redhat.com
	[10.5.110.32])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u2LDV3XT006221
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Mon, 21 Mar 2016 09:31:03 -0400
Received: from mail-pf0-f178.google.com (mail-pf0-f178.google.com
	[209.85.192.178])
	by mx1.redhat.com (Postfix) with ESMTPS id 2B775C00EB02
	for <linux-lvm@redhat.com>; Mon, 21 Mar 2016 13:31:02 +0000 (UTC)
Received: by mail-pf0-f178.google.com with SMTP id u190so265783920pfb.3
	for <linux-lvm@redhat.com>; Mon, 21 Mar 2016 06:31:02 -0700 (PDT)
Received: from [192.168.8.65] ([118.211.81.152])
	by smtp.gmail.com with ESMTPSA id
	cq4sm40936876pad.28.2016.03.21.06.30.59 for <linux-lvm@redhat.com>
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 21 Mar 2016 06:31:00 -0700 (PDT)
From: Manuel Bernal Llinares <mbdebian@gmail.com>
Message-Id: <899CF6EA-902E-4407-BF59-8BB3671E94C6@gmail.com>
Date: Tue, 22 Mar 2016 00:00:58 +1030
Mime-Version: 1.0 (Mac OS X Mail 9.2 \(3112\))
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] lvm cache on debian 8, missing cache information
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
Content-Type: text/plain; charset="utf-8"
To: linux-lvm@redhat.com

Hi guys,

I’m trying to set up lvmcache for a backup volume I use for time machine.

I’ve seen there is quite a lot of very good documentation about this, but also out of sync between different linux systems, e.g. I can’t get those cache* attributes when running lvs on debian 8.

As you can see under this lines, “tmachine” is a cached LVM volume
# lvs -a
  LV                     VG          Attr       LSize   Pool           Origin           Data%  Meta%  Move Log Cpy%Sync Convert
  backups                blackhole   -wi-ao----   5,00t                                                                       
  clasificador           blackhole   -wi-ao----   1,00t                                                                       
  [lvol0_pmspare]        blackhole   ewi------- 592,00m                                                                       
  nfs_home               blackhole   -wi-ao----   1,00t                                                                       
  tmachine               blackhole   Cwi-aoC---   3,00t tmachine_cache [tmachine_corig]                                       
  tmachine_cache         blackhole   Cwi---C--- 231,67g                                                                       
  [tmachine_cache_cdata] blackhole   Cwi-ao---- 231,67g                                                                       
[tmachine_cache_cmeta] blackhole   ewi-ao---- 592,00m                                                                       
  [tmachine_corig]       blackhole   owi-aoC---   3,00t                                                                       

Even with a couple of mac computers sending its time machine data for a while, the cache seems to not be working.

This are the parameters described by “dmsetup status” when run on that volume:

# dmsetup status /dev/blackhole/tmachine 
0 6442450944 cache 8 12849/151552 128 11886/3795648 17772 177033 2798405 1620326 0 3856 1 1 writeback 2 migration_threshold 2048 mq 10 random_threshold 4 sequential_threshold 512 discard_promote_adjustment 1 read_promote_adjustment 4 write_promote_adjustment 8

I’ve tested another cache alternative (flashcache) before, and the parameter "sequential_threshold” sounds familiar to me, I suspect it is the one making the cache flag the data transfer as “sequential”, passing it through to the backend (slow) device, instead of using the cache to absorb the writing traffic, and clean dirty blocks later, behavior I saw when using flashcache.

“sequential_threshold” is configured, by default, with a value of 512, but I haven’t been able to find what’s that 512, maybe extents, bytes, kb, mb? Unfortunately, I haven’t been able to find a way, at least in Debian, to change those parameters, neither creating the cache nor once it’s already been created.

Any ideas?

Thank you for your help guys!!!





--------
Manuel Bernal Llinares
mbdebian@gmail.com
M.Sc. in Computer Science
