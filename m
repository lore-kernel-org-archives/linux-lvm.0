Return-Path: <adilger@turbolinux.com>
From: Andreas Dilger <adilger@turbolinux.com>
Message-Id: <200102201910.f1KJAEF13248@webber.adilger.net>
Subject: Re: [linux-lvm] Startup/Shutdown scripts for RH6.2?
In-Reply-To: <Pine.LNX.4.21.0102200316040.22732-100000@compath.asosa.org> from
 Gashaw Mengistu at "Feb 20, 2001 03:19:54 am"
Date: Tue, 20 Feb 2001 12:10:13 -0700 (MST)
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Gashaw Mengistu writes:
> I had the same problem too at one time. But I added appended script in
> /etc/rc.d/rc.sysinit right after the RAID initialization and right before
> the file system starts getting checked (before _RUN_QUOTACHECK). I added
> the stop script in /etc/init.d/halt.
> I found this script in the group archive.
> 
> ## LVM
> #scan for VGs and create /dev entries.
> if [ -x /sbin/vgscan -a -d /proc/lvm ]; then
>        action "LVM: Scanning for Volume Groups" /sbin/vgscan
> fi
> #activate all VGs
> if [ -x /sbin/vgchange -a -e /proc/lvm ]; then
>        action "LVM: Activating Volume Groups" /sbin/vgchange -ay
> fi
> ## End LVM

This will only work (AFAICS) when LVM is compiled into the kernel, because
/proc/lvm will not exist if it is a module.  My startup has this first:

[ ! -e /proc/lvm ] && (modprobe lvm || modprobe lvm_mod) 2> /dev/null

Cheers, Andreas
-- 
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
