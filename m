Received: from mx1.redhat.com (ext-mx06.extmail.prod.ext.phx2.redhat.com
	[10.5.110.30])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 137B6795A0
	for <linux-lvm@redhat.com>; Mon, 23 Oct 2017 14:27:28 +0000 (UTC)
Received: from strike.wu.ac.at (strike.wu-wien.ac.at [137.208.89.120])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D2404369C9
	for <linux-lvm@redhat.com>; Mon, 23 Oct 2017 14:27:25 +0000 (UTC)
From: "Alexander 'Leo' Bergolth" <leo@strike.wu.ac.at>
Message-ID: <ccfceced-9471-ebff-d2ed-1669b82013ad@strike.wu.ac.at>
Date: Mon, 23 Oct 2017 16:19:35 +0200
MIME-Version: 1.0
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] unable to remove snapshot of raid1 leg
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
To: LVM general discussion and development <linux-lvm@redhat.com>

Hi!

As the raid1 check of my two-drive LV recently reported a mismatch count
> 0, I did some forensics.

One experiment was to create a snapshot of one leg of the mirror and try
to mount the snapshot. This worked fine but unfortunately I cannot
remove the snapshot now!

lvm wants to remove the origin too:
-------------------- 8< --------------------
# lvremove vg_test/snap_leg_0
Do you really want to remove active origin logical volume vg_test/testlv_rimage_0 with 1 snapshot(s)? [y/n]: n
  Logical volume vg_test/testlv_rimage_0 not removed.
-------------------- 8< --------------------
(I have added the full history of a test setup below.)

Could anyone provide a hint how to get rid of the snapshot?
(Maybe manually using dmsetup commands and metadata backup editing?)

Thanks,
--leo

-------------------- snip! --------------------
# lvcreate --type raid1 -m 1 -n testlv -L100m vg_test /dev/vdb /dev/vdc
  Logical volume "testlv" created.
# lvcreate -s -L50m -n snap_leg_0 /dev/mapper/vg_test-testlv_rimage_0
  Using default stripesize 64.00 KiB.
  Rounding up size to full physical extent 52.00 MiB
  Logical volume "snap_leg_0" created.

# lvremove vg_test/snap_leg_0
Do you really want to remove active origin logical volume vg_test/testlv_rimage_0 with 1 snapshot(s)? [y/n]: n
  Logical volume vg_test/testlv_rimage_0 not removed.

# lvs -a -o+devices,lv_uuid
  LV                VG      Attr       LSize   Pool Origin            Data%  Meta%  Move Log Cpy%Sync Convert Devices                               LV UUID                               
  root              vg_sys  -wi-ao----   5.00g                                                                /dev/vda2(0)                          fqp4Np-mLyL-y0OS-nufS-0hsT-7ijc-lGD9Za
  swap              vg_sys  -wi-ao----   2.00g                                                                /dev/vda2(2048)                       uNG1ht-eOKQ-y8Ji-yWSU-ZkZS-ZTIe-1M82mW
  var               vg_sys  -wi-ao----   3.00g                                                                /dev/vda2(1280)                       nDwCsP-vn38-6AUb-Dqer-VkLv-QHs3-CfVNCR
  snap_leg_0        vg_test swi-a-s---  52.00m      [testlv_rimage_0] 0.00                                    /dev/vdb(26)                          f5AXqK-lDNe-hNrO-AW7G-yFvl-ctxU-fivKQf
  testlv            vg_test rwi-a-r--- 100.00m                                               100.00           testlv_rimage_0(0),testlv_rimage_1(0) Av5Y8Z-NBTH-tfN2-hCbW-Sur0-ebGU-SHBlsk
  [testlv_rimage_0] vg_test owi-aor--- 100.00m                                                                /dev/vdb(1)                           OJyEep-Lgfm-B20o-4rfl-d38O-QByz-8oBa5z
  [testlv_rimage_1] vg_test iwi-aor--- 100.00m                                                                /dev/vdc(1)                           J4AP4p-Mhfo-4oPn-SOFP-CGAi-riyL-CFr1fk
  [testlv_rmeta_0]  vg_test ewi-aor---   4.00m                                                                /dev/vdb(0)                           Hgd58x-5Z2C-phkD-cIvl-KbPB-UWPz-THyZ3h
  [testlv_rmeta_1]  vg_test ewi-aor---   4.00m                                                                /dev/vdc(0)                           mvehrT-Ofci-nWpm-A43m-iBpl-YW1U-Z1Z9x4

# lvremove --select lv_uuid=f5AXqK-lDNe-hNrO-AW7G-yFvl-ctxU-fivKQf
Do you really want to remove active origin logical volume vg_test/testlv_rimage_0 with 1 snapshot(s)? [y/n]: n
  Logical volume vg_test/testlv_rimage_0 not removed.
-------------------- snip! --------------------


-- 
e-mail   ::: Leo.Bergolth (at) wu.ac.at   
fax      ::: +43-1-31336-906050
location ::: IT-Services | Vienna University of Economics | Austria
