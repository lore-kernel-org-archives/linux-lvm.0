Message-ID: <OF05C6CA97.9049849B-ON86256C0D.0071EC23@TEXASMUTUAL.COM>
From: "Jonathan S. Polacheck" <JPolache@texasmutual.com>
MIME-Version: 1.0
Subject: [linux-lvm] ext2resize error
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
Date: Tue Aug  6 15:54:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

I have a Mandrake Linux 8.1 system with a 2.4.8 kernel.  My logical volumes
include /usr, /var and /home (not / or /boot).  I originally set up all
lv(s) as ext3, which seemed to preclude the ext2_online patch.  My
/dev/sys/usr lv shows 2.44 gig in lvdisplay.  My one PV shows 3616 free
PEs.  df shows /usr to be 2,015,824 (k) and 96% utilized.  I run telinit 1
then umount -a.  /usr unmounts.  I then run ext2resize /dev/sys/usr.  It
returns "Your filesystem is too occupied to resize it to 16000 bytes."

Any suggestions?
