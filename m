Return-Path: <logix@t-online.de>
From: Robin Wenninger <logix@t-online.de>
Date: Sun, 15 Jul 2001 16:13:04 +0200
MIME-Version: 1.0
Message-Id: <01071516130400.01262@athlon>
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] im getting: ERROR "vg_read_with_pv_and_lv()
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
To: linux-lvm@sistina.com

hi all,
i have a problem with my lvm. i have changed my root distribution, after 
doing this, my lvm doesen't work anymore. i left the lvm-partitions 
untouched, and after installing the kernel-patch and the lvm-tools for me new 
distribution, i tried a vgscan to create a new lvmtab and a lvmtab.d. but i 
get a errormessage:

vgscan -- ERROR "vg_read_with_pv_and_lv(): allocated LE of LV" can't get data 
of volume group "vg01" from physical volume(s)
vgscan -- ERROR "vg_read_with_pv_and_lv(): allocated LE of LV" creating 
"/etc/lvmtab" and "/etc/lvmtab.d"
 
vgscan -- reading all physical volumes (this may take a while...)
vgscan -- found inactive volume group "vg01"

i dont know what do to

please help me

cu all

p.s. i created my lvm with the v0.8 from the lvm tools, now i try to vgscan 
with the v0.9, can this be the problem?
