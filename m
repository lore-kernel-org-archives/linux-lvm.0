Return-Path: <lembark@wrkhors.com>
Message-ID: <3AB47740.13F03E87@wrkhors.com>
Date: Sun, 18 Mar 2001 02:52:16 -0600
From: Steven Lembark <lembark@wrkhors.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Getting LVM to startup on RedHat
References: <5.0.2.1.2.20010318030921.00a677d0@bugs.home.shadowstar.net>
Content-Transfer-Encoding: 7bit
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

> to touch NT with a 10' pole as a server.

closer than i'd get :-)

> To get LVM working, I ended up specifying noauto in the fstab. vgscan and
> vgchange -ay don't seem to work when placed before mounting of filesystems
> as directed in the HowTO, but will work if placed at the end of rc.sysinit.
> On the downside, I had to hardcode the mount of the LVM filesystem.

bit of a hack but:

	/etc/fstab has noauto for all of the lvm file systems, your
	volume groups all have "/vg" in them (e.g., /dev/vg00) [sue
	me, i've spent 10+ years running HP systems].

allows:

	/usr/bin/perl -n -a -e 'print STDERR qx(mount $F[0]) if m{/vg}'
/etc/fstab;

i.e., reading every line in /etc/fstab with out printing it (-n) 
and splitting all the fields on whitespace (-a) print the result
of "mount" for the first autosplit field ($F[0]) tp stderr if the
line we just read contains "/vg" (m{/vg}) for all the lines in
/etc/fstab.

add:

	BEGIN{$|=1; print qx(/sbin/vgchange -a -y)} 

i.e., flush lines on output and run the vgchange beforehand,
and you get a one-liner to activate LVM and mount the volumes.

which looks like:

/usr/bin/perl -n -a \
-e '
	BEGIN
	{
		$| = 1;
		print qx( /sbin/vgchange -a -y );
	}

	print qx( mount $F[0] if m{/vg} )
' /dev/fstab;

if you want it prettified.

cute thing is that you can re-run this as useful since both
the vgchange and mount will fail harmlessly for already active
or mounted systems.

enjoi.

-- 
 Steven Lembark                                   2930 W. Palmer St.
                                                 Chicago, IL  60647
 lembark@wrkhors.com                                   800-762-1582
