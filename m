Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m2MMDIdN014306
	for <linux-lvm@redhat.com>; Sat, 22 Mar 2008 18:13:18 -0400
Received: from calliope.caktusgroup.com (calliope.caktusgroup.com [208.1.62.2])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m2MMCjij022432
	for <linux-lvm@redhat.com>; Sat, 22 Mar 2008 18:12:45 -0400
Received: from [192.168.1.110] (cpe-069-134-226-227.nc.res.rr.com
	[69.134.226.227]) (Authenticated sender: tobias)
	by calliope.caktusgroup.com (Postfix) with ESMTP id 9AEAB5DDCC
	for <linux-lvm@redhat.com>; Sat, 22 Mar 2008 18:12:44 -0400 (EDT)
Message-ID: <47E5845B.60908@caktusgroup.com>
Date: Sat, 22 Mar 2008 18:12:43 -0400
From: Tobias McNulty <tobias@caktusgroup.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="------------020003000505000703020801"
Subject: [linux-lvm] kernel panic when running lvm commands
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
To: linux-lvm@redhat.com

This is a multi-part message in MIME format.
--------------020003000505000703020801
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

I'm running a freshly installed and completely up-to-date Debian etch
system.  I just installed the "lvm2" and "lvm-common" packages.

Now I'm trying to run "pvcreate" on a physical volume, but the command
segfaults and I get a kernel panic.  See attached file or:

http://erato.caktusgroup.com/~tobias/lvm-kernel-panic.txt

I've tried this on both a regular disk (/dev/hdb) and a Linux MD device
(/dev/md1) with the same results.

Any suggestions?

Thanks,
Tobias
-- 
Tobias McNulty
Caktus Consulting Group, LLC
P.O. Box 1454
Carrboro, NC 27510
(919) 951-0052
http://www.caktusgroup.com

--------------020003000505000703020801
Content-Type: text/plain;
 name="lvm-kernel-panic.txt"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline;
 filename="lvm-kernel-panic.txt"

 <1>BUG: unable to handle kernel paging request at virtual address 748bdb=
41
 printing eip:
e083e09a
*pde =3D 00000000
Oops: 0000 [#14]
SMP=20
Modules linked in: raid1 nls_iso8859_1 nls_cp437 vfat fat xfs ip6table_fi=
lter ip6_tables tun button ac battery ipv6 iptable_raw xt_policy xt_multi=
port ipt_ULOG ipt_TTL ipt_ttl ipt_TOS ipt_tos ipt_TCPMSS ipt_SAME ipt_REJ=
ECT ipt_REDIRECT ipt_recent ipt_owner ipt_NETMAP ipt_MASQUERADE ipt_LOG i=
pt_iprange ipt_hashlimit ipt_ECN ipt_ecn ipt_DSCP ipt_dscp ipt_CLUSTERIP =
ipt_ah ipt_addrtype ip_nat_tftp ip_nat_snmp_basic ip_nat_pptp ip_nat_irc =
ip_nat_ftp ip_nat_amanda ip_conntrack_tftp ip_conntrack_pptp ip_conntrack=
_netbios_ns ip_conntrack_irc ip_conntrack_ftp ts_kmp ip_conntrack_amanda =
xt_tcpmss xt_pkttype xt_physdev bridge xt_NFQUEUE xt_MARK xt_mark xt_mac =
xt_limit xt_length xt_helper xt_dccp xt_conntrack xt_CONNMARK xt_connmark=
 xt_CLASSIFY xt_tcpudp xt_state iptable_nat ip_nat ip_conntrack iptable_m=
angle nfnetlink iptable_filter ip_tables x_tables dm_snapshot dm_mirror d=
m_mod loop snd_intel8x0 snd_ac97_codec snd_ac97_bus snd_pcm snd_timer snd=
 snd_page_alloc psmouse serio_raw i2c_i801 i810_audio ac97_codec i2c_core=
 shpchp pci_hotplug soundcore intel_agp agpgart parport_pc parport rtc ev=
dev intel_rng floppy pcspkr ext3 jbd mbcache linear md_mod ide_disk 3c59x=
 mii uhci_hcd usbcore piix generic ide_core thermal processor fan
CPU:    0
EIP:    0060:[<e083e09a>]    Not tainted VLI
EFLAGS: 00010246   (2.6.18-6-686 #1)=20
EIP is at linear_mergeable_bvec+0x9a/0x10b [linear]
eax: dfbd3ba0   ebx: 748bdb31   ecx: 00000000   edx: 0001f5a0
esi: d5c523a0   edi: 00000000   ebp: 00000000   esp: cd0f7d54
ds: 007b   es: 007b   ss: 0068
Process pvdisplay (pid: 23061, ti=3Dcd0f6000 task=3Dd57ba000 task.ti=3Dcd=
0f6000)
Stack: 0003eb40 00000000 0003eb40 dfe7f770 0007d680 00000000 0003eb40 000=
00000=20
       00000000 00000000 dfe7f770 cc8f82c0 e083e000 dfb20c00 c015e9be cc8=
f82c0=20
       c1203e40 cd0f7f80 cda7d600 c015ea62 00001000 00000000 000000ff cda=
7d600=20
Call Trace:
 [<e083e000>] linear_mergeable_bvec+0x0/0x10b [linear]
 [<c015e9be>] __bio_add_page+0xe6/0x165
 [<c015ea62>] bio_add_page+0x25/0x2b
 [<c0178758>] dio_bio_add_page+0x1c/0x73
 [<c0178863>] dio_send_cur_page+0x57/0x96
 [<c01793c1>] __blockdev_direct_IO+0x9c2/0xd51
 [<c0165370>] do_lookup+0x4f/0x135
 [<c0171386>] mntput_no_expire+0x11/0x6a
 [<c01674fe>] link_path_walk+0xb3/0xbd
 [<c01611c3>] blkdev_direct_IO+0x2d/0x32
 [<c01610e3>] blkdev_get_blocks+0x0/0xb3
 [<c0142577>] generic_file_direct_IO+0x93/0xd7
 [<c01427f5>] __generic_file_aio_read+0xd6/0x1b2
 [<c0166385>] may_open+0x5a/0x203
 [<c01437b7>] generic_file_read+0x0/0xab
 [<c014384e>] generic_file_read+0x97/0xab
 [<c012d92d>] autoremove_wake_function+0x0/0x2d
 [<c01602e6>] block_llseek+0xb3/0xbf
 [<c015a6f8>] vfs_read+0x9f/0x141
 [<c015ab44>] sys_read+0x3c/0x63
 [<c0102c11>] sysenter_past_esp+0x56/0x79
Code: 24 04 89 d1 31 d2 85 c9 89 44 24 08 74 08 89 c8 31 d2 f7 f3 89 c1 8=
b 44 24 08 f7 f3 89 ca 89 c2 8b 46 04 8b 1c 90 eb 03 83 c3 14 <8b> 53 10 =
8b 43 0c 8b 73 04 8b 7b 08 89 d1 89 54 24 24 89 c2 01=20
EIP: [<e083e09a>] linear_mergeable_bvec+0x9a/0x10b [linear] SS:ESP 0068:c=
d0f7d54
=20

--------------020003000505000703020801--
