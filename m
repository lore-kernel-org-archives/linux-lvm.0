Received: from mx1.redhat.com (ext-mx05.extmail.prod.ext.phx2.redhat.com
	[10.5.110.9])
	by int-mx03.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id n8HGnmox014919
	for <linux-lvm@redhat.com>; Thu, 17 Sep 2009 12:49:48 -0400
Received: from g4t0017.houston.hp.com (g4t0017.houston.hp.com [15.201.24.20])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n8HGnbkQ010066
	for <linux-lvm@redhat.com>; Thu, 17 Sep 2009 12:49:37 -0400
Received: from g1t0038.austin.hp.com (g1t0038.austin.hp.com [16.236.32.44])
	by g4t0017.houston.hp.com (Postfix) with ESMTP id D84AE38097
	for <linux-lvm@redhat.com>; Thu, 17 Sep 2009 16:49:36 +0000 (UTC)
Received: from ldl (linux.corp.hp.com [15.11.146.101])
	by g1t0038.austin.hp.com (Postfix) with ESMTP id BB9BE30085
	for <linux-lvm@redhat.com>; Thu, 17 Sep 2009 16:49:36 +0000 (UTC)
Received: from localhost (ldl.fc.hp.com [127.0.0.1])
	by ldl (Postfix) with ESMTP id 94F5ECF001B
	for <linux-lvm@redhat.com>; Thu, 17 Sep 2009 10:49:36 -0600 (MDT)
Received: from ldl ([127.0.0.1])
	by localhost (ldl.fc.hp.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HvqEL9l3-ZAg for <linux-lvm@redhat.com>;
	Thu, 17 Sep 2009 10:49:36 -0600 (MDT)
Date: Thu, 17 Sep 2009 10:49:36 -0600
From: Matt Anderson <mra@hp.com>
Message-ID: <20090917164936.GA5767@ldl.fc.hp.com>
MIME-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] Stale NFS Handle on a system with no NFS mounts
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
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

My laptop battery was running low last night and Fedora started shutting down gracefully instead of just coming to a hard stop.  I was sitting right there so I was able to get a power plug connected to the system in time and the system did indeed stay up.  I used my system a while longer and then shut down for the night.  This morning when I powered it back on the system wouldn't boot.  Turning off rhgb I saw the system was complaining about not being able to access /lib/libdbus-1.so.3 giving an error 116.

Booting into single user mode I ran `ls -l /lib/libdbus-1*` and got the following output
ls: cannot access /lib/libdbus-1.so.3: Stale NFS file handle
lrwxrwxrwx. 1 root root     23 2009-09-17 08:23 /lib/libdbus-1.so -> /lib/libdbus-1.so.3.4.0
-rwxr-xr-x. 1 root root 261756 2009-06-27 19:14 /lib/libdbus-1.so.3.4.0

I tried to remake the symlink to libdbus-1.so.3 but ln was not able to access the file either.  Another thing I tried was booting into another linux install that I have on this computer and running fsck from there.  That yeilded no errors or warnings and the issue still persists.

A couple of forum posts led me to suspect that LVM may be involved with this somehow, but I didn't see anything when I searched this list's archives.  My system is a fairly standard Fedora 11 x86 install, everything is on one ext3 LVM partition except for /boot.  I have prepared an lvmdump archive if anyone is interested in seeing it.

So what do you think?  Is this an LVM thing, or am I barking up the wrong tree?

thanks
-matt
