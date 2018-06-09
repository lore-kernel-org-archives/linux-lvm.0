Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.41])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0D5F084F6
	for <linux-lvm@redhat.com>; Sat,  9 Jun 2018 16:41:42 +0000 (UTC)
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1D3D5308A958
	for <linux-lvm@redhat.com>; Sat,  9 Jun 2018 16:41:40 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 4134mf2VkDz1qv3Z
	for <linux-lvm@redhat.com>; Sat,  9 Jun 2018 18:41:38 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
	by mail.m-online.net (Postfix) with ESMTP id 4134mf2NQSz1qqkR
	for <linux-lvm@redhat.com>; Sat,  9 Jun 2018 18:41:38 +0200 (CEST)
Received: from mail.mnet-online.de ([192.168.8.182])
	by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
	port 10024) with ESMTP id ObjfebfnnI73 for <linux-lvm@redhat.com>;
	Sat,  9 Jun 2018 18:41:37 +0200 (CEST)
Received: from janitor.denx.de (unknown [62.91.23.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPSA
	for <linux-lvm@redhat.com>; Sat,  9 Jun 2018 18:41:37 +0200 (CEST)
Received: from gemini.denx.de (gemini.denx.de [10.4.0.2])
	by janitor.denx.de (Postfix) with ESMTPS id 498787C
	for <linux-lvm@redhat.com>; Sat,  9 Jun 2018 18:41:34 +0200 (CEST)
Received: from gemini.denx.de (localhost [IPv6:::1])
	by gemini.denx.de (Postfix) with ESMTP id 7EFA8240049
	for <linux-lvm@redhat.com>; Sat,  9 Jun 2018 18:41:33 +0200 (CEST)
From: Wolfgang Denk <wd@denx.de>
MIME-Version: 1.0
Content-transfer-encoding: 8bit
Date: Sat, 09 Jun 2018 18:41:33 +0200
Message-Id: <20180609164133.7EFA8240049@gemini.denx.de>
Subject: [linux-lvm] Cannot activate LVs in VG xxx while PVs appear on
	duplicate devices.
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

oHi,

...and sorry if this has been discussed before; I was not able to
find a searchable archive of this list, and google did not help
either...

After upgrading a system from Fedora 27 to Fedroa 28 it fails to boot
because it cannot find the root file system. The root file system is
in a logical volume; the respective physical volume is a mdadm RAID1
array. The reason for the failure is that the volume group has not
been activated, and trying to do so manually fails as well:

# cat /proc/mdstat
Personalities : [raid10] [raid1] [raid6] [raid5] [raid4]
md0 : active raid6 sdk[10] sdh[13] sdg[11] sdi[8] sdl[14] sdm[15] sde[12]
sdj[9]
      11720301024 blocks super 1.2 level 6, 16k chunk, algorithm 2 [8/8]
[UUUUUUUU]

md1 : active raid1 sda3[1] sdb3[0]
      484118656 blocks [2/2] [UU]

md2 : active raid1 sda1[1] sdb1[0]
      255936 blocks [2/2] [UU]

md3 : active raid10 sdd1[1] sdc1[0]
      234878976 blocks 512K chunks 2 far-copies [2/2] [UU]
      bitmap: 0/2 pages [0KB], 65536KB chunk

unused devices: <none>

# lvm vgchange -ay
  WARNING: PV ljJ72U-Nfie-xcXH-cObX-Sh2W-vDLZ-aR05lx on /dev/sda3 was already
found on /dev/md1.
  WARNING: PV ljJ72U-Nfie-xcXH-cObX-Sh2W-vDLZ-aR05lx on /dev/sdb3 was already
found on /dev/md1.
  WARNING: PV ljJ72U-Nfie-xcXH-cObX-Sh2W-vDLZ-aR05lx prefers device /dev/md1
because device size is correct.
  WARNING: PV ljJ72U-Nfie-xcXH-cObX-Sh2W-vDLZ-aR05lx prefers device /dev/md1
because device size is correct.
  Cannot activate LVs in VG atlas1 while PVs appear on duplicate devices.
  Cannot activate LVs in VG atlas1 while PVs appear on duplicate devices.
  Cannot activate LVs in VG atlas1 while PVs appear on duplicate devices.
  Cannot activate LVs in VG atlas1 while PVs appear on duplicate devices.
  0 logical volume(s) in volume group "atlas1" now active
  6 logical volume(s) in volume group "atlas0" now active


When booting the same system (and the same root file system) suing
the previous (Fedora 27) kernel and ramdisk, it works fine.

I wonder if this is a generic LVM issue or a Fedora specific
problem;  given that Fedora 27 has lvm2-2.02.175-1.fc27.x86_64
while Fedora 28 has lvm2-2.02.177-4.fc28.x86_64, which are
essentially the same upstream version, I tend to believe this is a
Fedora thing?

For more information see also [1]

[1] https://bugzilla.redhat.com/show_bug.cgi?id=1589444


Any help how to fix/avoid this problem would be highly appreciated.


Thanks in advance.

Best regards,

Wolfgang Denk

-- 
DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-10 Fax: (+49)-8142-66989-80 Email: wd@denx.de
Shakespeare's Law of Prototyping: (Hamlet III, iv, 156-160)
        O, throw away the worser part of it,
        And live the purer with the other half.
