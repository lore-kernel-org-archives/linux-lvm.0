Return-Path: <julien@atix.de>
Message-ID: <3B3B3AB9.C4A492D6@atix.de>
Date: Thu, 28 Jun 2001 16:10:01 +0200
From: Julien Baboud <julien@atix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] pb with activating VG after rebooting
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

in the world of bugs&errors:
i've obtained the following msg at kernel booting and with the vgscan
command :

%vgscan
vgscan -- reading all physical volumes (this may take a while...)
vgscan -- found active volume group "vg1"
vgscan -- found inactive volume group "vg2"
vgscan -- found inactive volume group "vg3"
vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d" successfully created
vgscan -- WARNING: This program does not do a VGDA backup of your volume
groups

and when i try to activate the inactive VGs, i get this :

%vgchange -a y vg2
vgchange -- ERROR "parameter error" setting up snapshot copy on write
exception table for "/dev/vg2/lv2_1_snap"

%vgchange -a y vg3
vgchange -- ERROR "parameter error" setting up snapshot copy on write
exception table for "/dev/vg3/lv3_1_snap"

what is the matter since the same operations have been doing on the 3 VG
(except that the 3rd VG was extended...) ?
and how to repare this ?

 julien4atix
