Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 924961F1507
	for <linux-lvm@lists.linux.dev>; Tue, 22 Apr 2025 13:45:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.229.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745329520; cv=none; b=k/kZXn2c2NNBcPX/rodSQ08gPtbxXfHGkmDK4UUnMVcUnTjdj0XSpl5OeYj3orocEm0axQH34ctYPExcx8ueKL/nJYyBrQxHedEL1gERNVhKpQlAa3xLDdph/NdtJ+s4GPKd7kX3hWKoiSyJbPPf4Ne48vLu06HCSNj9W01kJms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745329520; c=relaxed/simple;
	bh=oW/bJlNr9jLREz7/L+UqZxV6PhSK14Uu0CGh245ZZhM=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sfZH2gE5gz18NoTb4HJISakurOXNivVS0xb41wYixZvNLUXPvvBfpNtH2SBBVzpSseRrAdZgD35KXudnSsiCv1NV3HxesY/44YDfeXJhh6YjSC0caStARJZCGDSS9aT+lLHKoVFv/0+KjdB8e8HBYFHzor+lZ8s5sYXSB7gtazE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org; spf=pass smtp.mailfrom=treblig.org; dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b=RcS+0qgG; arc=none smtp.client-ip=46.235.229.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=treblig.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b="RcS+0qgG"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=Content-Type:MIME-Version:Message-ID:Subject:From:Date:From
	:Subject; bh=lNxnq5h5FVgaUE89/R7E5l53OjvcYMnES/7XoDArhF0=; b=RcS+0qgG3e6Tug7S
	wo0Yra4IckooWsiQc4Mu/80lAAilp4qyxV9NIcTcBYP0IQevH5n2jGUZfv58X4vyhioTLshSqzC5G
	JYImfcb1elrVYLAqd6FvONkw8pzfNAEyVi8Gn1nx9eneAmi/X+ZDU43g33Ke0tdQH/yFmyNQXjiGa
	pMGiOfoC1W7OnFB0DyDtTwacVGMYLAYurfDhzjRMwj06EUZBMenFONpVb8P7oL4LnM+0R9Un5ZZtu
	SuKFM62u30hMlH5UsE2ovcKvWOOcFo4cWroVn6mrGmezuD2w7smR8HJ4cxj8PeLZYHpLP8ibX7Ka2
	8ee9hUKbqd+CezlOfw==;
Received: from dg by mx.treblig.org with local (Exim 4.96)
	(envelope-from <dg@treblig.org>)
	id 1u7Dvw-00D5MD-2o
	for linux-lvm@lists.linux.dev;
	Tue, 22 Apr 2025 13:45:08 +0000
Date: Tue, 22 Apr 2025 13:45:08 +0000
From: "Dr. David Alan Gilbert" <dave@treblig.org>
To: linux-lvm@lists.linux.dev
Subject: lvmraid/repair scrubbing question
Message-ID: <aAedZGg0ZNM01Qyj@gallifrey>
Precedence: bulk
X-Mailing-List: linux-lvm@lists.linux.dev
List-Id: <linux-lvm.lists.linux.dev>
List-Subscribe: <mailto:linux-lvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-lvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-Chocolate: 70 percent or better cocoa solids preferably
X-Operating-System: Linux/6.1.0-21-amd64 (x86_64)
X-Uptime: 13:04:30 up 349 days, 18 min,  1 user,  load average: 0.00, 0.00,
 0.00
User-Agent: Mutt/2.2.12 (2023-09-09)

Hi,
  I'm unsure of the details of a warning in the lvmraid(7) 'repair' scrub
and the behaviour I'm seeing before I run it.

I've got my / on a RAID1 LVM on top of a pair of nvme devices,
nvme0n1p3 and mvme1n1p1 are the PVs;
I noticed an NVMe read error in my logs:
Apr 21 14:58:52 dalek kernel: nvme1n1: I/O Cmd(0x2) @ LBA 416591488, 1024 blocks, I/O Error (sct 0x2 / sc 0x81) MORE 
Apr 21 14:58:52 dalek kernel: critical medium error, dev nvme1n1, sector 416591488 op 0x0:(READ) flags 0x80700 phys_seg 71 prio class 0

but there have been no complaints from LVM;
root@dalek:/home/dg# lvs -a
  LV                    VG         Attr       LSize   Pool Origin Data%  Meta%  Move Log Cpy%Sync Convert
...
  root                  nvmeroot21 rwi-aor--- 150.00g                                    100.00          
  [root_rimage_0]       nvmeroot21 iwi-aor--- 150.00g                                                    
  [root_rimage_1]       nvmeroot21 iwi-aor--- 150.00g                                                    
  [root_rmeta_0]        nvmeroot21 ewi-aor---   4.00m                                                    
  [root_rmeta_1]        nvmeroot21 ewi-aor---   4.00m                                                    

 (1) If the NVMe is giving an I/O error - why am I not seeing something angry from LVM?

Having seen this I tried a
  lvchange --synaction check
on the LV.  That completed but showed a whole bunch of mismatches
on the LV (although the Cpy%Sync was still 100.00%)
and showed a bunch more read errors in the logs - mostly from
the nvme1 but a couple from the nvme0 - ohh.

  Given that these are all read errors and the smart
data says it's got plenty of available spare I'm wondering
if the read errors are just blocks that haven't been read
for a few years.

  I want to try a 'repair' but there's a warning in the man page;
'When two different blocks of data must be made consistent, it chooses the  block
       from the device that would be used during RAID initialization.'

  (2) How do I know which is the default device?
  (3) Given that the log shows I/O errors on the NVMe, if the error propagates
up to LVM during the repair, will the repair read the block from the other device?

(The host is Fedora 42 with 6.14.2-300.fc42.x86_64 kernel)

Thanks in advance,

Dave
(See lsblk below)

nvme0n1                      259:0    0 465.8G  0 disk 
├─nvme0n1p1                  259:2    0   600M  0 part /boot/efi
├─nvme0n1p2                  259:3    0     1G  0 part /boot
└─nvme0n1p3                  259:4    0 464.2G  0 part 
  ├─nvmeroot21-root_rmeta_1  252:2    0     4M  0 lvm  
  │ └─nvmeroot21-root        252:4    0   150G  0 lvm  /
  ├─nvmeroot21-root_rimage_1 252:3    0   150G  0 lvm  
  │ └─nvmeroot21-root        252:4    0   150G  0 lvm  /
  ├─nvmeroot21-swap_rmeta_1  252:7    0     4M  0 lvm  
  │ └─nvmeroot21-swap        252:9    0    32G  0 lvm  [SWAP]
  ├─nvmeroot21-swap_rimage_1 252:8    0    32G  0 lvm  
  │ └─nvmeroot21-swap        252:9    0    32G  0 lvm  [SWAP]
  └─nvmeroot21-fast          252:13   0   250G  0 lvm  /discs/fast
nvme1n1                      259:1    0 465.8G  0 disk 
└─nvme1n1p1                  259:5    0 465.8G  0 part 
  ├─nvmeroot21-root_rmeta_0  252:0    0     4M  0 lvm  
  │ └─nvmeroot21-root        252:4    0   150G  0 lvm  /
  ├─nvmeroot21-root_rimage_0 252:1    0   150G  0 lvm  
  │ └─nvmeroot21-root        252:4    0   150G  0 lvm  /
  ├─nvmeroot21-swap_rmeta_0  252:5    0     4M  0 lvm  
  │ └─nvmeroot21-swap        252:9    0    32G  0 lvm  [SWAP]
  ├─nvmeroot21-swap_rimage_0 252:6    0    32G  0 lvm  
  │ └─nvmeroot21-swap        252:9    0    32G  0 lvm  [SWAP]
  └─nvmeroot21-fast          252:13   0   250G  0 lvm  /discs/fast

-- 
 -----Open up your eyes, open up your mind, open up your code -------   
/ Dr. David Alan Gilbert    |       Running GNU/Linux       | Happy  \ 
\        dave @ treblig.org |                               | In Hex /
 \ _________________________|_____ http://www.treblig.org   |_______/
