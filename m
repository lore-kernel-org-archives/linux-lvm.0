Return-Path: <smdenton@bellsouth.net>
Message-ID: <01C0AF18.CB0D5B60.smdenton@bellsouth.net>
From: "S. Michael Denton" <smdenton@bellsouth.net>
Subject: RE: [linux-lvm] Getting LVM to startup on RedHat
Date: Sat, 17 Mar 2001 19:30:57 -0500
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
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
To: "'linux-lvm@sistina.com'" <linux-lvm@sistina.com>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On Saturday, 17 March 2001 19:11, Steven Lembark
[SMTP:lembark@wrkhors.com] wrote:
> 
> > I've compiled kernel 2.2.17+LVM-0.9 patches on a RedHat 6.2
> > machine. If I run
> > 
> > vgscan
> > vgchange -ay
> > mount /dev/malepages/data /data
> > 
> > at a command prompt, all works well. However, if I include
> > 
> > /usr/sbin/vgscan
> > /usr/sbin/vgchange -ay
> > 
> > (exactly as above) in my /etc/rc.d/rc.sysinit the commands don't
> > seem to be run at reboot. After the reboot, I can run the
> > vgchange and mount commands without first doing a vgscan without
> > incident.
> > 
> > Any ideas what could be going on?
> 
> congenital defect in the lvm.  you might want to schedule it
> post-boot in /etc/rc.d/rc1.d.  i've nearly given up on the 
> entire LVM due to the vgscan-at-startup requirement.  to 
> speed things up you can use

Last I heard, this "vgscan-at-startup requirement" was taken out
several releases ago.  I've successfully crashed and booted (unclean
and clean restart, respectively) my system several times with various
different versions of LVM and kernel without having to run vgscan
once.

> 	( /usr/sbin/vgscan && /usr/sbin/vgchange -a -y ) & 
> 
> to background the whole thing.  problem there is that you
> will have problems mounting things -- can't use mount -a
> to get them if lvm startup isn't in /etc/rc.d/rc.sysinit
> but probably don't want anything this tricky in there at
> all.  

My init sequence is closer to SYSV than pure redhat but it should
still work for this... i put a vgchange -a y in my rcS.d (which i
think is rc.sysinit in redhat) and the mount calls are in rc1.d and
have never had a problem with them.  In fact, my swap partition is
also lvm.

I could be wrong, and the LVM maintainers/developers could probably
steer you properly if i am, but it appears to me that if you can
start your LVs via commandline but rc script initialization fails to
start the LVs, you may have a mistiming in your rc scripts.  Perhaps
you're using the module instead of the compiled-in and somehow
vgchange is starting before modprobe/insmod?  Or perhaps you've not
yet mounted /proc and vgchange is failing?  The fact that you can
vgchange at all seems to imply that LVM is working properly and that
your rc/init scripts need to be tweaked.

> other fix is to put the mounts directly into an lvm init.d
> file and live with hard-coding them, write your own version
> of /etc/fstab to mount the lvm's...  none of which are 
> very pretty.

I'd be curious to see how you change /etc/fstab to mount an LV that's
not yet started... that would be horrific.  However, you did remind
me of one caveat... I had to change the mount sequence from a
mountall -a to mount /proc, /dev/pts, etc before lvm initialization
then go back in another script to do the actual LV mounts.  Not all
that inelegant as far as I see, however, as that's how most other
unix variants I've seen do LVM-type init.  mount -t no<fstype> is
your friend :)

> -- 
>  Steven Lembark                                   2930 W. Palmer
> St. 
>                                                  Chicago, IL  60647
>  lembark@wrkhors.com                                   800-762-1582
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm


Scott Denton
smdenton@bellsouth.net
EFnet Handle: SteelWyng
ICQ UIN: 24149258
AIM Screen Name: SteelWyng

-----BEGIN PGP SIGNATURE-----
Version: PGPfreeware 6.5.3 for non-commercial use <http://www.pgp.com>

iQA/AwUBOrQBwXC+DNfF0nVpEQJK6QCg7KqHySfqaz7hbtwnzzwAebClplwAn1Zp
RG44Zwt04Wm5QTWcDw7CjPNK
=TXos
-----END PGP SIGNATURE-----
