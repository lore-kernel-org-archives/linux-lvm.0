From: Greg Freemyer <freemyer@NorcrossGroup.com>
Subject: re[2]: [linux-lvm] Corrupted LVM, need help
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Message-Id: <20020930214926.UWJP4016.imf17bis.bellsouth.net@TAZ2>
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Help: <mailto:linux-lvm-request@sistina.com?subject=help>
List-Post: <mailto:linux-lvm@sistina.com>
List-Subscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=subscribe>
List-Unsubscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=unsubscribe>
List-Archive: <http://lists.sistina.com/pipermail/linux-lvm/>
Date: Mon Sep 30 16:49:33 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: Text/plain; charset="us-ascii"
To: LVM Mailing list <linux-lvm@sistina.com>linux-lvm@sistina.com

Thanks Austin,

That was the command I was looking for.

Drives are mounted and there does not appear to be any data loss. :)   (Yes, I =
do have backups, but I didn't want to have to use them.)

Greg

>>  have you tried doing vgcfgrestore /dev/sdxx?



>>  On Mon, 2002-09-30 at 15:56, Greg Freemyer wrote:
>>  > All,
>>  >=20
>>  > I have a LVM based data disk with 3 LVs.  My OS disks are _not_ LVM
>>  > based.
>>  >=20
>>  > We had a lightning storm over the weekend, and an old kernel (2.4.18)
>>  > got=20
>>  > booted when the machine was powered back on.  I have 2.4.19 running
>>  > again now.
>>  >=20
>>  > Now I get the following:
>>  >=20
>>  > SuSEbox:~ # pvscan
>>  > pvscan -- reading all physical volumes (this may take a while...)
>>  > pvscan -- inactive PV "/dev/sda1"  is associated to unknown VG
>>  > "TruStore-Data"=20
>>  > (run vgscan)
>>  > pvscan -- total: 1 [55.91 GB] / in use: 1 [55.91 GB] / in no VG: 0 [0]
>>  >=20
>>  > SuSEbox:~ # vgscan
>>  > vgscan -- reading all physical volumes (this may take a while...)
>>  > vgscan -- ERROR "lv_read_all_lv(): number of LV" can't get data of
>>  > volume group=20
>>  > "TruStore-Data" from physical volume(s)
>>  > vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d" successfully created
>>  > vgscan -- WARNING: This program does not do a VGDA backup of your
>>  > volume group
>>  >=20
>>  > SuSEbox:~ #=20
>>  >=20
>>  > Any ideas on how to restore my LVM config tables (VGDAs ??).  I think
>>  > LVM keeps=20
>>  > backups somewhere.
>>  >=20
>>  >=20
>>  > Greg Freemyer
>>  > Internet Engineer
>>  > Deployment and Integration Specialist
>>  > Compaq ASE - Tru64 v4, v5
>>  > Compaq Master ASE - SAN Architect
>>  > The Norcross Group
>>  > www.NorcrossGroup.com
>>  >=20
>>  >=20
>>  > _______________________________________________
>>  > linux-lvm mailing list
>>  > linux-lvm@sistina.com
>>  > http://lists.sistina.com/mailman/listinfo/linux-lvm
>>  > read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>>  --=20
>>  Austin Gonyou <austin@coremetrics.com>
>>  Coremetrics, Inc.

>>  _______________________________________________
>>  linux-lvm mailing list
>>  linux-lvm@sistina.com
>>  http://lists.sistina.com/mailman/listinfo/linux-lvm
>>  read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/





Greg Freemyer
Internet Engineer
Deployment and Integration Specialist
Compaq ASE - Tru64 v4, v5
Compaq Master ASE - SAN Architect
The Norcross Group
www.NorcrossGroup.com
