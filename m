Message-Id: <3C83AD42.20301@theiqgroup.com>
From: Kelly Corbin <kcorbin@theiqgroup.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] vgscan errors
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
Date: Mon Mar  4 11:22:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com

I'm getting the following errors when running vgscan from my custom 
rescue CD:

vgscan -- reading all physical volumes (this may take a while...)
vgscan -- found inactive volume group "first_vg"
vgscan -- ERROR 2 writing volume group backup file 
/etc/lvmtab.d/first_vg.tmp in vg_cfgbackup.c (line 270)
vgscan -- ERROR: unable to do a backup of volume group "first_vg"

Unfortunately, I can't figure out why it couldn't write the backup file. 
  The directory is successfully created, but apparently it can't write 
the files there for some reason.

If I do a -v I get a little more info:

vgscan -- storing volume group data of "first_vg" in 
"/etc/lvmtab.d/first_vg.tmp"
vgscan -- storing physical volume data of "first_vg" in 
"/etc/lvmtab.d/first_vg.tmp"
vgscan -- storing logical volume data

of "first_vg" in "/etc/lvmtab.d/first_vg.tmp"

vgscan -- ERROR 2 writing volume group backup file 
/etc/lvmtab.d/first_vg.tmp in vg_cfgbackup.c (line 270)
vgscan -- ERROR: unable to do a backup of volume group "first_vg"

This is a new machine and all I have done is create the volume group, 
mount it and copy data down to it.  I then rebooted and tried to run 
vgscan again to confirm the consistency of what I had done and got the 
above errors.  I've done this exact procedure several times before with 
no problems.  I'm using LVM 1.0.1 with kernel 2.4.16 patched for XFS.

Is there anything else I can try?  Ideas?

Thanks!

Kelly

-- 
--------------------------------------------
-- Kelly Corbin
-- Systems Administrator
--
-- http://www.theiqgroup.com
-- The Future of eServices...
--
-- The IQ Group, Inc.
-- 6740 Antioch Suite 110
-- Merriam, KS 66204
-- (913)-722-6700 x105
-- Fax (913)722-7264
--------------------------------------------
