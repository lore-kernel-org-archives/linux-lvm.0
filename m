Return-Path: <thornber@btconnect.com>
Date: Thu, 31 May 2001 16:11:55 +0100
Subject: Re: [linux-lvm] Severe bug in kernel-2.4.4 lvm
Message-ID: <20010531161155.A1352@66bassett.freeserve.co.uk>
References: <Pine.LNX.4.32.0105311616080.3682-100000@falka.mfa.kfki.hu>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.32.0105311616080.3682-100000@falka.mfa.kfki.hu>; from dice@mfa.kfki.hu on Thu, May 31, 2001 at 04:16:45PM +0200
From: Joe Thornber <thornber@btconnect.com>
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

On Thu, May 31, 2001 at 04:16:45PM +0200, Gergely Tamas wrote:
<snip>

> ps: just ask because Andrea has a patch with the comment
>     'it has some other tons of fixes' for lvm 0.9.1b7 on the
>     ftp.kernel.org.

I presume he means that beta7 has tons of fixes for the vanilla
kernel.  I just had a look at his code and the differences are very
small compared to our CVS code (I haven't listed them all here):

--- /usr/src/linux/drivers/md/lvm-fs.c  Thu May 31 15:48:03 2001
+++ /tmp/linux/drivers/md/lvm-fs.c      Thu May 31 15:48:17 2001
@@ -577,7 +572,7 @@
        allocation_flag = 'A';
        if (!(pv->pv_allocatable & PV_ALLOCATABLE))
                allocation_flag = 'N';
-       pv_name = strchr(pv->pv_name+1,'/');
+       pv_name = strrchr(pv->pv_name+1,'/');
        if ( pv_name == 0) pv_name = pv->pv_name;
        else               pv_name++;
        sz = sprintf(buf,



He also knocked out the __brw_kiovec from lvm-snap, sensible since
this just calls brw_kiovec for 2.4 kernels, and I doubt he's looked at
the 2.2 code.

He uses the 'blocks' array in the iobufs rather than a seperate one,
this saves stack space and is cleaner.

He doesn't lock page before calling brw_kiovec in lvm-snap, (we lock
them on allocation), for a vanilla kernel this means that Andrea's
code will have problems with snapshots.  There's always a chance that
he has a patch for brw_kiovec which moves the LockPage into here.


Debug only bug fix:

--- /usr/src/linux/drivers/md/lvm.c     Thu May 31 15:48:03 2001
+++ /tmp/linux/drivers/md/lvm.c Thu May 31 15:48:17 2001
@@ -1156,7 +1144,7 @@
 
        P_MAP("%s - lvm_map minor: %d  *rdev: %s  *rsector: %lu  size:%lu\n",
              lvm_name, minor,
-             kdevname(bh->b_dev),
+             kdevname(bh->b_rdev),
              rsector_org, size);
 


We have nicer pv move code in cvs that he hasn't picked up yet.


That's about it.


- Joe
