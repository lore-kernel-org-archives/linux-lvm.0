Received: from mx1.redhat.com (ext-mx03.extmail.prod.ext.phx2.redhat.com
	[10.5.110.27])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1D063601A1
	for <linux-lvm@redhat.com>; Tue, 27 Mar 2018 07:44:32 +0000 (UTC)
Received: from mr012msb.fastweb.it (mr012msb.fastweb.it [85.18.95.109])
	by mx1.redhat.com (Postfix) with ESMTP id CD9F7804FA
	for <linux-lvm@redhat.com>; Tue, 27 Mar 2018 07:44:28 +0000 (UTC)
Received: from ceres.assyoma.it (93.63.55.57) by mr012msb.fastweb.it (5.8.043)
	id 5AA9846F018B4661 for linux-lvm@redhat.com;
	Tue, 27 Mar 2018 09:44:27 +0200
Received: from gdanti-lenovo.assyoma.it (unknown [172.31.255.5])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by ceres.assyoma.it (Postfix) with ESMTPSA id 68BFB24EE2D
	for <linux-lvm@redhat.com>; Tue, 27 Mar 2018 09:44:27 +0200 (CEST)
From: Gionatan Danti <g.danti@assyoma.it>
Message-ID: <597ba4e4-2028-ed62-6835-86ae9015ea5b@assyoma.it>
Date: Tue, 27 Mar 2018 09:44:22 +0200
MIME-Version: 1.0
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Higher than expected metadata usage?
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
To: linux-lvm@redhat.com

Hi all,
I can't wrap my head on the following reported data vs metadata usage 
before/after a snapshot deletion.

System is an updated CentOS 7.4 x64

BEFORE SNAP DEL:
[root@ ~]# lvs
   LV           VG         Attr       LSize  Pool         Origin  Data% 
Meta%  Move Log Cpy%Sync Convert
   000-ThinPool vg_storage twi-aot---  7.21t                      80.26 
56.88
   Storage      vg_storage Vwi-aot---  7.10t 000-ThinPool         76.13 

   ZZZSnap      vg_storage Vwi---t--k  7.10t 000-ThinPool Storage

As you can see, a ~80% full data pool resulted in a ~57% metadata usage

AFTER SNAP DEL:
[root@ ~]# lvremove vg_storage/ZZZSnap
   Logical volume "ZZZSnap" successfully removed
[root@ ~]# lvs
   LV           VG         Attr       LSize  Pool         Origin Data% 
Meta%  Move Log Cpy%Sync Convert
   000-ThinPool vg_storage twi-aot---  7.21t                     74.95 
36.94
   Storage      vg_storage Vwi-aot---  7.10t 000-ThinPool        76.13

Now data is at ~75 (5% lower), but metadata is at only ~37%: a whopping 
20% metadata difference for a mere 5% data freed.

This was unexpected: I thought there was a more or less linear relation 
between data and metadata usage as, after all, the first is about 
allocated chunks tracked by the latter. I know that snapshots pose 
additional overhead on metadata tracking, but based on previous tests I 
expected this overhead to be much smaller. In this case, we are speaking 
about a 4X amplification for a single snapshot. This is concerning 
because I want to *never* run out of metadata space.

If it can help, just after taking the snapshot I sparsified some file on 
the mounted filesystem, *without* fstrimming it (so, from lvmthin 
standpoint, nothing changed on chunk allocation).

What am I missing? Is the "data%" field a measure of how many data 
chunks are allocated, or does it even track "how full" are these data 
chunks? This would benignly explain the observed discrepancy, as a 
partially-full data chunks can be used to store other data without any 
new metadata allocation.

Full LVM information:

[root@ ~]# lvs -a -o +chunk_size
   LV                   VG         Attr       LSize   Pool 
Origin Data%  Meta%  Move Log Cpy%Sync Convert Chunk
   000-ThinPool         vg_storage twi-aot---   7.21t 
  74.95  36.94                            4.00m
   [000-ThinPool_tdata] vg_storage Twi-ao----   7.21t 
                                             0
   [000-ThinPool_tmeta] vg_storage ewi-ao---- 116.00m 
                                             0
   Storage              vg_storage Vwi-aot---   7.10t 000-ThinPool 
  76.13                                      0
   [lvol0_pmspare]      vg_storage ewi------- 116.00m 
                                             0

Thanks.

-- 
Danti Gionatan
Supporto Tecnico
Assyoma S.r.l. - www.assyoma.it
email: g.danti@assyoma.it - info@assyoma.it
GPG public key ID: FF5F32A8
