Date: Tue, 16 May 2000 01:43:09 +0100 (IST)
From: Paul Jakma <paul@clubi.ie>
Subject: Re: [linux-lvm] How can activate the LVM in start (fwd)
Message-ID: <Pine.LNX.4.21.0005160142010.1987-100000@fogarty.spin.ie>
MIME-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linux LVM list <linux-lvm@msede.com>

the rc.sysinit stuff got stripped from my last message. here it is
again, minus a few square brackets and hash symbols.

---------- Forwarded message ----------
Date: Tue, 16 May 2000 00:58:38 +0100 (IST)
From: Paul Jakma <paul@clubi.ie>
To: Eric M. Hopper <hopper@omnifarious.mn.org>
Cc: Patrick Boutilier <boutilpj@ednet.ns.ca>, linux-lvm@msede.com
Subject: Re: [linux-lvm] How can activate the LVM in start

On Mon, 15 May 2000, Eric M. Hopper wrote:

  	That's all fine and good, but where in rc.sysinit?  I tried
  putting it just before the root filesystems are mounted read/write, and
  that didn't seem to work.

procfs must be mounted, and /etc must be rw. i have it as:


# Remount the root filesystem read-write.
action "Remounting root filesystem in read-write mode" mount -n -o remount,rw /

## LVM
#scan for VGs and create /dev entries.
if [ -x /sbin/vgscan -a -f /proc/lvm ]; then
       action "LVM: Scanning for Volume Groups" /sbin/vgscan
fi
#activate all VGs
if [ -x /sbin/vgchange -a -f /proc/lvm ]; then
       action "LVM: Activating Volume Groups" /sbin/vgchange -ay
fi
## End LVM

  
regards,
-- 
Paul Jakma	paul@clubi.ie
PGP5 key: http://www.clubi.ie/jakma/publickey.txt
-------------------------------------------
Fortune:
It is difficult to legislate morality in the absence of moral legislators.
