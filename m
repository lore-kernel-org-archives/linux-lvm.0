Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j31I4oO20839
	for <linux-lvm@redhat.com>; Fri, 1 Apr 2005 13:04:50 -0500
Message-Id: <200504011804.j31I4bbt074009@tron.kn.vutbr.cz>
From: "Jiri Bartosik" <bartosik@kn.vutbr.cz>
Date: Fri, 1 Apr 2005 20:04:46 +0200
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Problem with UUID on PVs
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Hi,
I have really big problem with 2 VGs / 2 PVs on my linux box. After
reinstalling my gentoo linux, vgscan fails on this error message:

vgscan
  Reading all physical volumes.  This may take a while...
  Couldn't find device with uuid 'ZpitfR-Kwsh-8YJH-6RLS-tDZL-Tlhg-xcM99S'.
  Couldn't find all physical volumes for volume group vg_XXX2.
  Couldn't find device with uuid 'ZpitfR-Kwsh-8YJH-6RLS-tDZL-Tlhg-xcM99S'.
  Couldn't find all physical volumes for volume group vg_XXX2.
  Volume group "vg_XXX2" not found
  Found volume group "vg_XXX3" using metadata type lvm2
  Couldn't find device with uuid 'bMo1Vl-PZyi-E41g-q22v-n2hF-Jzdr-LsAfmw'.
  Couldn't find all physical volumes for volume group vg_XXX.
  Couldn't find device with uuid 'bMo1Vl-PZyi-E41g-q22v-n2hF-Jzdr-LsAfmw'.
  Couldn't find all physical volumes for volume group vg_XXX.
  Volume group "vg_XXX" not found

But, before reinstalling everything was working fine from setup of
PVs/VGs/LVs. I didn't move disks on controllers during instalation of new
OS. And I also have backup of lvm.conf and backup directory from lvm dir in
/etc, so I'm really sure which hdd should have which UUID. But it seems some
HDDs don't have UUIDs or have them corrupted... From backup dir:

vg_XXX2:
	pv2 {
                        id = "ZpitfR-Kwsh-8YJH-6RLS-tDZL-Tlhg-xcM99S"
                        device = "/dev/hdk"     # Hint only

                        status = ["ALLOCATABLE"]
                        pe_start = 384
                        pe_count = 5961 # 186.281 Gigabytes
                }


vg_XXX:
           pv2 {
                        id = "bMo1Vl-PZyi-E41g-q22v-n2hF-Jzdr-LsAfmw"
                        device = "/dev/hde"     # Hint only

                        status = ["ALLOCATABLE"]
                        pe_start = 384
                        pe_count = 3663 # 114.469 Gigabytes
                }

Is there any way to fix UUID on PV with maintaining data od that PVs? I
tried uuid_fixer, I looked for some guide, but both didn't work.

I'm running:
Gentoo linux
kernel - 2.6.11-gentoo-r4
lvm/raid/dm included in kernel
lvm2-2.00.33-r1 installed
reiserfsprogs-3.6.19

Sincerely
Jiri Bartosik
