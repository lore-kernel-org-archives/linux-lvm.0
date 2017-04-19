Received: from mx1.redhat.com (ext-mx03.extmail.prod.ext.phx2.redhat.com
	[10.5.110.27])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7FB9E189DB
	for <linux-lvm@redhat.com>; Wed, 19 Apr 2017 21:54:01 +0000 (UTC)
Received: from mail-yw0-f173.google.com (mail-yw0-f173.google.com
	[209.85.161.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 84335787F8
	for <linux-lvm@redhat.com>; Wed, 19 Apr 2017 21:54:00 +0000 (UTC)
Received: by mail-yw0-f173.google.com with SMTP id u70so25970784ywe.2
	for <linux-lvm@redhat.com>; Wed, 19 Apr 2017 14:54:00 -0700 (PDT)
MIME-Version: 1.0
From: Neutron Sharc <neutronsharc@gmail.com>
Date: Wed, 19 Apr 2017 14:53:19 -0700
Message-ID: <CAB-bdyR1cNqWzbvFxXqb1+HRcK7Kq0y5Jafj+yJXBdcutrbb0A@mail.gmail.com>
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] new multipath device mistakenly replaced another PV in
 existing volume group
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="utf-8"
To: linux-lvm@redhat.com

I'm seeing a strange problem (iscsi LUNs + multipath + lvm) that I
will walk through an example.

I have an iscsi target machine that exposes many iscsi LUNs. Iscsi
initiator logs in 4 iscsi LUNs (vol1_[0-4]),  creates a multipath
device for each LUN (/dev/mapper/vol1_[0-4]), and combines the 4
multipath devices into a volume group and LV (vol1/vol1_lv).

Then I log in another 4 iscsi LUNs (vol3_[0-3]), create a multipath
device for each new LUN (/dev/mapper/vol3_[0-3]).  Now there is a
strange thing:
some new multipath devices (/dev/mapper/vol3_0, /dev/mapper/vol3_2)
replaced existing PVs in vol1.  As a result, these new multipath
devices have open-count > 0, so I cannot pvcreate on them:

$ sudo dmsetup ls --tree
vol1-vol1_lv (252:4)
 ├─vol3_0 (252:9)   <==  fresh multipath device, should NOT be in vol1
 │  └─ (65:128)
 ├─vol3_2 (252:10)  <==  fresh multipath device, should NOT be in vol1
 │  └─ (65:144)
 ├─vol1_1 (252:1)
 │  └─ (65:48)
 └─vol1_0 (252:0)
    └─ (65:32)
vol1_3 (252:3)  <== was in vol1-vol1_lv, but was knocked out
 └─ (65:16)
vol1_2 (252:2)  <== was in vol1-vol1_lv, but was knocked out
 └─ (65:64)
vol3_3 (252:11)
 └─ (65:160)
vol3_1 (252:12)
 └─ (65:176)


Please note that all these vol3_[0-3] are fresh, without any LVM
metadata on them, as shown by pvscan::
sudo pvscan --cache /dev/mapper/vol3_0
  Incorrect metadata area header checksum on /dev/mapper/vol3_0 at offset 4096
  Incorrect metadata area header checksum on /dev/mapper/vol3_0 at offset 4096
  Incorrect metadata area header checksum on /dev/mapper/vol3_0@offset 4096


$ sudo pvcreate /dev/mapper/vol3_0   <== this multipath device was
mistakenly included into vol1

  Found duplicate PV 9F6vU9NVBfEq1w3e04T5UreO6fDVPJNy: using
/dev/mapper/vol1_3 not /dev/mapper/vol3_0
  Using duplicate PV /dev/mapper/vol1_3 without holders, replacing
/dev/mapper/vol3_0
  Can't open /dev/mapper/vol3_0 exclusively.  Mounted filesystem?


========== Configs I used:
BTW,  I have enabled lvmetad,  my lvm.conf has this:
filter = [ "a|/dev/mapper/.*|", "r|.*|" ]
global_filter = [ "a|/dev/mapper/.*|", "r|.*|" ]

My /etc/multipath.conf is:
defaults {
  user_friendly_names     yes
  path_grouping_policy    failover
  polling_interval        10
  path_selector           "round-robin 0"
  find_multipaths         yes
  features       "1 queue_if_no_path"
}
blacklist {
  devnode  "^sda[1-9]"
}
multipaths {
  multipath {
    wwid 360000000758757de9fb289cbde12abab
    alias vol1_0
  }
  // more devices
}

iscsi initiator is on centos 6.5, with pkgs version:
lvm2-2.02.143-12.el6.x86_64
device-mapper-multipath-0.4.9-100.el6.x86_64

iscsi target is tgtd on another Ubuntu machine.



Comments are appreciated.


-Shawn
