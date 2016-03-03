Received: from mx1.redhat.com (ext-mx09.extmail.prod.ext.phx2.redhat.com
	[10.5.110.38])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u23DSrwT008682
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO) for <linux-lvm@redhat.com>; Thu, 3 Mar 2016 08:28:53 -0500
Received: from snark.thyrsus.com (static-71-162-243-5.phlapa.fios.verizon.net
	[71.162.243.5]) by mx1.redhat.com (Postfix) with ESMTPS id ED356D2ED1
	for <linux-lvm@redhat.com>; Thu,  3 Mar 2016 13:28:50 +0000 (UTC)
Received: from [127.0.1.1] (localhost [127.0.0.1])
	by snark.thyrsus.com (Postfix) with ESMTP id C8F8713A0E65
	for <linux-lvm@redhat.com>; Thu,  3 Mar 2016 08:28:49 -0500 (EST)
Content-Type: multipart/mixed; boundary="===============7312583652815031067=="
MIME-Version: 1.0
Message-Id: <20160303132849.C8F8713A0E65@snark.thyrsus.com>
Date: Thu,  3 Mar 2016 08:28:49 -0500 (EST)
From: esr@thyrsus.com
Subject: [linux-lvm] Problems in lvm.8
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@redhat.com

--===============7312583652815031067==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

This is automatically generated email about markup problems in a man
page for which you appear to be responsible.  If you are not the right
person or list, please tell me so I can correct my database.

See http://catb.org/~esr/doclifter/bugs.html for details on how and
why these patches were generated.  Feel free to email me with any
questions.  Note: These patches do not change the modification date of
any manual page.  You may wish to do that by hand.

I apologize if this message seems spammy or impersonal. The volume of
markup bugs I am tracking is over five hundred - there is no real
alternative to generating bugmail from a database and template.

--
                             Eric S. Raymond

--===============7312583652815031067==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Problems with lvm.8:

List syntax error. This means .IP, .TP or .RS/.RE markup is garbled.
Common causes include .TP just before a section header, .TP entries
with tags but no bodies, and mandoc lists with no trailing .El.
These confuse doclifter, and may also mess up stricter man-page
browsers like Xman and Rosetta.

--- lvm.8-unpatched	2016-03-03 08:26:12.286823811 -0500
+++ lvm.8	2016-03-03 08:26:24.274791810 -0500
@@ -42,122 +42,121 @@
 .SH BUILT-IN COMMANDS
 The following commands are built into lvm without links normally
 being created in the filesystem for them.
-.TP
+.IP
 \fBconfig\fP \(em The same as \fBlvmconfig\fP(8) below.
-.TP
+.IP
 \fBdevtypes\fP \(em Display the recognised built-in block device types.
-.TP
+.IP
 \fBdumpconfig\fP \(em The same as \fBlvmconfig\fP(8) below.
-.TP
+.IP
 \fBformats\fP \(em Display recognised metadata formats.
-.TP
+.IP
 \fBhelp\fP \(em Display the help text.
-.TP
+.IP
 \fBlvpoll\fP \(em Internal command used by lvmpolld to complete some Logical Volume operations.
-.TP
+.IP
 \fBpvdata\fP \(em Not implemented in LVM2.
-.TP
+.IP
 \fBsegtypes\fP \(em Display recognised Logical Volume segment types.
-.TP
+.IP
 \fBsystemid\fP \(em Display the system ID, if any, currently set on this host.
-.TP
+.IP
 \fBtags\fP \(em Display any tags defined on this host.
-.TP
+.IP
 \fBversion\fP \(em Display version information.
 .LP
 .SH COMMANDS
 The following commands implement the core LVM functionality.
-.TP
+.IP
 \fBpvchange\fP \(em Change attributes of a Physical Volume.
-.TP
+.IP
 \fBpvck\fP \(em Check Physical Volume metadata.
-.TP
+.IP
 \fBpvcreate\fP \(em Initialize a disk or partition for use by LVM.
-.TP
+.IP
 \fBpvdisplay\fP \(em Display attributes of a Physical Volume.
-.TP
+.IP
 \fBpvmove\fP \(em Move Physical Extents.
-.TP
+.IP
 \fBpvremove\fP \(em Remove a Physical Volume.
-.TP
+.IP
 \fBpvresize\fP \(em Resize a disk or partition in use by LVM2.
-.TP
+.IP
 \fBpvs\fP \(em Report information about Physical Volumes.
-.TP
+.IP
 \fBpvscan\fP \(em Scan all disks for Physical Volumes.
-.TP
+.IP
 \fBvgcfgbackup\fP \(em Backup Volume Group descriptor area.
-.TP
+.IP
 \fBvgcfgrestore\fP \(em Restore Volume Group descriptor area.
-.TP
+.IP
 \fBvgchange\fP \(em Change attributes of a Volume Group.
-.TP
+.IP
 \fBvgck\fP \(em Check Volume Group metadata.
-.TP
+.IP
 \fBvgconvert\fP \(em Convert Volume Group metadata format.
-.TP
+.IP
 \fBvgcreate\fP \(em Create a Volume Group.
-.TP
+.IP
 \fBvgdisplay\fP \(em Display attributes of Volume Groups.
-.TP
+.IP
 \fBvgexport\fP \(em Make volume Groups unknown to the system.
-.TP
+.IP
 \fBvgextend\fP \(em Add Physical Volumes to a Volume Group.
-.TP
+.IP
 \fBvgimport\fP \(em Make exported Volume Groups known to the system.
-.TP
+.IP
 \fBvgimportclone\fP \(em Import and rename duplicated Volume Group (e.g. a hardware snapshot).
-.TP
+.IP
 \fBvgmerge\fP \(em Merge two Volume Groups.
-.TP
+.IP
 \fBvgmknodes\fP \(em Recreate Volume Group directory and Logical Volume special files
-.TP
-\fBvgreduce\fP \(em Reduce a Volume Group by removing one or more
-Physical Volumes.
-.TP
+.IP
+\fBvgreduce\fP \(em Reduce a Volume Group by removing one or more Physical Volumes.
+.IP
 \fBvgremove\fP \(em Remove a Volume Group.
-.TP
+.IP
 \fBvgrename\fP \(em Rename a Volume Group.
-.TP
+.IP
 \fBvgs\fP \(em Report information about Volume Groups.
-.TP
+.IP
 \fBvgscan\fP \(em Scan all disks for Volume Groups and rebuild caches.
-.TP
+.IP
 \fBvgsplit\fP \(em Split a Volume Group into two, moving any logical
 volumes from one Volume Group to another by moving entire Physical
 Volumes.
-.TP
+.IP
 \fBlvchange\fP \(em Change attributes of a Logical Volume.
-.TP
+.IP
 \fBlvconvert\fP \(em Convert a Logical Volume from linear to mirror or snapshot.
-.TP
+.IP
 \fBlvcreate\fP \(em Create a Logical Volume in an existing Volume Group.
-.TP
+.IP
 \fBlvdisplay\fP \(em Display attributes of a Logical Volume.
-.TP
+.IP
 \fBlvextend\fP \(em Extend the size of a Logical Volume.
-.TP
+.IP
 \fBlvmchange\fP \(em Change attributes of the Logical Volume Manager.
-.TP
+.IP
 \fBlvmconfig\fP \(em Display the configuration information after
 loading \fBlvm.conf\fP(5) and any other configuration files.
-.TP
+.IP
 \fBlvmdiskscan\fP \(em Scan for all devices visible to LVM2.
-.TP
+.IP
 \fBlvmdump\fP \(em Create lvm2 information dumps for diagnostic purposes.
-.TP
+.IP
 \fBlvreduce\fP \(em Reduce the size of a Logical Volume.
-.TP
+.IP
 \fBlvremove\fP \(em Remove a Logical Volume.
-.TP
+.IP
 \fBlvrename\fP \(em Rename a Logical Volume.
-.TP
+.IP
 \fBlvresize\fP \(em Resize a Logical Volume.
-.TP
+.IP
 \fBlvs\fP \(em Report information about Logical Volumes.
-.TP
+.IP
 \fBlvscan\fP \(em Scan (all disks) for Logical Volumes.
-.TP
+.IP
 The following commands are not implemented in LVM2 but might be in the future: lvmsadc, lvmsar, pvdata.
 .SH OPTIONS
 The following options are available for many of the commands.

--===============7312583652815031067==--
