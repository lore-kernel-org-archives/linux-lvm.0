Return-Path: <jdehaan@home.com>
From: "Jonathan DeHaan" <jdehaan@home.com>
Date: Wed, 4 Apr 2001 10:42:14 -0400
Message-ID: <005c01c0bd15$707ee0a0$0400a8c0@ci696011a.lxintn1.ky.home.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] vgscan -- no volume groups found
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

Please forgive an LVM newbie who has not kept sufficient backups. If at all
possible, I would like to keep my data intact.

Having successfully installed LVM on /dev/md0 (sd[ab]1) including root on
LVM, I was finally ready to kill my online backup on /dev/hda6. I pvcreated
it, vgextended it, and lvextended an lv that needed more room. When I
rebooted, however, vgscan cannot find my vg. I am using kernel 2.4.2 and
0.9.1_beta5.

I downloaded beta6 tools and created a separate initrd on another machine
that gives me a bash prompt, but vgscan now complains of invalid i/o
protocol v. 11. I did try the UUID trick found in the mailing list archives,
and I have verified that both my PV's have the correct list of UUIDs in
order, but beta5 vgscan still complains of no volume groups found.

Does anyone know how to build /etc/lvmtab and /etc/lvmtab.d/* manually, so
that I can get back into my normal root volume? And how can I fix my VGDA so
that vgscan can use it?

Yours in Need,
jdehaan@home.com
