Return-Path: <glenn@gecpalau.com>
Message-ID: <3AEFCAA4.78EB3E5D@gecpalau.com>
Date: Wed, 02 May 2001 17:51:48 +0900
From: Glenn Shannon <glenn@gecpalau.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] processes remain in D-state,, using lvm, reiserfs and 
 VIA-Board kernel 2.4.2+
References: <14345253444.20010502102551@lzer.net>
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

Jan Walzer wrote:

> Hello people,
>
> <short story>
> using LVM and reiserfs on an disk connected on an VIA-Promise
> controler, leaves different processes in D-state when accessing some
> directories on this disk.
> This is since kernel 2.4.2 until now on kernel 2.4.4-ac1
> The disk then is 'busy' and can't be umounted, so there is no clean
> way to reboot the system. sometimes even SysReq-S,SysReq-U won't
> umount, stopping on the LVM-Device.
> </short story>
>
> <long story>
> I don't know where to start.
> My company gave me the job to care for the server in our new office. I
> was told only to look for it a bit. They already had it configured.
>
> It's an Athlon1,2GHz on an ASUS board with VIA and an Promise-IDE
> controller. Filesystem was on an IBM 30GB-SCSI disk, connected to an
> Adaptec. 1024MB-ram
>
> The "best"-thing: One BIG '/'-partition, where nearly all the data is
> stored on ... yeah these guys were good.
> As they already made it ready, they rsynced the data of their server
> in the old office with this one. so there are 'bout 20GB data on the
> disk, meaning only having 6GB left.
>
> No Problems so far, except for power failures, when it needs to fsck
> the whole disk.
>
> 3weeks ago I got an 40MB-Maxtor-IDE for moving parts of the data on
> it. I connected it to the Promise that is onboard. I decided, to do
> it better than them, and create an LVM. I ended in having 2 LVs on
> the disk, using Reiser. All seems to work well, except, for the told
> problem.
>
> </long story>
>
> Is there a probleme like this known?
> What further informations do you need ? - I'll try to support as much
> information, as I can.
>
>
>
> --
>
>  ,',    Jan Walzer      \V/  http://wa.lzer.net     ,',
> ',','   student of      >|<  mailto:jan.w@lzer.net ',','
>   '   ComputerScience   /A\  +49-177-7403863         '
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm

Here is a way to check (as I have had this problem before):

right before the line in /etc/rc.d/init.d/halt that states:
mount -n -o remount,ro /

put:
lsof >/root/lsofoutput.txt

Then reboot and check the lsofoutput.txt file and see what is being
used......my thinking is that you'll see a bunch of stuff in the /usr/lib
directory being used by various processes. That would indicate a problem
with the method used to copy the files to their new partitions. Meaning
that a bunch of the symlinks are now broken. I have scripts to repair all
of this so if you need, ask.

Let us know how the output from that goes.

TTYL

Glenn
