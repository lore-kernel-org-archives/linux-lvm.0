Subject: Re: [linux-lvm] One PV destroyed - now the whole VG isn't working anymore
Message-ID: <20031105200729.GD11363@planungsteam-eb.de>
References: <20031101142538.34423cb0.sebastian@beneke-it.de> <20031103110555.E1850@sistina.com> <20031105141644.GB11363@planungsteam-eb.de> <20031105171230.6026b8da.sebastian@beneke-it.de>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20031105171230.6026b8da.sebastian@beneke-it.de>
From: Holger Parplies <wopp@planungsteam-eb.de>
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
Date: Wed Nov  5 14:09:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Sebastian Beneke wrote:
> > > > Now /dev/hde
> > > > was destroyed by"dd if=/dev/zero of=/dev/diskname bs=1k count=1"
> > 
> > If it's the first 1K of /dev/hde, [...]
> 
> Yes, absolutely. I thought about it. Both harddisks are ok. Only the
> PT of the second disk must be destroyed. The best: there weren't any
> partitions on it, I just createt a LVM-PV and then created an ext3
> filesystem.

Hmm, if /dev/hde was a PV, then there's no partition table on it. You've
zeroed the first 1K of the PV, which I'd guess contains either [part of]
the LVM metadata or random FS data (in case the LVM metadata is located
at the end of a PV - I'm not sure). In either case, you've completely
overwritten your LVM metadata for that PV:

> On the second disk I created a new VG called "Backup"
> (thinking it was another disk).

I'm not sure whether everything you need is in the metadata backups
(under /etc/lvmconf/). Presumably it is, and you'll need to find the
correct backup to restore. See the man pages for 'vgcfgrestore' and
'pvcreate' (-ff).
I see you've read them already, and vgcfgrestore to a different disk
didn't work. Hmm. It will be of more use with the original disk anyway
if you want to regain access to the data on it.
- Do you get the same error with the original disk? You'll need to use
  'pvcreate' on it first if LVM thinks it currently belongs to VG Backup,
  but I believe it will tell you so.
- The disk was originally connected to your computer as /dev/hde. Is it
  connected as /dev/hde again now? If not, see the '-o' switch of
  'vgcfgrestore'.
- Did you change the configuration of VG storage after doing the 'dd'?
  Check the file dates of the backups in /etc/lvmconf to be sure. Select
  the correct backup to restore with '-b' or '-f'. Trying out different
  ones until you find one that works can't really hurt much, since the
  LVM metadata on your disk is messed up anyway. Just don't select the
  wrong target disk ;-). Selecting a too old backup will (obviously)
  undo the change causing creation of the backup, meaning LVs may be
  missing or have the wrong size etc.
- Err, the VG "Backup" you created was left empty, wasn't it? You didn't
  create LVs and FSes and populate them, did you?

Presuming you can regain access to your VG storage and the LV(s) in it,
you should check the integrity of the FS(es) (in case the 'dd' affected
part of the FS metadata). If an LV happened to start with the wiped out
blocks (probably meaning you can't mount or check it), you might have a
look at 'e2fsck -b ...' or 'mke2fs -S' - just to give you some pointers.
Read the warnings in the manual pages before destroying the data on your
hard disks ;-).

Thinking about it, if LVM metadata WERE at the end of a PV, you couldn't
have created VG "Backup" on your disk, so your FS is probably safe.

Well, good luck.

Regards,

Holger
