From: Rainer Krienke <krienke@uni-koblenz.de>
MIME-Version: 1.0
Content-Type: Multipart/Mixed;
  boundary="Boundary-00=_VXg1+lx2WuQLGJm"
Message-Id: <200305291506.29805.krienke@uni-koblenz.de>
Subject: [linux-lvm] Strange lvm on raid1 on top of multipath problem
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
Date: Fri May 30 12:06:02 2003
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

--Boundary-00=_VXg1+lx2WuQLGJm
Content-Type: text/plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hello,

I'am in trouble running lvm (lvm-1.0.6 on a suse8.2 system with kernel 2.4.20) 
on a raid md device which in turn is based on two md multiptah devices:
 
                         /dev/md20  (raid1)
              /dev/md10 (mp)     /dev/md13 (mp)   mp=multipath
    	         disk1                              disk2

cat /proc/mdstat says this (just to make things clearer):

md20 : active raid1 md10[0] md13[1]
      903371648 blocks [2/2] [UU]

md13 : active multipath sde2[0] sdh2[1]
      903371712 blocks [2/2] [UU]

md10 : active multipath sdd1[0] sdg1[1]
      903373696 blocks [2/2] [UU]

The basic setup worked just fine. I created one physikal volume on /dev/md20 
(800GB) then one volumegroup "data" and then several logical volumes. So far 
everything was fine. Then I deleted one logical volume and trouble started. 
After the deletion I can no longer run vgscan. It keeps telling me (please 
see attachment for vgscan -d output):

vgscan -- reading all physical volumes (this may take a while...)
vgscan -- found active volume group "data"
vgscan -- ERROR "pv_check_consistency_all_pv(): PE" volume group "data" is 
inconsistent
vgscan -- ERROR: unable to do a backup of volume group "data"
vgscan -- ERROR "lvm_tab_vg_remove(): unlink" removing volume group "data" 
from "/etc/lvmtab"
vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d" successfully created
vgscan -- WARNING: This program does not do a VGDA backup of your volume group

I noticed that something must have gone wrong with the physical volume. It 
seems to me that lvm did not only recognice the physical volume on /dev/md20 
but somehow also on the underlying sub mirror devices /dev/md10 and 
/dev/md13. Right after I created the logical volumes lvmdiskscan showed this:
...
lvmdiskscan -- /dev/md10   [     861.52 GB] free meta device
lvmdiskscan -- /dev/md13   [     861.52 GB] free meta device
lvmdiskscan -- /dev/md20   [     861.52 GB] USED LVM meta device
...

Since the deletion of the logical volume it says:

...
lvmdiskscan -- /dev/md10   [     861.52 GB] USED LVM meta device
lvmdiskscan -- /dev/md13   [     861.52 GB] USED LVM meta device
lvmdiskscan -- /dev/md20   [     861.52 GB] USED LVM meta device
...

Is there any known problem with lvm on raid1 on top of multipath devices? 
Could it be that lvm wrote a pv-signature not only one the real physical 
volume on /dev/md20 but also on /dev/md10 and /dev/md13 or is this a suse 
bug?

I have to note that I did the changes to the PVs, VGs, LVs all with yast from 
suse not with the pv* vg* lv* commandline tools. Is this a know source of 
trouble?

Would  be very greatful for any help since the system in question actually 
should go into production very soon.....

Thanks Rainer
-- 
---------------------------------------------------------------------------
Rainer Krienke, Universitaet Koblenz, Rechenzentrum
Universitaetsstrasse 1, 56070 Koblenz, Tel: +49 261287 -1312, Fax: -1001312
Mail: krienke@uni-koblenz.de, Web: http://www.uni-koblenz.de/~krienke
Get my public PGP key: http://www.uni-koblenz.de/~krienke/mypgp.html
---------------------------------------------------------------------------

--Boundary-00=_VXg1+lx2WuQLGJm
Content-Type: application/x-gzip;
  name="vg.gz"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="vg.gz"

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

--Boundary-00=_VXg1+lx2WuQLGJm--
