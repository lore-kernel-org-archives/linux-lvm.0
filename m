Received: from mx1.redhat.com (ext-mx08.extmail.prod.ext.phx2.redhat.com
	[10.5.110.32])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u25BxYFd023282
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO) for <linux-lvm@redhat.com>; Sat, 5 Mar 2016 06:59:34 -0500
Received: from snark.thyrsus.com (static-71-162-243-5.phlapa.fios.verizon.net
	[71.162.243.5])
	by mx1.redhat.com (Postfix) with ESMTPS id 632E3C00EB11
	for <linux-lvm@redhat.com>; Sat,  5 Mar 2016 11:59:33 +0000 (UTC)
Received: from [127.0.1.1] (localhost [127.0.0.1])
	by snark.thyrsus.com (Postfix) with ESMTP id 63D6A13A0475
	for <linux-lvm@redhat.com>; Sat,  5 Mar 2016 06:59:32 -0500 (EST)
Content-Type: multipart/mixed; boundary="===============5240475330808798443=="
MIME-Version: 1.0
Message-Id: <20160305115932.63D6A13A0475@snark.thyrsus.com>
Date: Sat,  5 Mar 2016 06:59:32 -0500 (EST)
From: esr@thyrsus.com
Subject: [linux-lvm] Problems in lvm.8, lvmconfig.8, lvm-config.8,
 lvm-dumpconfig.8, lvreduce.8, lvresize.8, lvcreate.8, lvconvert.8
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

--===============5240475330808798443==
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

--===============5240475330808798443==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Problems with lvm.8:

Unbalanced group in command synopsis. You probably forgot
to open or close a [ ] or { } group properly.

--- lvm.8-unpatched	2016-03-03 08:26:12.286823811 -0500
+++ lvm.8	2016-03-03 08:26:24.274791810 -0500
@@ -42,122 +42,121 @@
 .SH BUILT-IN COMMANDS
 The following commands are built into lvm without links normally
 being created in the filesystem for them.
-.TP
+.IP "" 0
 \fBconfig\fP \(em The same as \fBlvmconfig\fP(8) below.
-.TP
+.IP "" 0
 \fBdevtypes\fP \(em Display the recognised built-in block device types.
-.TP
+.IP "" 0
 \fBdumpconfig\fP \(em The same as \fBlvmconfig\fP(8) below.
-.TP
+.IP "" 0
 \fBformats\fP \(em Display recognised metadata formats.
-.TP
+.IP "" 0
 \fBhelp\fP \(em Display the help text.
-.TP
+.IP "" 0
 \fBlvpoll\fP \(em Internal command used by lvmpolld to complete some Logical Volume operations.
-.TP
+.IP "" 0
 \fBpvdata\fP \(em Not implemented in LVM2.
-.TP
+.IP "" 0
 \fBsegtypes\fP \(em Display recognised Logical Volume segment types.
-.TP
+.IP "" 0
 \fBsystemid\fP \(em Display the system ID, if any, currently set on this host.
-.TP
+.IP "" 0
 \fBtags\fP \(em Display any tags defined on this host.
-.TP
+.IP "" 0
 \fBversion\fP \(em Display version information.
 .LP
 .SH COMMANDS
 The following commands implement the core LVM functionality.
-.TP
+.IP "" 0
 \fBpvchange\fP \(em Change attributes of a Physical Volume.
-.TP
+.IP "" 0
 \fBpvck\fP \(em Check Physical Volume metadata.
-.TP
+.IP "" 0
 \fBpvcreate\fP \(em Initialize a disk or partition for use by LVM.
-.TP
+.IP "" 0
 \fBpvdisplay\fP \(em Display attributes of a Physical Volume.
-.TP
+.IP "" 0
 \fBpvmove\fP \(em Move Physical Extents.
-.TP
+.IP "" 0
 \fBpvremove\fP \(em Remove a Physical Volume.
-.TP
+.IP "" 0
 \fBpvresize\fP \(em Resize a disk or partition in use by LVM2.
-.TP
+.IP "" 0
 \fBpvs\fP \(em Report information about Physical Volumes.
-.TP
+.IP "" 0
 \fBpvscan\fP \(em Scan all disks for Physical Volumes.
-.TP
+.IP "" 0
 \fBvgcfgbackup\fP \(em Backup Volume Group descriptor area.
-.TP
+.IP "" 0
 \fBvgcfgrestore\fP \(em Restore Volume Group descriptor area.
-.TP
+.IP "" 0
 \fBvgchange\fP \(em Change attributes of a Volume Group.
-.TP
+.IP "" 0
 \fBvgck\fP \(em Check Volume Group metadata.
-.TP
+.IP "" 0
 \fBvgconvert\fP \(em Convert Volume Group metadata format.
-.TP
+.IP "" 0
 \fBvgcreate\fP \(em Create a Volume Group.
-.TP
+.IP "" 0
 \fBvgdisplay\fP \(em Display attributes of Volume Groups.
-.TP
+.IP "" 0
 \fBvgexport\fP \(em Make volume Groups unknown to the system.
-.TP
+.IP "" 0
 \fBvgextend\fP \(em Add Physical Volumes to a Volume Group.
-.TP
+.IP "" 0
 \fBvgimport\fP \(em Make exported Volume Groups known to the system.
-.TP
+.IP "" 0
 \fBvgimportclone\fP \(em Import and rename duplicated Volume Group (e.g. a hardware snapshot).
-.TP
+.IP "" 0
 \fBvgmerge\fP \(em Merge two Volume Groups.
-.TP
+.IP "" 0
 \fBvgmknodes\fP \(em Recreate Volume Group directory and Logical Volume special files
-.TP
-\fBvgreduce\fP \(em Reduce a Volume Group by removing one or more
-Physical Volumes.
-.TP
+.IP "" 0
+\fBvgreduce\fP \(em Reduce a Volume Group by removing one or more Physical Volumes.
+.IP "" 0
 \fBvgremove\fP \(em Remove a Volume Group.
-.TP
+.IP "" 0
 \fBvgrename\fP \(em Rename a Volume Group.
-.TP
+.IP "" 0
 \fBvgs\fP \(em Report information about Volume Groups.
-.TP
+.IP "" 0
 \fBvgscan\fP \(em Scan all disks for Volume Groups and rebuild caches.
-.TP
+.IP "" 0
 \fBvgsplit\fP \(em Split a Volume Group into two, moving any logical
 volumes from one Volume Group to another by moving entire Physical
 Volumes.
-.TP
+.IP "" 0
 \fBlvchange\fP \(em Change attributes of a Logical Volume.
-.TP
+.IP "" 0
 \fBlvconvert\fP \(em Convert a Logical Volume from linear to mirror or snapshot.
-.TP
+.IP "" 0
 \fBlvcreate\fP \(em Create a Logical Volume in an existing Volume Group.
-.TP
+.IP "" 0
 \fBlvdisplay\fP \(em Display attributes of a Logical Volume.
-.TP
+.IP "" 0
 \fBlvextend\fP \(em Extend the size of a Logical Volume.
-.TP
+.IP "" 0
 \fBlvmchange\fP \(em Change attributes of the Logical Volume Manager.
-.TP
+.IP "" 0
 \fBlvmconfig\fP \(em Display the configuration information after
 loading \fBlvm.conf\fP(5) and any other configuration files.
-.TP
+.IP "" 0
 \fBlvmdiskscan\fP \(em Scan for all devices visible to LVM2.
-.TP
+.IP "" 0
 \fBlvmdump\fP \(em Create lvm2 information dumps for diagnostic purposes.
-.TP
+.IP "" 0
 \fBlvreduce\fP \(em Reduce the size of a Logical Volume.
-.TP
+.IP "" 0
 \fBlvremove\fP \(em Remove a Logical Volume.
-.TP
+.IP "" 0
 \fBlvrename\fP \(em Rename a Logical Volume.
-.TP
+.IP "" 0
 \fBlvresize\fP \(em Resize a Logical Volume.
-.TP
+.IP "" 0
 \fBlvs\fP \(em Report information about Logical Volumes.
-.TP
+.IP "" 0
 \fBlvscan\fP \(em Scan (all disks) for Logical Volumes.
-.TP
+.IP "" 0
 The following commands are not implemented in LVM2 but might be in the future: lvmsadc, lvmsar, pvdata.
 .SH OPTIONS
 The following options are available for many of the commands.

--===============5240475330808798443==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Problems with lvconvert.8:

Unbalanced group in command synopsis. You probably forgot
to open or close a [ ] or { } group properly.

--- lvconvert.8-unpatched	2016-03-05 06:58:34.013448075 -0500
+++ lvconvert.8	2016-03-05 06:58:44.097432628 -0500
@@ -124,7 +124,7 @@
 .RB [ \-\-originname
 .IR NewExternalOriginVolumeName ]
 .RB [ \-\-thinpool
-.IR ThinPoolLogicalVolume { Name | Path }
+.IR ThinPoolLogicalVolume { Name | Path } ]
 .RB [ \-c | \-\-chunksize
 .IR ChunkSize [ bBsSkKmMgG ]]
 .RB [ \-\-discards
@@ -137,10 +137,10 @@
 .RB [ \-r | \-\-readahead
 .RI { ReadAheadSectors | auto | none }]
 .RB [ \-\-stripes \ \fIStripes
-.RB [ \-I | \-\-stripesize \  \fIStripeSize ]]]
+.RB [ \-I | \-\-stripesize \  \fIStripeSize ]]
 .RB [ \-\-poolmetadataspare
 .RI { y | n }]
-.RB [ \-Z | \-\-zero \ { \fIy | \fIn }]]
+.RB [ \-Z | \-\-zero \ { \fIy | \fIn }]
 .RB [ \-\-commandprofile
 .IR ProfileName ]
 .RB [ \-h | \-? | \-\-help ]
@@ -148,7 +148,7 @@
 .RB [ \-\-version ]
 .RI [[ ExternalOrigin | ThinPool ] LogicalVolume { Name | Path }]
 .RI [ PhysicalVolume [ Path ][ :PE
-.RI [ \-PE ]]\ \.\|\.\|\.
+.RI [ \-PE ]]\ \.\|\.\|\. ]
 .sp
 .B lvconvert
 .B \-\-type

--===============5240475330808798443==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Problems with lvresize.8:

Unbalanced group in command synopsis. You probably forgot
to open or close a [ ] or { } group properly.

--- lvresize.8-unpatched	2016-02-29 06:13:26.498737707 -0500
+++ lvresize.8	2016-02-29 06:14:41.306544896 -0500
@@ -9,11 +9,11 @@
 .IR ProfileName ]
 .RB [ \-i | \-\-stripes " " \fIStripes
 .RB [ \-I | \-\-stripesize " " \fIStripeSize ]]
-.RB {[ \-l | \-\-extents
+.RB {[ \-l | \-\-extents ]
 .RI [ + | \- ] LogicalExtentsNumber [ % { VG | LV | PVS | FREE | ORIGIN "}] |"
-.RB [ \-L | \-\-size
+.RB [ \-L | \-\-size ]
 .RI [ + | \- ] LogicalVolumeSize [ bBsSkKmMgGtTpPeE ]}
-.RB [ \-\-poolmetadatasize
+.RB [ \-\-poolmetadatasize ]
 .RI [ + ] MetadataVolumeSize [ bBsSkKmMgG ]
 .RB [ \-f | \-\-force ]
 .RB [ \-n | \-\-nofsck ]

--===============5240475330808798443==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Problems with lvcreate.8:

Unbalanced group in command synopsis. You probably forgot
to open or close a [ ] or { } group properly.

--- lvcreate.8-unpatched	2016-03-05 05:17:20.968968315 -0500
+++ lvcreate.8	2016-03-05 05:17:30.952935648 -0500
@@ -19,7 +19,7 @@
 .RB [ \-\-cachesettings
 .IR key=value ]
 .RB [ \-\-cachepool
-.IR CachePoolLogicalVolume { Name | Path }
+.IR CachePoolLogicalVolume { Name | Path } ]
 .RB [ \-c | \-\-chunksize
 .IR ChunkSize [ bBsSkKmMgG ]]
 .RB [ \-\-commandprofile
@@ -81,7 +81,7 @@
 .RI { ReadAheadSectors | auto | none }]
 .RB [ \-k | \-\-setactivationskip
 .RI { y | n }]
-.RB [ \-s | \-\-snapshot
+.RB [ \-s | \-\-snapshot ]
 .RB [ \-V | \-\-virtualsize
 .IR VirtualSize [ bBsSkKmMgGtTpPeE ]]
 .RB [ \-t | \-\-test ]
@@ -96,12 +96,12 @@
 .RB [ \-Z | \-\-zero
 .RI { y | n }]
 .RI [ VolumeGroup { Name | Path }
-.RI [/\{ ExternalOrigin
+.RI [{ ExternalOrigin
 |
 .I Origin
 |
 .IR Pool } LogicalVolumeName ]
-.RI [ PhysicalVolumePath [ :PE [ \-PE ]]...]
+.RI [ PhysicalVolumePath [ :PE [ \-PE ]]...]]
 
 .B lvcreate
 .RB [ \-l | \-\-extents

--===============5240475330808798443==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Problems with lvreduce.8:

Unbalanced group in command synopsis. You probably forgot
to open or close a [ ] or { } group properly.

--- lvreduce.8-unpatched	2016-02-29 05:58:16.401086143 -0500
+++ lvreduce.8	2016-02-29 06:00:39.252717531 -0500
@@ -16,7 +16,7 @@
 .RB [ \-\-noudevsync ]
 .RB { \-l | \-\-extents
 .RI [ \- ] LogicalExtentsNumber [ % { VG | LV | FREE | ORIGIN "}] |"
-.RB [ \-L | \-\-size
+.RB [ \-L | \-\-size ]
 .RI [ \- ] LogicalVolumeSize [ bBsSkKmMgGtTpPeE ]}
 .RB [ \-n | \-\-nofsck ]
 .RB [ \-r | \-\-resizefs ]

--===============5240475330808798443==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Problems with lvmconfig.8:

(Identical patches should apply to: lvm-config.8 lvm-dumpconfig.8)

Unbalanced group in command synopsis. You probably forgot
to open or close a [ ] or { } group properly.

--- lvmconfig.8-unpatched	2016-02-29 05:42:45.015495941 -0500
+++ lvmconfig.8	2016-02-29 05:42:52.519476477 -0500
@@ -6,7 +6,7 @@
 .RB [ \-f | \-\-file
 .IR filename ]
 .RB [ \-\-type
-.RI { current | default | diff | list | missing | new | profilable | profilable-command | profilable-metadata }
+.RI { current | default | diff | list | missing | new | profilable | profilable-command | profilable-metadata } ]
 .RB [ \-\-atversion
 .IR version ]
 .RB [ \-\-ignoreadvanced ]

--===============5240475330808798443==--
