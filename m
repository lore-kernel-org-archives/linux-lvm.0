Message-Id: <3C85289C.8060606@theiqgroup.com>
From: Kelly Corbin <kcorbin@theiqgroup.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] vgscan errors
References: <3C83AD42.20301@theiqgroup.com>
    <20020305002428.B13751@sistina.com>
Content-Transfer-Encoding: 7bit
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
Date: Tue Mar  5 14:20:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com

Well, after rooting around, it looks like my partition table was screwed 
up.  However, when try to create the vg and lv again (after re-fdisking 
the disk) it fails at the lv creation.  Vgcreate works with no problem; 
I can reboot and re-activate the vg I just created.  When I run 
lvcreate, I get the following error:

#lvcreate -l23722 -nfirst_lv first_vg
lvcreate -- ERROR 0 writing volume group backup file 
/etc/lvmtab.d/first_vg.tmp in vg_cfgbackup.c [line 268]
lvcreate --  WARNING: you don't have an automatic backup of "first_vg"
lvcreate -- logical volume "/dev/first_vg/first_lv successfully created.

vgdisplay then shows the correct number of free/used extents (1 free, 
the rest used), but a vgscan now will fail miserably (before or after 
reboot) with the same error (ERROR 2)

This is a new disk that I'm trying to setup for the first time.

Ideas?

Thanks.


Heinz J . Mauelshagen wrote:

> Error 2 is ENOENT (no entry).
> Could be a space problem in case / run full.
> 
> Regards,
> Heinz    -- The LVM Guy --
> 



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
