Return-Path: <thornber@btconnect.com>
Date: Sat, 18 Aug 2001 13:33:06 +0100
Subject: Re: [linux-lvm] Data on LVM-Partition, how to read it out
Message-ID: <20010818133306.A533@btconnect.com>
References: <00ef01c127de$1121b810$0df1d981@piefke>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <00ef01c127de$1121b810$0df1d981@piefke>; from a.bruns@sauerland.de on Sat, Aug 18, 2001 at 02:05:26PM +0200
From: Joe Thornber <thornber@btconnect.com>
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
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Sat, Aug 18, 2001 at 02:05:26PM +0200, Alexander Bruns wrote:
> Resize reiserfs did something but when i wanted to mount the LV it did
> not work. reiserfs-checks did not found a problem but the mount-binary
> told my something about a superblock......
> 
> 
> Abter a reboot I now have the following:
> 
> [root@holodeck lvmconf]# pvdisplay /dev/hda7
> pvdisplay
> --- Physical volume ---
> PV Name               /dev/hda7
> VG Name               lvm_volume_01
> PV Size               48.54 GB / NOT usable 1.06 MB [LVM: 169 KB]
> PV#                   1
> PV Status             available
> Allocatable           yes (but full)
> Cur LV                1
> PE Size (KByte)       4096
> Total PE              12425
> Free PE               0
> Allocated PE          12425
> PV UUID               cFFBJX-aqxr-P7kU-71OY-pgpX-rvtA-XxVpoc
> 
> But for /dev/hdb5 and /ev/hdc5 it does not show the same. NOTHING!!

It looks like you've managed to write over the metadata on the start
of /dev/hdb5 and /dev/hdc5.  You can confirm this by using the pvdata
command.  If you have then you will need to restore the metadata from
a backup, look at vg_cfgrestore.

- Joe
