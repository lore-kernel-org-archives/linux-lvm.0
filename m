Message-ID: <E6FD503F6B73D31192DB0008C7E6346407E1AF13@pinemail1.phs.org>
From: CLeon@phs.org
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] flascopy lvm
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
Date: Fri Oct 10 08:15:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

We have our SAN disk attached to our Linux Red Hat 7.3 server and we are
using LVM.  We are using a flashcopy utility to flash the drives.  After we
flash the drives, we attach the flashed luns to the host.  When we do this,
the logical volume has the flashed drive in it's volume list (vgdisplay -v).
How can I prevent the this from happening?  I would like to mount the
flashed volume as a different logical volume name.

Thanks,
Cynthia Leon

==============================================================================
--- PRESBYTERIAN HEALTHCARE SERVICES DISCLAIMER ---

This message originates from Presbyterian Healthcare Services or one of its
affiliated organizations. It contains information, which may be confidential
or privileged, and is intended only for the individual or entity named above.
It is prohibited for anyone else to disclose, copy, distribute or use the
contents of this message. All personal messages express views solely of the
sender, which are not to be attributed to Presbyterian Healthcare Services or
any of its affiliated organizations, and may not be distributed without this
disclaimer. If you received this message in error, please notify us
immediately at postmaster@phs.org. 
==============================================================================
