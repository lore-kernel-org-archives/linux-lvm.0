Message-ID: <38A338A3.13861967@moose.net>
Date: Thu, 10 Feb 2000 17:16:03 -0500
From: Brian Kress <kressb@moose.net>
MIME-Version: 1.0
Subject: [linux-lvm] Patch to 2.3.40
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@msede.com

Hi all,
	
	I'm curious.  Why does the 2.3.40 patch to 
Configure.help for LVM mess with sound drivers?

-Generic OPL2/OPL3 FM synthesizer support
-CONFIG_SOUND_ADLIB
-  Answer Y if your card has a FM chip made by Yamaha (OPL2/OPL3/OPL4).
-  Answering Y is usually a safe and recommended choice, however some
-  cards may have software (TSR) FM emulation. Enabling FM support with
-  these cards may cause trouble (I don't currently know of any such
-  cards, however).
-
-  Please read the file Documentation/sound/OPL3 if your card has an
-  OPL3 chip.
-
-  If unsure, say Y.
-
-

-  Answer Y here, unless you know you will not need the option.
+  Answer Y if your card has a FM chip made by Yamaha (OPL2/OPL3/OPL4).
+  Answering Y is usually a safe and recommended choice, however some
+  cards may have software (TSR) FM emulation. Enabling FM support with
+  these cards may cause trouble (I don't currently know of any such
+  cards, however).
+  Please read the file Documentation/sound/OPL3 if your card has an
+  OPL3 chip.

+  If unsure, say Y.
+
