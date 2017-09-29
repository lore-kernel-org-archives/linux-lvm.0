Received: from mx1.redhat.com (ext-mx08.extmail.prod.ext.phx2.redhat.com
	[10.5.110.32])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8977E7F47A
	for <linux-lvm@redhat.com>; Fri, 29 Sep 2017 16:43:13 +0000 (UTC)
Received: from mail-wr0-f198.google.com (mail-wr0-f198.google.com
	[209.85.128.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id BB6F6C0587C1
	for <linux-lvm@redhat.com>; Fri, 29 Sep 2017 16:43:12 +0000 (UTC)
Received: by mail-wr0-f198.google.com with SMTP id h16so128256wrf.0
	for <linux-lvm@redhat.com>; Fri, 29 Sep 2017 09:43:12 -0700 (PDT)
MIME-Version: 1.0
From: Jan Tulak <jtulak@redhat.com>
Date: Fri, 29 Sep 2017 18:42:49 +0200
Message-ID: <CACj3i71bvspO5H_h8s=XBnDzRBvJwdL=Q18_4dvy+C7-ktdirw@mail.gmail.com>
Subject: [linux-lvm] Difference between Debian and some other distributions
	with thin provisioning
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

Hi guys,
I found out this difference and I'm not sure what is the cause. A
command for creating a thin LV, which works on Archlinux, Centos and
Fedora, fails on Debian and Ubuntu:

lvm lvcreate FOOvg1 \
    -T \
    -l 100%PVS \
    -n FOOvg1_thin001 \
    /dev/loop0 /dev/loop1 /dev/loop2

When it is created, lvs shows attributes "twi-a-tz--". But Debian and
Ubuntu complain that  "--name may only be given when creating a new
thin Logical volume or snapshot," even though the command states it
should be thin with -T. A script that tests this issue is at the end
of this email

Do you know if there is a reason for this different behaviour?
Versions seem to be close enough for it not to be a change in LVM
behaviour, so I suspect some downstream or configuration changes. All
tested distributions were run in their current stable versions, up to
date. For example:

Debian:
# cat /etc/debian_version
8.9
# lvm version
  LVM version:     2.02.111(2) (2014-09-01)
  Library version: 1.02.90 (2014-09-01)
  Driver version:  4.27.0

Centos:
# cat /etc/redhat-release
CentOS Linux release 7.4.1708 (Core)
# lvm version
  LVM version:     2.02.171(2)-RHEL7 (2017-05-03)
  Library version: 1.02.140-RHEL7 (2017-05-03)
  Driver version:  4.35.0

Thanks,
Jan

-------


#!/usr/bin/env bash

# Test how the current distribution behaves when creating a thin LV.
# Centos, Fedora and Archlinux pass the test,
# but Debian and Ubuntu do not.

if [ $(whoami) != "root" ]; then
    echo "Need to be root!"
    exit 1
fi

if [ $(losetup -a |wc -l) -ne 0 ]; then
    echo "Some loopback devices are already there."
    echo "I don't want to screw up anything and it is not worth of making"
    echo "any autodetection, so I will just stop now."
    exit 1
fi

echo "setting up"

# create files for loop devices
dd if=/dev/zero bs=1M count=150 of=/tmp/0 &>/dev/null
dd if=/dev/zero bs=1M count=150 of=/tmp/1 &>/dev/null
dd if=/dev/zero bs=1M count=150 of=/tmp/2 &>/dev/null

# create loop devices
losetup -f /tmp/0 >/dev/null
losetup -f /tmp/1 >/dev/null
losetup -f /tmp/2 >/dev/null

# create PVs
pvcreate /dev/loop0 >/dev/null
pvcreate /dev/loop1 >/dev/null
pvcreate /dev/loop2 >/dev/null

# create VG
vgcreate FOOvg1 /dev/loop0 /dev/loop1 /dev/loop2 >/dev/null

# create thin lv
echo "running the test:"
echo "lvm lvcreate FOOvg1 \\
    -T \\
    -l 100%PVS \\
    -n FOOvg1_thin001 \\
    /dev/loop0 /dev/loop1 /dev/loop2"
echo ""



######### THIS IS THE COMMAND

lvm lvcreate FOOvg1 \
    -T \
    -l 100%PVS \
    -n FOOvg1_thin001 \
    /dev/loop0 /dev/loop1 /dev/loop2





# test if it worked - if yes, lvs will see the LV with thin attr
echo ""
if [ $(lvs | grep "FOOvg1_thin001" | grep -c "twi-a-tz--") -eq 1 ]; then
    echo "result: it works"
else
    echo "result: it doesn't work"
fi

# ---
# just cleanup

echo "Cleaning up..."

yes | lvremove  FOOvg1/FOOvg1_thin001 &>/dev/null
vgremove FOOvg1 >/dev/null
pvremove /dev/loop0 >/dev/null
pvremove /dev/loop1 >/dev/null
pvremove /dev/loop2 >/dev/null

losetup -d /dev/loop0 >/dev/null
losetup -d /dev/loop1 >/dev/null
losetup -d /dev/loop2 >/dev/null
