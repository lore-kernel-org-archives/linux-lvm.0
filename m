Return-Path: <torsten@pclab.ifg.uni-kiel.de>
Date: Sat, 16 Dec 2000 18:48:49 +0100
From: Torsten Landschoff <torsten@pclab.ifg.uni-kiel.de>
Message-ID: <20001216184849.A12569@pclab.ifg.uni-kiel.de>
Mime-Version: 1.0
Subject: [linux-lvm] Upgrade path from 0.8i to 0.9?
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

Hi *, 

We are planning to upgrade a production server tomorrow. As we have to 
build a new kernel anyway I would like to upgrade the LVM code from 0.8i
to 0.9. 

I just tried the same thing on a test system and I was unable to get it
working. After installing the new kernel I installed the lvm Debian
package from sistina.com (which removed /etc/lvmtab and /etc/lvmtab.d)
and tried to reactivate the volumes. This is what I get: 

pulsar:~# vgscan -v
vgscan -- removing "/etc/lvmtab" and "/etc/lvmtab.d"
vgscan -- reading all physical volumes (this may take a while...)
vgscan -- scanning for all active volume group(s) first
vgscan -- found inactive volume group "test"
vgscan -- reading data of volume group "test" from physical volume(s)
vgscan -- ERROR "vg_read_with_pv_and_lv(): allocated LE of LV" can't get data of volume group "test" from physical volume(s)
vgscan -- ERROR "vg_read_with_pv_and_lv(): allocated LE of LV" creating "/etc/lvmtab" and "/etc/lvmtab.d"

Is there a way to upgrade to LVM 0.9 or should I just reapply the old LVM 0.8i
patches to 2.2.18 (which works fine)?

Thanks

	Torsten
