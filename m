Received: from mx1.redhat.com (ext-mx05.extmail.prod.ext.phx2.redhat.com
	[10.5.110.9])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p0R9cECt014764
	for <linux-lvm@redhat.com>; Thu, 27 Jan 2011 04:38:14 -0500
Received: from pyxis.localdomain (pyxis.rymdraket.net [193.138.217.101])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id p0R9c2rU016021
	for <linux-lvm@redhat.com>; Thu, 27 Jan 2011 04:38:03 -0500
Received: from localhost (localhost [127.0.0.1])
	by pyxis.localdomain (Postfix) with ESMTP id 8AAF5CEEBE
	for <linux-lvm@redhat.com>; Thu, 27 Jan 2011 10:38:01 +0100 (CET)
Received: from pyxis.localdomain ([127.0.0.1])
	by localhost (pyxis.rymdraket.net [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xHQCeLrIQzCH for <linux-lvm@redhat.com>;
	Thu, 27 Jan 2011 10:37:45 +0100 (CET)
Received: from webmail.rymdraket.net (brenik.rymdraket.net [193.138.217.102])
	(Authenticated sender: xake@rymdraket.net)
	by pyxis.localdomain (Postfix) with ESMTPA id 63A4FCEEBC
	for <linux-lvm@redhat.com>; Thu, 27 Jan 2011 10:37:17 +0100 (CET)
Message-ID: <061e0b45500b99a3f38b4bfa88a9a591.squirrel@webmail.rymdraket.net>
Date: Thu, 27 Jan 2011 10:37:17 +0100
From: xake@rymdraket.net
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] lvm, config and commandline
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
To: linux-lvm@redhat.com

I have a system with a script at bootup currently running something like
"lvm pvscan && lvm vgscan && lvm vgchange -ay" all with the option
"--config 'global { locking_dir = "/dev/.lvm" }'" since when the script
runs /var/lock is not in a writeable state. --ignorelockingfailures is
fine, but gives a message on stderr I do not want, but I still want to get
other error messages so "2>/dev/null" is not an option.

I realized however that if I run this as a script using lvm as interpreter
(running lvm once and the commands inside of lvm) I cut the time for this
script in half.

But with that I have the following problem:

# echo "pvscan --config 'global { locking_dir = "/dev/.lvm" }'" | lvm
/dev/stdin
lvm> pvscan --config 'global { locking_dir = /dev/.lvm }'
  Parse error at byte 1 (line 1): unexpected token
  Failed to set overridden configuration entries.


I want this:
# lvm pvscan --config 'global { locking_dir = "/dev/.lvm" }'
  PV /dev/sde1      VG lillen-home   lvm2 [698,63 GiB / 0    free]
  PV /dev/md126p1   VG lillen        lvm2 [596,18 GiB / 27,18 GiB free]
  Total: 2 [1,26 TiB] / in use: 2 [1,26 TiB] / in no VG: 0 [0   ]


So how do I pass --config inside of lvm and still have it able to parse it?
Also, would it not also make sens to have --config an option working
directly on lvm (something like "lvm --config "something" <command>)?
