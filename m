Date: Mon, 28 Sep 2009 13:11:53 +0100
From: Alasdair G Kergon <agk@redhat.com>
Message-ID: <20090928121153.GB5351@agk-dp.fab.redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] FW: [lvm-devel] [PATCH 1/3] use display_size function
	instead of hardcoding
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com
Cc: Daniel Mierswa <impulze@impulze.org>

----- Forwarded message from Daniel Mierswa <impulze@impulze.org> -----

We should use display_size everywhere for consistency reasons. Other
commands and places that print the stripe/PE size already do that.
This might break scripts that rely on the stripe/PE size being printed
in KByte in those circumstances.

----- End forwarded message -----

Specifically this changes the following:

  1) The 'PE Size' line of 'pvdisplay -v'.

  2) The 'Stripe size' line of a striped segment in 'lvdisplay --maps'.

With this patch, these lines will now be controlled by --units and --nosuffix
etc.

If you have scripts that parse this output, now would be a good time to
switch to the column-based output by adding --columns or using 'pvs -o
vg_extent_size' or 'lvs -o stripesize'.

-    Stripe size		64 KB
+    Stripe size		64.00 KB
 
-  PE Size (KByte)       4096
+  PE Size               4.00 MB
 
Alasdair
