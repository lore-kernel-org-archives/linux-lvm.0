Date: Mon, 8 Oct 2001 16:00:13 +0200
From: Wichert Akkerman <wichert@cistron.nl>
Message-ID: <20011008160013.A26865@cistron.nl>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] kernel reports vg twice
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

Since I got exactly no response to this I'll report it with a
different subject.

LVM still does not work for me on one of my machines work:

cloud:/dev/discs/disc1# vgscan
vgscan -- reading all physical volumes (this may take a while...)
vgscan -- found active volume group "vg_user"
vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d" successfully created
vgscan -- WARNING: This program does not do a VGDA backup of your volume group

cloud:/dev/discs/disc1# vgchange -a y
vgchange -- ERROR: VGDA in kernel and lvmtab are NOT consistent; please run vgscan

I did a bit of looking around and it seems the confusement is in the
kernel: when lvm_check_kernel_lvmtab_consistency() compares the kernel
and the lvmtab entries the list from the kernel mentions the vg_user
volume group twice, while the lvmtab only mentions it once. This
results in an immediate abort and as a result I can't do anything
with the LVM tools.

Wichert.

-- 
  _________________________________________________________________
 /       Nothing is fool-proof to a sufficiently talented fool     \
| wichert@wiggy.net                   http://www.liacs.nl/~wichert/ |
| 1024D/2FA3BC2D 576E 100B 518D 2F16 36B0  2805 3CB8 9250 2FA3 BC2D |

_______________________________________________
linux-lvm mailing list
linux-lvm@sistina.com
http://lists.sistina.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html


----- End forwarded message -----

-- 
  _________________________________________________________________
 /       Nothing is fool-proof to a sufficiently talented fool     \
| wichert@wiggy.net                   http://www.liacs.nl/~wichert/ |
| 1024D/2FA3BC2D 576E 100B 518D 2F16 36B0  2805 3CB8 9250 2FA3 BC2D |
