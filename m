Return-Path: <tmdg@uksr.hp.com>
Message-ID: <3B0CEE4C.81AB19C8@uksr.hp.com>
Date: Thu, 24 May 2001 11:19:40 +0000
From: Tom Dawes-Gamble <tmdg@uksr.hp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] LVM and RedHat 7.1
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

HI,

I have been playing with LVM on RedHat 7.1 I've used the standard RedHat 
kernel source RPM and the LVMbeta9 tools.  

When building a root on LVM I found the HOW-TO at 

http://www.sistina.com/lvm/doc/lvm_howto/Converting_a_root_filesys.html
didn't document that need for a "ramdisk=" option to the lilo.conf
entry for the root on LVM part. ( I've enter a bug report for that. )

I also made the stupid error of not putting ramdisk and and support for
initrd in the kernel. You you think that should be clearer in the 
HOW-TO?  

The  LVM root file system howto at 
http://www.the-infinite.org/archive/docs/lvm/howto-boot-off-root-lv.txt
does however document it.  Though is refers to ramdisk_size= rather than
ramdisk=. 

I was not able to get parted compiled on RH 7.1 but the version I used
was brand new.  The older stable parted refused to shrink my original root 
taking up the whole disk apart from /boot and some swap. 

Apart from that the whole job of setting up root on LVM went like a dream.

Now for the main purpose of this message.

The /etc/rc.d/rc.sysint script in RH 7.1 has some code to activate the
LVM devices but it didn't work for me.  So I have rewritten it so that 
it should work for all scenarios.  As shipped it only works correctly for 
LVM built in to the kernel if LVM is a module it fails.

As I see it there are four possible LVM kernel configurations.

1) No LVM
2) LVM built in (Not a module)
3) LVM loadable module
4) LVM with root on LVM and loadable module.

The released rc.sysinit tests for the presence of /proc/lvm and /sbin/vgchange
to determine if vgscan and vgchange should be run.

The /proc/lvm will only exist if LVM is built in or root is on LVM.
So the script fails if you have a LVM as a loadable module.

So this is my idea as to how to have a generic rc.sysinit that caters for 
all four configurations.

# LVM initialization

# If /proc/lvm exists but lvm-mod.o does not then LVM is built in therefor
# we need to activate the Volume Groups.
if [ -e /proc/lvm -a ! -e /lib/modules/$(uname -r)/kernel/drivere/md/lvm-mod.o ]
        then
	# If /etc/lvmtab doesn't exist then run vgscan.
        if [ ! -f /etc/lvmtab ]; then
                action $"Scaning for LVM devices:" /sbin/vgscan 
        fi
        action $"Activate LVM devices:" /sbin/vgchange -a y
fi

#  If /proc/lvm is not there but we have lvm-mod.o then we are not root on LVM
#  so we need to activate the Volume Groups.
if [ ! -e /proc/lvm -a -e /lib/modules/$(uname -r)/kernel/drivers/md/lvm-mod.o ] 
        then
	# If /etc/lvmtab doesn't exist then run vgscan.
        if [ ! -f /etc/lvmtab ]; then
                action $"Scaning for LVM devices:" /sbin/vgscan 
        fi
        action $"Activate LVM devices:" /sbin/vgchange -a y
fi

# End of LVM initialization.

That should cover all four cases.

1) No LVM. Nothing to do.  
	The first if fails since there is no /proc/lvm.
	The second if fails since there is no lvm-mod.o module.

2) LVM built in LVM.
	The first if passes since there is a .proc.lvm and no lvm-mod.o module.  
	The second if fails since /proc/lvm exists after running vgchange.

3) LVM loadable module.
	The first if fails since there is no /proc/lvm and there is an 
	lvm-mod.o module. 
	The second if passes for the same reasons.

4) LVM root on LVM. Nothing to since VG activated by initrd linuxrc.
	The first if fails since there is an lvm-mod.o.
	The second if fails since /proc/lvm exists.

Have I forgotten anything?

Am I doing anything bad?

Should I post a patch for rc.systinit?

Can anyone else test this for me?

I note there is no deactivation of the VG in the shutdown.  But other messages
indicate this is not really a problem.  So I have not bothered doing anything 
about that.

Best regards,
Tom.

-- 
char  *t,*n,*i="%.9s%.7s%.7s\n";extern void exit(int);extern int -----BEGIN PGP
SIGNED MESSAGE-----
Hash: SHA1

printf(const

-----BEGIN PGP SIGNATURE-----
Version: PGP 6.5.1i

iQA/AwUBOwzuSwbfKggmajr3EQK5fACdHi/ScWKxCzZN/xBYgHymLrCCWNIAnin5
jRD8sB2M03Oajhd3bwhj/9BF
=vf1m
-----END PGP SIGNATURE-----
 
char  *,...);int main(){int v=*i,g,e=*(i-~(v/=v))%*(i+v);g=*i+~e--; 
t=n="  DISPLAY'tmdg@uksr';,,;'.hp.com'*>"+g;v=g-e;  e-=printf(i,n- v,e+n,t);
t=n="  DISPLAY'http://www.itrc.hp.com/' *>"-~g;exit(g+~printf(i,n+~v,e+n,t));}
