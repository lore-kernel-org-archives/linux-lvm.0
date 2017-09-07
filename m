Received: from mx1.redhat.com (ext-mx08.extmail.prod.ext.phx2.redhat.com
	[10.5.110.32])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1670F6058F
	for <linux-lvm@redhat.com>; Thu,  7 Sep 2017 08:06:40 +0000 (UTC)
Received: from nm6-vm8.bullet.mail.ir2.yahoo.com
	(nm6-vm8.bullet.mail.ir2.yahoo.com [212.82.96.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id CE7FBC0587E8
	for <linux-lvm@redhat.com>; Thu,  7 Sep 2017 08:06:38 +0000 (UTC)
From: lejeczek <peljasz@yahoo.co.uk>
Message-ID: <38537c05-ba92-9817-a791-19ac39b9615f@yahoo.co.uk>
Date: Thu, 7 Sep 2017 09:06:27 +0100
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
Subject: [linux-lvm] lv raid - how to read this?
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
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: linux-lvm@redhat.com

hi fellas

I'm setting up a lvm raid0, 4 devices, I want raid0 and I 
understand & expect - there will be four stripes, all I care 
of is speed.
I do:
$ lvcreate --type raid0 -i 4 -I 16 -n 0 -l 96%pv 
intel.raid0-0 /dev/sd{c..f} # explicitly four stripes

I see:
$ mkfs.xfs /dev/mapper/intel.sataA-0 -f
meta-data=/dev/mapper/intel.sataA-0 isize=512    agcount=32, 
agsize=30447488 blks
          =                       sectsz=512   attr=2, 
projid32bit=1
          =                       crc=1        finobt=0, 
sparse=0
data     =                       bsize=4096   
blocks=974319616, imaxpct=5
          =                       sunit=4      swidth=131076 
blks
naming   =version 2              bsize=4096   ascii-ci=0 ftype=1
log      =internal log           bsize=4096   blocks=475744, 
version=2
          =                       sectsz=512   sunit=4 blks, 
lazy-count=1
realtime =none                   extsz=4096   blocks=0, 
rtextents=0

What puzzles me is xfs's:
  sunit=4      swidth=131076 blks
and I think - what the hexx?

In a LVM non-raid stripe scenario I've always remember it 
was: swidth = sunit * Y where Y = number of stripes, right?

I'm hoping some expert could shed some light, help me(maybe 
others too) understand what LVM is doing there? I'd appreciate.
many thanks, L.
