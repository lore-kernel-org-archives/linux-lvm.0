Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.18])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r3N4AFgt003903
	for <linux-lvm@redhat.com>; Tue, 23 Apr 2013 00:10:16 -0400
Received: from smtp1.pacifier.net (smtp1.pacifier.net [64.255.237.171])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r3N4ADwm004157
	for <linux-lvm@redhat.com>; Tue, 23 Apr 2013 00:10:14 -0400
Received: from bedroom.localnet (ip136.133.dsl-acs2.pdx.iinet.com
	[209.20.133.136])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: benscott@nwlink.com)
	by smtp1.pacifier.net (Postfix) with ESMTPSA id 62E572CA25
	for <linux-lvm@redhat.com>; Mon, 22 Apr 2013 21:10:12 -0700 (PDT)
From: ben <benscott@nwlink.com>
Date: Mon, 22 Apr 2013 21:09:59 -0700
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Message-Id: <201304222109.59424.benscott@nwlink.com>
Subject: [linux-lvm] specifying contiguous yields odd results
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
Content-Type: Text/Plain; charset="us-ascii"
To: linux-lvm@redhat.com

I have discovered something strange when extending a striped logical volume. 

For example, start with a volume that has three physical volumes and three 
stripes then run lvextend on it. If the policy is set to 'contiguous' then all 
the physical volumes of the last segment must be on the command line. What is 
odd is that the striping can be set to a lower number so not all those 
physical volumes are really used. 


~#lvs  --segments -o +devices
  LV    VG   Attr      #Str Type    SSize Devices
  lvol0 vg8  -wi-a----    3 striped 2.00g /dev/sdc(0),/dev/sdd(0),/dev/sde(0)

~# lvextend -i 2 --alloc contiguous -l +2049 vg8/lvol0 /dev/sdc /dev/sdd
  Using stripesize of last segment 64.00 KiB
  Rounding size (6147 extents) up to stripe boundary size for segment (6148 
extents)
  Extending logical volume lvol0 to 3.00 GiB
  Insufficient suitable contiguous allocatable extents for logical volume lvol0: 
2050 more required

~# lvextend -i 2 --alloc contiguous -l +2049 vg8/lvol0 /dev/sdc /dev/sdd 
/dev/sde
  Using stripesize of last segment 64.00 KiB
  Rounding size (6147 extents) up to stripe boundary size for segment (6148 
extents)
  Extending logical volume lvol0 to 3.00 GiB
  Logical volume lvol0 successfully resized

~# lvs  --segments -o +devices
  LV    VG   Attr      #Str Type    SSize Devices
  lvol0 vg8  -wi-a----    3 striped 2.00g /dev/sdc(0),/dev/sdd(0),/dev/sde(0)
  lvol0 vg8  -wi-a----    2 striped 1.00g /dev/sdc(1366),/dev/sdd(1366)

Is it intended that with contiguous allocation the striping should match or 
not? Thank you.
