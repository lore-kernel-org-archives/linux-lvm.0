Content-Disposition: inline
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
From: "marduk" <marduk@python.net>
Message-Id: <20031106123527.B08897F524@server2.messagingengine.com>
Subject: [linux-lvm] Help, /usr will not mount!
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
Date: Thu Nov  6 06:36:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

I just lost /usr.  Please someone tell me it can be restored.

The thing is, I am attempting to move my drives to another system.  My
two SCSI drives
are smaller and older and the new system has no SCSI adapter yet, so I
thought it best
to remove the two scsi drives from the volume group before moving the 2
IDEs to the new
box.  Here's what I did:

pvmove /dev/sda1

Well, pvmove gave me an error message (I can not remember the exact
message) and returned
me to the command prompt, so I assumed nothing was done.  Afterward, I
ran another,
non-destructive command (i think vgscan or something like that) and the
process just froze.
Since I was at the console in single-user mode and could not get back to
the shell, I
rebooted.  Well, on reboot the system could not mount my /usr or
/var/video (not important)
because the superblock could not be found.  Both partitions were logical
volumes.

It really sucks not having /usr as you can imagine. I've managed to get a
basic /usr working
that I copied from a CD onto my / partition (that's not a LVM volume).

Running  pvmove again, just gives me the same error as before.  Running
pvmove --abort freezes
again.  When I run ps after the pvmove --abort, I see the process status
for pvmove is D<L
but it doesn't appear to be doing anything (it's been "running" for over
6 hours now).

Please tell me I can get /usr (and /var/video) back and how.

--m
-- 
  
  marduk@letterboxes.org
