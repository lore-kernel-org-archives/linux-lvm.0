Received: from static-80-177-71-131.vodafonexdsl.co.uk (static-80-177-71-131.vodafonexdsl.co.uk [80.177.71.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD85F13C82E
	for <linux-lvm@lists.linux.dev>; Sun, 30 Mar 2025 16:28:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.177.71.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743352098; cv=none; b=Delz2c23WbNvxaXxUTrYWK25JCSzQ00pct/2V8l5j4+9BER3lzYfeZakGvB/NnwsyiLZ8FFUl4F9yqlArS1DJFqmFbQgSats9E2UI2R528m2p7+8Z+uhk3S3cETgzTWTKtVCRIT8acw3nC2kAG+uV4mTaW5FLjsoXblYusNSUdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743352098; c=relaxed/simple;
	bh=fq/hU/Bo47H6Fuxy3yBF3HMtzkiWjoZI5tmDfIMGypY=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=uTfL7ezHDEK7lPcaZBvYI6YpW9439jtE/svocuLIyYkSwIfCT8tNmjXqnfZNuDf6YtH2vbEwQhSj78rw2i6yEPhqRs1wezHz2XEdgCiJzNNAXL7+x++kwRRjCA/xEE7OOjTFn8Um8cpnXVln3cprJrkKL69sJCP1nLIc0EiQDsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=timedicer.co.uk; spf=pass smtp.mailfrom=let2.com; dkim=pass (1024-bit key) header.d=timedicer.co.uk header.i=@timedicer.co.uk header.b=o18/3XsZ; arc=none smtp.client-ip=80.177.71.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=timedicer.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=let2.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=timedicer.co.uk header.i=@timedicer.co.uk header.b="o18/3XsZ"
Received: from localhost (localhost [127.0.0.1])
	by static-80-177-71-131.vodafonexdsl.co.uk (Postfix) with ESMTP id CE86520531
	for <linux-lvm@lists.linux.dev>; Sun, 30 Mar 2025 17:28:11 +0100 (BST)
X-Virus-Scanned: amavis at let2.com
Received: from static-80-177-71-131.vodafonexdsl.co.uk ([127.0.0.1])
 by localhost (let2.com [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5QNu-yJPNx6r for <linux-lvm@lists.linux.dev>;
 Sun, 30 Mar 2025 17:28:11 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=timedicer.co.uk;
	s=mail; t=1743352091;
	bh=2UC3AV5yyvl+5Mj+MYv2c0J4ISw7B5PcfbyIUJEjIuM=;
	h=Date:To:From:Subject:From;
	b=o18/3XsZGSRqJi9WQCibLhSSqUv1iu+nF8b5tulsbiP8hMCpF4zlcAhEdJdbGw3+X
	 Erte6po0lF3NPAHuENS4ZQTBDfxrLBqlRHdHUY12Mo2RDnG1KUXYiZXGw0Zepq4Eyz
	 u8hTTB/NKUs2maZbFIyJ4dk2FH6PWWp2rY2tkYZI=
Received: from [192.168.101.16] (unknown [149.102.188.0])
	by static-80-177-71-131.vodafonexdsl.co.uk (Postfix) with ESMTPSA id 9FC2B20245
	for <linux-lvm@lists.linux.dev>; Sun, 30 Mar 2025 17:28:11 +0100 (BST)
Message-ID: <896f5f69-58a7-4b9f-a9b8-62a65f3f13a2@timedicer.co.uk>
Date: Sun, 30 Mar 2025 17:28:09 +0100
Precedence: bulk
X-Mailing-List: linux-lvm@lists.linux.dev
List-Id: <linux-lvm.lists.linux.dev>
List-Subscribe: <mailto:linux-lvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-lvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-lvm@lists.linux.dev
Content-Language: en-GB
From: Dominic Raferd <dominic@timedicer.co.uk>
Subject: Duplicate pv, vg, lv after copying disk
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

My LVM is working great but lvm utilities show - only, when using -o 
devices, that I have multiple copies of the same pv, vg and lvs. See 
below, the first invocation is what I would expect (one PV 'nvme0n1p2', 
one VG 'vg1', four LVs 'home' 'log' 'rootfs' and 'swap') but in each 
case the second invocation (i.e. with -o +devices) shows multiple 
versions of the same thing.

This may be because I copied my disk to another using clonezilla and 
subsequently copied the new disk back to the original using dd. I'm now 
only using the original disk. Although I am also seeing (not shown 
below) duplicate devices for a 2nd PV and VG and LVs which are on a 
second disk on the same machine - and this second disk was unchanged 
throughout the process.

# pvs|grep -F nvme
   /dev/nvme0n1p2 vg1 lvm2 a--  <928.09g <268.09g
# pvs -o +devices|grep -F nvme
   /dev/nvme0n1p2 vg1 lvm2 a--  <928.09g <268.09g
   /dev/nvme0n1p2 vg1 lvm2 a--  <928.09g <268.09g /dev/nvme0n1p2(1024)
   /dev/nvme0n1p2 vg1 lvm2 a--  <928.09g <268.09g /dev/nvme0n1p2(2048)
   /dev/nvme0n1p2 vg1 lvm2 a--  <928.09g <268.09g /dev/nvme0n1p2(78848)
   /dev/nvme0n1p2 vg1 lvm2 a--  <928.09g <268.09g /dev/nvme0n1p2(82944)
   /dev/nvme0n1p2 vg1 lvm2 a--  <928.09g <268.09g /dev/nvme0n1p2(91136)
   /dev/nvme0n1p2 vg1 lvm2 a--  <928.09g <268.09g
   /dev/nvme0n1p2 vg1 lvm2 a--  <928.09g <268.09g /dev/nvme0n1p2(173056)
   /dev/nvme0n1p2 vg1 lvm2 a--  <928.09g <268.09g

# vgs|grep -F vg1
   vg1   1   4   0 wz--n- <928.09g <268.09g
# vgs -o +devices|grep -F vg1
   vg1   1   4   0 wz--n- <928.09g <268.09g /dev/nvme0n1p2(1024)
   vg1   1   4   0 wz--n- <928.09g <268.09g /dev/nvme0n1p2(2048)
   vg1   1   4   0 wz--n- <928.09g <268.09g /dev/nvme0n1p2(91136)
   vg1   1   4   0 wz--n- <928.09g <268.09g /dev/nvme0n1p2(78848)
   vg1   1   4   0 wz--n- <928.09g <268.09g /dev/nvme0n1p2(173056)
   vg1   1   4   0 wz--n- <928.09g <268.09g /dev/nvme0n1p2(82944)

# lvs|grep -F vg1
   home   vg1 -wi-ao---- 600.00g
   log    vg1 -wi-ao----   4.00g
   rootfs vg1 -wi-ao----  24.00g
   swap   vg1 -wc-ao----  32.00g
# lvs -o +devices|grep -F vg1
   home   vg1 -wi-ao---- 600.00g /dev/nvme0n1p2(2048)
   home   vg1 -wi-ao---- 600.00g /dev/nvme0n1p2(91136)
   log    vg1 -wi-ao---- 4.00g /dev/nvme0n1p2(1024)
   rootfs vg1 -wi-ao---- 24.00g /dev/nvme0n1p2(78848)
   rootfs vg1 -wi-ao---- 24.00g /dev/nvme0n1p2(173056)
   swap   vg1 -wc-ao---- 32.00g /dev/nvme0n1p2(82944)

As I say, this has not caused a problem so far, but it is certainly ugly 
and looks like it might cause problems in the future. Should I ignore it 
or any ideas how I can fix it?

