From: Kevin Corry <kevcorry@us.ibm.com>
Subject: Re: [linux-lvm] device-mapper ioctl cmd 2 failed: Invalid argument
References: <E791AEC2-EDDA-11D7-BE69-000393CA5730@yahoo.co.uk>
In-Reply-To: <E791AEC2-EDDA-11D7-BE69-000393CA5730@yahoo.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200309231055.22721.kevcorry@us.ibm.com>
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
Date: Tue Sep 23 12:08:09 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: Joe Thornber <ethornber@yahoo.co.uk>
Cc: linux-lvm@sistina.com

On Tuesday 23 September 2003 10:30, Joe Thornber wrote:
> On Tuesday, September 23, 2003, at 03:24 PM, Kevin Corry wrote:
> > Do we think the v4 interface has now gotten enough testing to remove
> > the v1
> > stuff from 2.6? :)
>
> The next step is submit a patch that makes v4 the default.
>
> - Joe

Like this?

-- 
Kevin Corry
kevcorry@us.ibm.com
http://evms.sourceforge.net/


--- a/drivers/md/Kconfig	2003-09-23 10:50:15.000000000 -0500
+++ b/drivers/md/Kconfig	2003-09-23 10:50:05.000000000 -0500
@@ -148,6 +148,7 @@
 config DM_IOCTL_V4
 	bool "ioctl interface version 4"
 	depends on BLK_DEV_DM
+	default y
 	---help---
 	  Recent tools use a new version of the ioctl interface, only
           select this option if you intend using such tools.
