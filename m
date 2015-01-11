Received: from mx1.redhat.com (ext-mx15.extmail.prod.ext.phx2.redhat.com
	[10.5.110.20])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t0B9oYG1009930
	for <linux-lvm@redhat.com>; Sun, 11 Jan 2015 04:50:34 -0500
Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de
	[81.169.146.218])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id t0B9oViC026522
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL)
	for <linux-lvm@redhat.com>; Sun, 11 Jan 2015 04:50:32 -0500
Received: from [10.0.0.237] (55d40bdb.access.ecotel.net [85.212.11.219])
	by smtp.strato.de (RZmta 36.3 DYNA|AUTH)
	with ESMTPSA id c001c5r0B9oUBpH
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client did not present a certificate) for <linux-lvm@redhat.com>;
	Sun, 11 Jan 2015 10:50:30 +0100 (CET)
Message-ID: <54B24766.4030706@ferienwohnung-altenbeken.de>
Date: Sun, 11 Jan 2015 10:50:30 +0100
From: Max Power <maillists@ferienwohnung-altenbeken.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] writeback cache not promoting writes
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
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@redhat.com

Hi,

I am trying to figure out how I can improve write performance of a very
slow and complicated RAID-arragement (slowdrive=/dev/md123) with a fast
SSD/RAM-drive as a cache (fastdrive=/dev/sda4).

Write access to my server normally appears occasionally in my case (few
GB at a time and long idle times). So I want that every write access to
the resulting block device is committed to the cache first but I do not
achieve this. I read all the old mails about the tunables and the kernel
docs cache.txt and cache-policy.txt but I am doing something wrong at
the moment. I created a test environment for that like this:

># fastdrive="/dev/sda4"
># slowdrive="/dev/md123"
># lvcreate --name cache  --size 10G  BigData $fastdrive
># lvcreate --name cacheM --size 128M BigData $fastdrive
># lvcreate --name data   --size 100G BigData $slowdrive
># lvconvert --cachemode writeback --chunksize 1024K \
>#    --cachepool BigData/cache --poolmetadata BigData/cacheM
># lvconvert --type cache \
>#    --cachepool BigData/cache BigData/data
># dmsetup message BigData-data 0 migration_threshold 0 # see below
># dmsetup message BigData-data 0 random_threshold 0
># dmsetup message BigData-data 0 sequential_threshold 0
># dmsetup message BigData-data 0 write_promote_adjustment 0
># dd if=/dev/zero of=/dev/mapper/BigData-data \
>#    bs=1G count=1 oflag=direct

I monitored the last 'dd' with iostat and only see access to the slow
device. This output confirms it:

># dmsetup status
># BigData-data: 0 209715200 cache 8 29/32768 2048 0/10240 0 230 \
>#    0 2048 0 0 0 1 writeback 2 migration_threshold 0 mq 10 \
>#    random_threshold 0 sequential_threshold 0 \
>#    discard_promote_adjustment 1 read_promote_adjustment 4 \
>#    write_promote_adjustment 0

Essentially saying that my cache is empty. No dirty blocks. With
migration_threshold set to a high number (99999999) I see write access
to the cache. But dd blocks until everything is written to the slow
device. It looks like a writethru.

Is it possible to influence the write/cache behavior?

Greetings from Germany!
