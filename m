From: <travis@usi.net>
Message-Id: <200303202212.h2KMCVIm023600@disgustapated.emc.usi.net>
Subject: [linux-lvm] Interesting LVM Error...
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
Date: Thu Mar 20 16:11:12 2003
List-Id: <linux-lvm.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Hello,

	I am working with EMC drives (Both M1/M2s and BCVs) and encountered
the following problem with vgexport.  When I try to export a volume group
which consists of BCVs, I receive the following error:

[root@sanbox06 root]# vgexport -v bcvorabackupdg
vgexport -- locking logical volume manager
vgexport -- checking volume group name
vgexport -- checking volume group activity
vgexport -- reading data of volume group "bcvorabackupdg" from disk(s)
vgexport -- ERROR "lv_read_all_lv(): number of LV" reading data of volume group "bcvorabackupdg"

vgexport -- unlocking logical volume manager


Now, the creation of both the BCV volume group and the mirrored EMC volume group
was identical.  When exporting the BCV volume group I have no issues at all and
everything runs as exptected.  I have run vgexport on three mirrored groups with
no issues, but each time I use a BCV group, the same error appears.  Thanks in 
advance for any feedback!

Cheers,
Travis B.
