Received: from mx1.redhat.com (ext-mx03.extmail.prod.ext.phx2.redhat.com
	[10.5.110.27])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 46634B8B8A
	for <linux-lvm@redhat.com>; Thu, 19 Oct 2017 11:45:56 +0000 (UTC)
Received: from strike.wu.ac.at (strike.wu-wien.ac.at [137.208.89.120])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 699397E44B
	for <linux-lvm@redhat.com>; Thu, 19 Oct 2017 11:45:53 +0000 (UTC)
From: "Alexander 'Leo' Bergolth" <leo@strike.wu.ac.at>
References: <59E60975.2000001@strike.wu.ac.at>
Message-ID: <378f8596-dfae-2557-a53f-b614940bba22@strike.wu.ac.at>
Date: Thu, 19 Oct 2017 13:45:51 +0200
MIME-Version: 1.0
In-Reply-To: <59E60975.2000001@strike.wu.ac.at>
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] unable to recover from degraded raid1 with thin pool
 (was: activation mode=degraded doesn't work with thin pool)
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

On 10/17/2017 03:45 PM, Alexander 'Leo' Bergolth wrote:
> I just tested lv activation with a degraded raid1 thin pool.
> Unfortunately it looks like activation mode=degraded only works for
> plain raid1 lvs. If you add a thin pool, lvm won't activate it in
> degraded mode. (Unless you specify --activationmode partial, which is
> IMHO rather dangerous.)

Unfortunately I cannot even replace a faulty PV if a thin pool is present.

lvm thinks that the thin pool is a partial (not just degraded) LV, so
removing the missing PV would also remove the thin pool! (see below)

Is there any way to work around this problem?

Cheers,
--leo

P.S.: I filed a bugreport for this:
https://bugzilla.redhat.com/show_bug.cgi?id=1504044

-------------------- 8< --------------------
# pvcreate /dev/vdb
  Physical volume "/dev/vdb" successfully created.
# pvcreate /dev/vdc
  Physical volume "/dev/vdc" successfully created.
# vgcreate vg_test /dev/vdb /dev/vdc
  Volume group "vg_test" successfully created
# lvcreate --type raid1 -m 1 -n thinmeta -L100m vg_test /dev/vdb /dev/vdc
  Logical volume "thinmeta" created.
# lvcreate --type raid1 -m 1 -n Thin -L2g vg_test /dev/vdb /dev/vdc
  Logical volume "Thin" created.
# lvconvert -y --type thin-pool --poolmetadata vg_test/thinmeta vg_test/Thin
  Thin pool volume with chunk size 64.00 KiB can address@most 15.81
TiB of data.
  WARNING: Converting logical volume vg_test/Thin and vg_test/thinmeta
to thin pool's data and metadata volumes with metadata wiping.
  THIS WILL DESTROY CONTENT OF LOGICAL VOLUME (filesystem etc.)
  Converted vg_test/Thin_tdata to thin pool.

# vgchange -a n vg_test
  0 logical volume(s) in volume group "vg_test" now active

### add global_filter = [ "r|^/dev/vdc$|" ] to lvm.conf
# systemctl restart lvm2-lvmetad.service
# pvscan --cache

# pvs
  WARNING: Device for PV na0HS1-ZcQt-bnt0-tFfB-Zl20-irIg-FffGxH not
found or rejected by a filter.
  PV         VG      Fmt  Attr PSize   PFree
  /dev/vda2  vg_sys  lvm2 a--  <12.00g <2.00g
  /dev/vdb   vg_test lvm2 a--  <12.00g  9.79g
  [unknown]  vg_test lvm2 a-m  <12.00g  9.89g

# vgchange -a y vg_test
  WARNING: Device for PV na0HS1-ZcQt-bnt0-tFfB-Zl20-irIg-FffGxH not
found or rejected by a filter.
  Refusing activation of partial LV vg_test/Thin.  Use '--activationmode
partial' to override.
  0 logical volume(s) in volume group "vg_test" now active

# vgchange -a y --activationmode=partial vg_test
  PARTIAL MODE. Incomplete logical volumes will be processed.
  WARNING: Device for PV na0HS1-ZcQt-bnt0-tFfB-Zl20-irIg-FffGxH not
found or rejected by a filter.
  1 logical volume(s) in volume group "vg_test" now active

### removing the missing PV would also remove my thin pool!
# vgreduce --removemissing  vg_test
  WARNING: Device for PV na0HS1-ZcQt-bnt0-tFfB-Zl20-irIg-FffGxH not
found or rejected by a filter.
  WARNING: Partial LV Thin needs to be repaired or removed.
  WARNING: Partial LV Thin_tmeta needs to be repaired or removed.
  WARNING: Partial LV Thin_tdata needs to be repaired or removed.
  WARNING: Partial LV Thin_tmeta_rimage_1 needs to be repaired or removed.
  WARNING: Partial LV Thin_tmeta_rmeta_1 needs to be repaired or removed.
  WARNING: Partial LV Thin_tdata_rimage_1 needs to be repaired or removed.
  WARNING: Partial LV Thin_tdata_rmeta_1 needs to be repaired or removed.
  There are still partial LVs in VG vg_test.
  To remove them unconditionally use: vgreduce --removemissing --force.
  WARNING: Proceeding to remove empty missing PVs.

-------------------- 8< --------------------




> 
> Is this the intended behavior?
> 
> -------------------- 8< --------------------
> # lvcreate --type raid1 -m 1 -n thinmeta -L100m vg1 /dev/sda2 /dev/sdb2
>   Logical volume "thinmeta" created.
> # lvcreate --type raid1 -m 1 -n Thin -L2g vg1 /dev/sda2 /dev/sdb2
>   Logical volume "Thin" created.
> # lvconvert -y --type thin-pool --poolmetadata vg1/thinmeta vg1/Thin
>   Thin pool volume with chunk size 64.00 KiB can address at most 15.81 TiB of data.
>   WARNING: Converting logical volume vg1/Thin and vg1/thinmeta to thin pool's data and metadata volumes with metadata wiping.
>   THIS WILL DESTROY CONTENT OF LOGICAL VOLUME (filesystem etc.)
>   Converted vg1/Thin_tdata to thin pool.
> 
> # vgchange -a n vg1
>   0 logical volume(s) in volume group "vg1" now active
> 
> ### filter one leg of the raid: global_filter = [ "r|^/dev/sdb2|" ]
> # systemctl restart lvm2-lvmetad.service
> # pvscan --cache
> 
> # vgchange -a y
>   WARNING: Device for PV WzDZS1-Hj9B-RZCa-uhOc-pY9L-1rLN-GB5Zs1 not found or rejected by a filter.
>   Refusing activation of partial LV vg1/Thin.  Use '--activationmode partial' to override.
>   0 logical volume(s) in volume group "vg1" now active
> -------------------- 8< --------------------
> 
> (--activationmode partial works)
> 
> I am using lvm2-2.02.171-8.el7.x86_64.
> 
> Cheers,
> --leo
> 


-- 
e-mail   ::: Leo.Bergolth (at) wu.ac.at
fax      ::: +43-1-31336-906050
location ::: IT-Services | Vienna University of Economics | Austria
