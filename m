Date: Fri, 5 Oct 2001 21:31:21 +0200
From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] pvcreate fails on a software RAID metadisk
Message-ID: <20011005213121.A4811@colombina.comedia.it>
References: <3BBC8B5B.1A484028@legis.state.ak.us> <NEBBLHFAEINCLDICDLOAIENJCHAA.yves.alloyer@slpinfoware.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <NEBBLHFAEINCLDICDLOAIENJCHAA.yves.alloyer@slpinfoware.com>; from Yves.ALLOYER@slpinfoware.com on Fri, Oct 05, 2001 at 11:13:35AM +0200
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Fri, Oct 05, 2001 at 11:13:35AM +0200, yves.alloyer wrote:
> I did a quick and dirty patch which fixed it for me.
> Please be aware: I am new to this list, new to linux LVM...
> I know the patch will prevent you from using any partitioned MD device in
> LVM. I have no idea of further implications.
Yves, thanks this seems to have fixed this, i still agree with Andreas that lvm_check_partitioned_dev should be
checked.
i wuld use LVM_DEVICE_TYPE_MD instead of 2 in the patch
as for partitioned md device i believe the major is different from 9, but i would not suggest using them
with lvm anyway.

patch with my mod follows for the lazy,
pleas check it in cvs for the time being.

--- tools/lib/lvm_check_partitioned_dev.c.bluca	Thu Aug 23 07:51:53 2001
+++ tools/lib/lvm_check_partitioned_dev.c	Fri Oct  5 21:18:51 2001
@@ -55,6 +55,8 @@
 	switch (lvm_get_device_type(st_rdev)) {
 	case LVM_DEVICE_TYPE_INVALID:
 	    break;
+	case LVM_DEVICE_TYPE_MD:
+	    break;
 	default:
 	    ret = TRUE;
 	}

-- 
Luca Berra -- bluca@comedia.it
        Communication Media & Services S.r.l.
 /"\
 \ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
 / \
