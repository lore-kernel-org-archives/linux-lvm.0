Return-Path: <gashaw@asosa.org>
Date: Tue, 20 Feb 2001 03:19:54 -0800 (PST)
From: Gashaw Mengistu <gashaw@asosa.org>
Subject: Re: [linux-lvm] Startup/Shutdown scripts for RH6.2?
In-Reply-To: <3A911C83.3E562007@lmco.com>
Message-ID: <Pine.LNX.4.21.0102200316040.22732-100000@compath.asosa.org>
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

I had the same problem too at one time. But I added appended script in
/etc/rc.d/rc.sysinit right after the RAID initialization and right before
the file system starts getting checked (before _RUN_QUOTACHECK). I added
the stop script in /etc/init.d/halt.
I found this script in the group archive.

## LVM
#scan for VGs and create /dev entries.
if [ -x /sbin/vgscan -a -d /proc/lvm ]; then
       action "LVM: Scanning for Volume Groups" /sbin/vgscan
fi
#activate all VGs
if [ -x /sbin/vgchange -a -e /proc/lvm ]; then
       action "LVM: Activating Volume Groups" /sbin/vgchange -ay
fi
## End LVM

Hope this helps


On Mon, 19 Feb 2001, Jeffrey B Layton wrote:

> Hello,
> 
>    Of course I'm a newbie :) I'm been experimenting with LVM
> prior to a production installation. I've got everything working
> pretty well with a RH6.2 installation and a custom kernel.
> However, I'm a bit stuck on the startup/shutdown scripts. I've
> tried a couple of things after searching the archives, but nothing
> seems to work (i.e. the volume groups are not found and then
> mount complains very loudly). Any suggestions/tips/code?
> 
> TIA,
> 
> Jeff Layton
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> 
