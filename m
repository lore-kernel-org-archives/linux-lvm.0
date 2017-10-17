Received: from mx1.redhat.com (ext-mx01.extmail.prod.ext.phx2.redhat.com
	[10.5.110.25])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 398B362526
	for <linux-lvm@redhat.com>; Tue, 17 Oct 2017 13:52:08 +0000 (UTC)
Received: from strike.wu.ac.at (strike.wu-wien.ac.at [137.208.89.120])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6E3D42974F
	for <linux-lvm@redhat.com>; Tue, 17 Oct 2017 13:52:05 +0000 (UTC)
Message-ID: <59E60975.2000001@strike.wu.ac.at>
Date: Tue, 17 Oct 2017 15:45:25 +0200
From: "Alexander 'Leo' Bergolth" <leo@strike.wu.ac.at>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] activation mode=degraded doesn't work with thin pool
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

Hi!

I just tested lv activation with a degraded raid1 thin pool.
Unfortunately it looks like activation mode=degraded only works for
plain raid1 lvs. If you add a thin pool, lvm won't activate it in
degraded mode. (Unless you specify --activationmode partial, which is
IMHO rather dangerous.)

Is this the intended behavior?

-------------------- 8< --------------------
# lvcreate --type raid1 -m 1 -n thinmeta -L100m vg1 /dev/sda2 /dev/sdb2
  Logical volume "thinmeta" created.
# lvcreate --type raid1 -m 1 -n Thin -L2g vg1 /dev/sda2 /dev/sdb2
  Logical volume "Thin" created.
# lvconvert -y --type thin-pool --poolmetadata vg1/thinmeta vg1/Thin
  Thin pool volume with chunk size 64.00 KiB can address@most 15.81 TiB of data.
  WARNING: Converting logical volume vg1/Thin and vg1/thinmeta to thin pool's data and metadata volumes with metadata wiping.
  THIS WILL DESTROY CONTENT OF LOGICAL VOLUME (filesystem etc.)
  Converted vg1/Thin_tdata to thin pool.

# vgchange -a n vg1
  0 logical volume(s) in volume group "vg1" now active

### filter one leg of the raid: global_filter = [ "r|^/dev/sdb2|" ]
# systemctl restart lvm2-lvmetad.service
# pvscan --cache

# vgchange -a y
  WARNING: Device for PV WzDZS1-Hj9B-RZCa-uhOc-pY9L-1rLN-GB5Zs1 not found or rejected by a filter.
  Refusing activation of partial LV vg1/Thin.  Use '--activationmode partial' to override.
  0 logical volume(s) in volume group "vg1" now active
-------------------- 8< --------------------

(--activationmode partial works)

I am using lvm2-2.02.171-8.el7.x86_64.

Cheers,
--leo
-- 
e-mail   ::: Leo.Bergolth (at) wu.ac.at   
fax      ::: +43-1-31336-906050
location ::: IT-Services | Vienna University of Economics | Austria
