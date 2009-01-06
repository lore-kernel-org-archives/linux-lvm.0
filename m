Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n064k21q032001
	for <linux-lvm@redhat.com>; Mon, 5 Jan 2009 23:46:02 -0500
Received: from mo-p00-ob.rzone.de (mo-p00-ob.rzone.de [81.169.146.161])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id n064jlda020904
	for <linux-lvm@redhat.com>; Mon, 5 Jan 2009 23:45:47 -0500
Received: from [192.168.255.107] (p57916731.dip.t-dialin.net [87.145.103.49])
	by post.strato.de (klopstock mo7) (RZmta 18.7)
	with ESMTP id 603539l061HpSe for <linux-lvm@redhat.com>;
	Tue, 6 Jan 2009 05:45:46 +0100 (MET)
From: Ralf Sparr <lvm@soulsweeper.org>
Date: Tue, 06 Jan 2009 05:45:44 +0100
Message-Id: <1231217144.7947.19.camel@fraws70-gentoo>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] pvcreate & vgcfgrestore won't work
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
To: linux-lvm@redhat.com

Hi list,

as mentioned in my earlier post, LVM complains about
"Incorrect metadata area header checksum". As this occurs
often (many questions, rarely answers in the list) I tried to create
some 'new' via

# pvcreate --force --uuid 7vFXd3-MYnt-TVdG-luYr-rDPn-o8a1-vjewWk
--restorefile /etc/lvm/archive/alice_00038.vg alice
  Incorrect metadata area header checksum
  uuid 7vFXd3-MYnt-TVdG-luYr-rDPn-o8a1-vjewWk already in use on
"/dev/loop53"

--> also '-ff' doesn't do the trick

# pvscan -vvv
        Processing: pvscan -vvv
        O_DIRECT will be used
      Setting global/locking_type to 1
      File-based locking selected.
      Setting global/locking_dir to /var/lock/lvm
      Locking /var/lock/lvm/P_global WB
    Wiping cache of LVM-capable devices
[...]
    Wiping internal VG cache
        lvmcache: initialised VG #orphans_lvm1
        lvmcache: initialised VG #orphans_pool
        lvmcache: initialised VG #orphans_lvm2
    Walking through all physical volumes
        /dev/hda: Skipping (regex)
[...]
      /dev/loop53: size is 13674639104 sectors
        Closed /dev/loop53
      /dev/loop53: size is 13674639104 sectors
        Opened /dev/loop53 RW O_DIRECT
        /dev/loop53: block size is 4096 bytes
        Closed /dev/loop53
        Using /dev/loop53
        Opened /dev/loop53 RW O_DIRECT
        /dev/loop53: block size is 4096 bytes
      /dev/loop53: lvm2 label detected
        lvmcache: /dev/loop53: now in VG #orphans_lvm2 (#orphans_lvm2)
        /dev/loop53: Found metadata at 49152 size 3734 (in area at 4096
size 192512) for alice (xIDosE-M2TQ-l9oj-PyAU-BZHY-XgV2-ZeasFv)
        lvmcache: /dev/loop53: now in VG alice
        lvmcache: /dev/loop53: setting alice VGID to
xIDosEM2TQl9ojPyAUBZHYXgV2ZeasFv
        lvmcache: /dev/loop53: VG alice: Set creation host to
xen-master.
  Incorrect metadata area header checksum
        Closed /dev/loop53
        Opened /dev/loop54 RO
[...]
        Using cached label for /dev/loop53
        Opened /dev/loop53 RW O_DIRECT
        /dev/loop53: block size is 4096 bytes
        Using cached label for /dev/loop53
        Read alice metadata (19) from /dev/loop53 at 49152 size 3734
        Closed /dev/loop53
        Opened /dev/loop53 RW O_DIRECT
        /dev/loop53: block size is 4096 bytes
  Incorrect metadata area header checksum
        Closed /dev/loop53
        /dev/loop53 0:      0 1048576: alice_storage_data(0:0)
        /dev/loop53 1: 1048576   2560: alice_storage(0:0)
        /dev/loop53 2: 1051136   2560: alice_fuppes(0:0)
        /dev/loop53 3: 1053696   2560: alice_game(0:0)
        /dev/loop53 4: 1056256   2560: alice_openvpn(0:0)
        /dev/loop53 5: 1058816   2560: alice_primary(0:0)
        /dev/loop53 6: 1061376  12800: alice_apache(0:0)
        /dev/loop53 7: 1074176  12800: alice_xen(0:0)
        /dev/loop53 8: 1086976  51200: alice_game_data(0:0)
        /dev/loop53 9: 1138176  25600: alice_xp(0:0)
        /dev/loop53 10: 1163776   5120: alice_x264(0:0)
        /dev/loop53 11: 1168896   2560: alice_firewall(0:0)
        /dev/loop53 12: 1171456 393216: alice_storage_data(1048576:0)
        /dev/loop53 13: 1564672 104595: NULL(0:0)
  WARNING: Volume Group alice is not consistent
  PV /dev/loop53   VG alice   lvm2 [6.37 TB / 408.57 GB free]
  Total: 1 [376.57 GB] / in use: 1 [376.57 GB] / in no VG: 0 [0   ]
      Unlocking /var/lock/lvm/P_global

-> I think 'Total' is messed up, there 6TB missing :(


Is there anything I can do to recover my data? Any  clue is very
welcome!

Ralf
