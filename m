Date: Wed, 5 Sep 2001 17:42:15 -0500 (EST)
From: John Marquart <jomarqua@indiana.edu>
Subject: Re: [linux-lvm] lvcreate segfaults
In-Reply-To: <20010905153703.A5914@sistina.com>
Message-ID: <Pine.A41.4.21.0109051740340.31142-100000@gigue.dlib.indiana.edu>
MIME-Version: 1.0
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Alas alas,
        This patch seemed to have changed the problem mroe then anything
else.
 
I am still getting segfaults - however this time in a different place.
 
(from gdb ./lvcreate w/ set args = rootvg -L4M -nfoo):
-----
Starting program: /usr/src/LVM/1.0.1-rc2/./tools/lvcreate rootvg -L4M
-nfoo
 
Program received signal SIGSEGV, Segmentation fault. lv_create (vg=0x4,
lv=0xbffffae4,
    lv_name=0xbffffaf8 "\023.Rt~A`z\217\003\021\034'") at
lv_create_remove.c:42
42      int lv_create ( vg_t *vg, lv_t *lv, char *lv_name) {     

-----

As far as I can tell - the only significant difference between this putput
and the pre-patched output - is that it is now int lv_create instead of
inline int lv_create.

If there is any other info I can provide - as always - please ask.

-j
