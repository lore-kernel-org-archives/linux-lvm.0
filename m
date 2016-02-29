Received: from mx1.redhat.com (ext-mx06.extmail.prod.ext.phx2.redhat.com
	[10.5.110.30])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u1TBwo02011080
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Mon, 29 Feb 2016 06:58:50 -0500
Received: from snark.thyrsus.com (static-71-162-243-5.phlapa.fios.verizon.net
	[71.162.243.5]) by mx1.redhat.com (Postfix) with ESMTPS id 62751486A4
	for <linux-lvm@redhat.com>; Mon, 29 Feb 2016 11:58:49 +0000 (UTC)
Received: from [127.0.1.1] (localhost [127.0.0.1])
	by snark.thyrsus.com (Postfix) with ESMTP id 9E11613A0E65
	for <linux-lvm@redhat.com>; Mon, 29 Feb 2016 06:49:49 -0500 (EST)
Content-Type: multipart/mixed; boundary="===============3116929345104549197=="
MIME-Version: 1.0
Message-Id: <20160229114949.9E11613A0E65@snark.thyrsus.com>
Date: Mon, 29 Feb 2016 06:49:49 -0500 (EST)
From: esr@thyrsus.com
Subject: [linux-lvm] Problems in lvmconfig.8, lvm-dumpconfig.8, lvreduce.8,
 lvresize.8, vgchange.8
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

--===============3116929345104549197==
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

--===============3116929345104549197==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Problems with lvreduce.8:

Unbalanced group in command synopis. You probably forgot
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

--===============3116929345104549197==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Problems with lvresize.8:

Unbalanced group in command synopis. You probably forgot
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

--===============3116929345104549197==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Problems with lvmconfig.8:

(Identical patches should apply to: lvm-dumpconfig.8)

Unbalanced group in command synopis. You probably forgot
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

--===============3116929345104549197==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Problems with vgchange.8:

Invalid option format - cannot have optional prefix in token,
it confuses anything trying to do syntactic parsing.

--- vgchange.8-unpatched	2016-02-29 06:18:37.129937328 -0500
+++ vgchange.8	2016-02-29 06:24:27.177036131 -0500
@@ -40,7 +40,7 @@
 .IR MaxPhysicalVolumes ]
 .RB [ \-\-metadataprofile
 .IR ProfileName ]
-.RB [ \-\- [ vg ] metadatacopies ]
+.RB [ \-\-vgmetadatacopies
 .IR NumberOfCopies | unmanaged | all ]
 .RB [ \-P | \-\-partial ]
 .RB [ \-s | \-\-physicalextentsize
@@ -234,7 +234,7 @@
 in the volume group unless the logical volume itself has its own profile
 attached. See \fBlvm.conf\fP(5) for more information about \fBmetadata profiles\fP.
 .TP
-.BR \-\- [ vg ] metadatacopies " " \fINumberOfCopies | \fIunmanaged | \fIall
+.BR \-\- vgmetadatacopies " " \fINumberOfCopies | \fIunmanaged | \fIall
 Sets the desired number of metadata copies in the volume group.  If set to
 a non-zero value, LVM will automatically manage the 'metadataignore'
 flags on the physical volumes (see \fBpvchange\fP or \fBpvcreate \-\-metadataignore\fP) in order

--===============3116929345104549197==--
