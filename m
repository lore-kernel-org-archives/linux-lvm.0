Return-Path: <lembark@wrkhors.com>
Message-ID: <3AB3FD25.641D51D5@wrkhors.com>
Date: Sat, 17 Mar 2001 18:11:17 -0600
From: Steven Lembark <lembark@wrkhors.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Getting LVM to startup on RedHat
References: <Pine.LNX.4.33.0103171814270.19966-100000@bugs.home.shadowstar.net>
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

> I've compiled kernel 2.2.17+LVM-0.9 patches on a RedHat 6.2 machine. If I
> run
> 
> vgscan
> vgchange -ay
> mount /dev/malepages/data /data
> 
> at a command prompt, all works well. However, if I include
> 
> /usr/sbin/vgscan
> /usr/sbin/vgchange -ay
> 
> (exactly as above) in my /etc/rc.d/rc.sysinit the commands don't seem to
> be run at reboot. After the reboot, I can run the vgchange and mount
> commands without first doing a vgscan without incident.
> 
> Any ideas what could be going on?

congenital defect in the lvm.  you might want to schedule it
post-boot in /etc/rc.d/rc1.d.  i've nearly given up on the 
entire LVM due to the vgscan-at-startup requirement.  to 
speed things up you can use

	( /usr/sbin/vgscan && /usr/sbin/vgchange -a -y ) & 

to background the whole thing.  problem there is that you
will have problems mounting things -- can't use mount -a
to get them if lvm startup isn't in /etc/rc.d/rc.sysinit
but probably don't want anything this tricky in there at
all.  

other fix is to put the mounts directly into an lvm init.d
file and live with hard-coding them, write your own version
of /etc/fstab to mount the lvm's...  none of which are 
very pretty.

-- 
 Steven Lembark                                   2930 W. Palmer St.
                                                 Chicago, IL  60647
 lembark@wrkhors.com                                   800-762-1582
