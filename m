From: Peder O. Klingenberg <peder@klingenberg.no>
Message-ID: <ujur86u631z.fsf@nfsd.linpro.no>
MIME-Version: 1.0
Subject: [linux-lvm] Reconstructing missing volume groups (LVM2)
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
Date: Mon May 19 16:26:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Hi.

I'm hoping you can help me with a little problem.

I have a box with Debian Sarge, kernel 2.4.19+device mapper patch
compiled in (not a module), and lvm2. / is an ordinary partition,
/home, /usr, /var and /mm are logical volumes, all in the same volume
group.  There is only one physical disk, but it's partitioned, giving
lvm2 3 physical volumes.  The filesystem is ext3 on all volumes.

A dist-upgrade in early May installed new versions of glibc as well as
the lvm2 tools.  --version on pvscan and vgchange after the upgrade
now reports
"
LVM version:     1.95.15 ((2003-01-10)
Library version: 0.96.07-ioctl-cvs (2002-11-21)
Driver version:  1.0.3
"

The box was happily working for a week or two.  Then, for various
reasons, it had to be rebooted.  As it came down, I saw the lvm2 init
script complaining about something, but I didn't catch the message.

When it came back up, it couldn't find any volume groups or logical
volumes.  Any lvm2-command induces a lot of "invalidate: busy buffer"
messages from the kernel.  According to google, these messages are not
really anything to worry about, but I can't remember seing them
before.  pvscan reports the full set of physical volumes, but says "in
use: 0 [ 0]/ in no vg: 3 [53 GB]".

Since / is not a logical volume, the box comes up in single user mode.
I have textfiles in /etc/lvm/backup that look sane (to my untrained
eye), and so does the single file in /etc/lvm/metadata.  The vg00 file
in backup and the vg00 file in metadata actually look quite similar,
but /usr/bin/diff is missing, so I don't know _how_ similar.

I tried vgcfgrestore (in test mode), but it reports "Can't process
text file - missing contents field" and "Restore failed".  I also
thought vgck looked like a promising command, but it segfaulted on
me.

It may be relevant that the upgrade of the lvm2 tools included a new
lvm.conf with a new directive locking_dir, set to /var/lock/lvm.
Which, in my setup is in a LV.  I didn't spot the comment that said
"local non-LV directory...".  Fixed now, but to no avail.

So...

Does anybody have any tips/pointers for reconstructing my vg and lvs,
given the metadata textfile I have?  Or can someone say
authoritatively that I'm SOL, and I should whip out the install cds
and backups? (I have backups of the important stuff, but the
non-important stuff is kind of important to me as well. :) )

The LVs can't really be less useful than they are now, so I'm willing
to try anything, including using ed on /dev/hdaX, if that has a remote
chance of salvaging my data.

I'm also interested in finding out why this happened and what I can do
to prevent it happening again.

Please let me know if I can provide any more relevant info.  TIA for
any insights you can share.

...Peder...
-- 
Cogito ergo panta rei.
