MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Date: Wed, 23 Oct 2019 19:16:05 +0200
From: Gionatan Danti <g.danti@assyoma.it>
In-Reply-To: <13d450bf-f6ad-7db8-eec1-88c4eb473287@redhat.com>
References: <c1598cf7-442e-13c5-5877-c6e2667bb4bd@gmail.com>
	<909d4cae-ddd2-3951-eee8-8dec8faa6f22@redhat.com>
	<def626d9-52ef-4761-ebe0-3a29bd664bb1@gmail.com>
	<f1f7dfc1-dfd8-a023-5305-2065446a890e@redhat.com>
	<alpine.LRH.2.21.1910221142290.1156@fairfax.gathman.org>
	<f3a53c24-1f91-e5f5-e7e1-091b886da44a@redhat.com>
	<f73ab6ce-ba22-34f8-7153-e876b13fab5c@assyoma.it>
	<0dd80515-d4db-273f-2ee4-78981c11b2c8@redhat.com>
	<0fde933f-1e8d-60de-cada-4a49a67129c4@assyoma.it>
	<13d450bf-f6ad-7db8-eec1-88c4eb473287@redhat.com>
Message-ID: <65a61709788b69c722572dac76cf02a2@assyoma.it>
Subject: Re: [linux-lvm] exposing snapshot block device
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Zdenek Kabelac <zkabelac@redhat.com>
Cc: =?UTF-8?Q?Dalebj=C3=B6rk=2C_Tomas?= <tomas.dalebjork@gmail.com>, LVM general discussion and development <linux-lvm@redhat.com>

Il 23-10-2019 17:37 Zdenek Kabelac ha scritto:
> Hi
> 
> If you use 1MiB chunksize for thin-pool and you use  'dd' with proper 
> bs size
> and you write 'aligned' on 1MiB boundary (be sure you user  directIO,
> so you are not a victim of some page cache flushing...) - there should
> not be any useless read.
> 
> If you still do see such read - and you can easily reproduce this with
> latest kernel - report a bug please with your reproducer and results.
> 
> Regards
> 
> Zdenek

OK, I triple-checked my numbers and you are right: on a fully updated 
CentOS 7.7 x86-64 box with kernel-3.10.0-1062.4.1 and lvm2-2.02.185-2, 
it seems that the behavior I observed on older (>2 years ago) is not 
present anymore.

Take this original lvm setup:
[root@localhost ~]# lvs -o +chunk_size
   LV       VG     Attr       LSize   Pool     Origin Data%  Meta%  Move 
Log Cpy%Sync Convert Chunk
   root     centos -wi-ao----  <6.20g                                     
                         0
   swap     centos -wi-ao---- 512.00m                                     
                         0
   thinpool centos twi-aot---   1.00g                 25.00  14.16        
                     64.00k
   thinvol  centos Vwi-a-t--- 256.00m thinpool        100.00              
                         0

Taking a snapshot (lvcreate -s /dev/centos/thinvol -n thinsnap) and 
overwriting 1 MB of data on origin via "dd if=/dev/urandom 
of=/dev/centos/thinvol bs=1M count=32 oflag=direct" results in the 
following I/O to/from disk:

[root@localhost ~]# dstat -d -D sdc
---dsk/sdc---
  read  writ
1036k   32M

As you can see, while 1 MB was indeed read (due to metadata read?), no 
other read amplification occoured.

Now I got curious to see if zeroing behave in the same manner. So, I 
deleted thinsnap & thinvol, toggled zeroing on (lvchange -Zy 
centos/thinpool), and recreated thinvol:

[root@localhost ~]# lvs -o +chunk_size
   LV       VG     Attr       LSize   Pool     Origin Data%  Meta%  Move 
Log Cpy%Sync Convert Chunk
   root     centos -wi-ao----  <6.20g                                     
                         0
   swap     centos -wi-ao---- 512.00m                                     
                         0
   thinpool centos twi-aotz--   1.00g                 0.00   11.04        
                     64.00k
   thinvol  centos Vwi-a-tz-- 256.00m thinpool        0.00                
                         0

[root@localhost ~]# dstat -d -D sdc
--dsk/sdc--
  read  writ
    0    13M
  520k   19M

Again, no write amplificaton occoured.

Kudos to all the team for optimizing lvmthin in this manner, it really 
is a flexible and great performing tool.
Regards.

-- 
Danti Gionatan
Supporto Tecnico
Assyoma S.r.l. - www.assyoma.it
email: g.danti@assyoma.it - info@assyoma.it
GPG public key ID: FF5F32A8
