Return-Path: <claudio@conectiva.com>
Date: Sun, 17 Dec 2000 08:41:26 -0200 (BRST)
From: Claudio Matsuoka <claudio@conectiva.com>
Subject: Re: [linux-lvm] Linux crashed; PV died
In-Reply-To: <3A102693.F00BCA80@conectiva.com.br>
Message-ID: <Pine.LNX.4.21.0012170838470.16662-100000@scuzzlebutt.helllabs>
MIME-Version: 1.0
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Mon, 13 Nov 2000, Andrew Clausen wrote:

> I'm sending this for Claudio Matsuoka, a friend of mine from Conectiva.
> Due to the problem described below, he can't sent it himself :-(
 
Thanks, Andrew. It's back from the dead now, up and running.


> After a solid lock on my system (probably due to a problem with the RTL
> 8139 driver), it seems that my PV disappeared. fdisk -l and pvscan
> output follow (is pvscan looking for PVs in /dev/hdc only?). Any ideas
> on how can I recover this system?

Ok, I recovered it after booting a 2.2 series kernel and running pvscan,
vgscan and vgchange.

It turned out that I had devfs support compiled (not mounted) in my 2.4
kernel -- and it was there since 2.3.99ac. Only after the crash LVM started
to complain. So I rebuilt a kernel without devfs and it's fine now.


> Kernel 2.4.0-test12, LVM 0.8final + all patches collected by Christoph
> Hellwig:

Also upgraded to 0.8.1 just in case ;) 


> <22> lvm_dir_cache -- LEAVING with ret: 1
> <1> pv_read_all_pv -- calling stat with "/dev/hdc"
> <22> pv_read -- CALLED with /dev/hdc
> <333> pv_check_name -- CALLED eith "/dev/hdc"

/proc/partitions listed hda with the devfs name (/dev/ide/.../part3) and
hdc as "hdc". pvscan didn't honour the device given in command line, and
tried to open /dev/ide/.../part3 even if /dev/hda3 was explicitly set.
Is it a feature?

Anyway, it seems that crash recovery (apart from that pvscan problem)
is working well.


claudio
