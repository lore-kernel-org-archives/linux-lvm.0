Return-Path: <okeefe@brule.borg.umn.edu>
Resent-Message-Id: <200101021426.IAA42319@brule.borg.umn.edu>
Mime-Version: 1.0
From: "Michael J. Declerck" <declerck@sistina.com>
Message-Id: <20010102005127.76955E0B3@wraith>
Date: Mon, 01 Jan 2001 16:51:27 -0800
Resent-To: gfs-announce@sistina.com, gfs-users@sistina.com,
        linux-lvm@sistina.com
Subject: [linux-lvm] [gfs-users] GFS 4.0 Beta 4 released
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
To: gfs-announce@sistina.com, gfs-devel@sistina.com, gfs-users@sistina.com

All,

GFS 4.0 Beta 4 has been released and is available via the Sistina web site

-> http://www.sistina.com/gfs/software/

Updates in this release include:

 o Updated to run on 2.2.18

 o Update to the kernel patches

 o Initial work has begun on porting to 2.4.  It is not ready yet, but it
   should be shortly after 2.4 is officially released.

 o Initial support for exporting GFS filesystems via kernel-space NFS.  This
   capability has just been added and has not received extension testing yet.
   Use it with extreme care!  You have been warned!

 o Support for banning a client from a GNBD server has been added, as well as,
   a new STOMITH method that utilizes this functionality.

 o Enhancements have been made to both `gclient' and `gserv' to provide better
   user feedback.

 o New tools for DMEP operations.  `dmep_conf' is for enabling/configuring
   DMEP capable devices.  `do_dmep' is for testing the actual capabilities
   and conformance of a DMEP device.

 o Further enhancements to the `memexpd' high availability failover setup.
   This includes a new tool, `initds', that is used for initializing the
   data segment utilized to maintain lock state info.

This should hopefully be the final beta release!  Go get it!  Use it and let
us know if you experience any problems via:

-> Bugs     ==> http://bugzilla.sistina.com

or

-> Feedback ==> http://www.sistina.com/gfs/Pages/gfs_eval.html



---
Michael Declerck, declerck@sistina.com   +1.510.823.7991


_______________________________________________
gfs-users mailing list
gfs-users@sistina.com
http://lists.sistina.com/mailman/listinfo/gfs-users
Read the GFS Howto:  http://www.sistina.com/gfs/Pages/howto.html
