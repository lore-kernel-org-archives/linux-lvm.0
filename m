Message-ID: <3BA66E42.9010603@kenamea.com>
Date: Mon, 17 Sep 2001 14:42:26 -0700
From: Kenny Gorman <kenny@kenamea.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Phantom Vol Grp
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
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com

This may be a re-post, I am not sure if it went through.. sorry if it's 
a duplicate:



-------- Original Message --------
Subject: Phantom Vol Grp
Date: Mon, 17 Sep 2001 14:13:13 -0700
From: Kenny Gorman <kenny@kenamea.com>
To: linux-lvm@sistina.com

I can not delete a vol grp, but it doesn't show as there.  When I try to
create a new one with the same name, then it says it exists...  how do I
   'clean out' old references?

See below:

colobus:~ # pvscan
pvscan -- reading all physical volumes (this may take a while...)
pvscan -- ACTIVE   PV "/dev/sdb1" of VG "oraredo1" [100 MB / 100 MB free]
pvscan -- inactive PV "/dev/sdb2" is in no VG  [16.99 GB]
pvscan -- ACTIVE   PV "/dev/sdc1" of VG "oraredo2" [100 MB / 100 MB free]
pvscan -- inactive PV "/dev/sdc2" is in no VG  [16.99 GB]
pvscan -- ACTIVE   PV "/dev/sdd1" of VG "redogrp3" [17.09 GB / 16.98 GB
free]
pvscan -- ACTIVE   PV "/dev/sdd2" of VG "sysgrp"   [16.99 GB / 12.49 GB
free]
pvscan -- total: 6 [68.26 GB] / in use: 4 [34.28 GB] / in no VG: 2
[33.98 GB]

colobus:~ # vgcreate indxgrp /dev/sdc2
vgcreate -- volume group directory or file already exists
vgcreate -- please choose a different name

colobus:~ # vgremove indxgrp
vgremove -- ERROR: can't remove active volume group "indxgrp"

colobus:~ # vgchange -a n indxgrp
vgchange -- volume group "indxgrp" does not exist

colobus:~ # vgdisplay indxgrp
vgdisplay -- volume group "indxgrp" not found



-kg
