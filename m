From: Sebastian Beneke <sebastian@beneke-it.de>
Subject: Re: [linux-lvm] One PV destroyed - now the whole VG isn't working
 anymore
Message-Id: <20031105171230.6026b8da.sebastian@beneke-it.de>
In-Reply-To: <20031105141644.GB11363@planungsteam-eb.de>
References: <20031101142538.34423cb0.sebastian@beneke-it.de>
	<20031103110555.E1850@sistina.com>
	<20031105141644.GB11363@planungsteam-eb.de>
Mime-Version: 1.0
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
Date: Wed Nov  5 10:14:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

On Wed, 5 Nov 2003 15:16:44 +0100
Holger Parplies <wopp@planungsteam-eb.de> wrote:

> > On Sat, Nov 01, 2003 at 02:25:38PM +0100, Sebastian Beneke wrote:
> > > Now /dev/hde
> > > was destroyed by"dd if=/dev/zero of=/dev/diskname bs=1k count=1"
> 
> Do I understand correctly that only the first 1K of the disk was
> overwritten? Of the PV, of the disk (/dev/hde), of something else
> ... ?
> 
> If it's the first 1K of /dev/hde, you've probably only lost the
> partition table, which you could re-create with fdisk, presuming you
> remember exactly how your disk was partitioned (i.e. where your PV
> was). Remember to set the type of the partition correctly (8e -
> Linux LVM).

Yes, absolutely. I thought about it. Both harddisks are ok. Only the
PT of the second disk must be destroyed. The best: there weren't any
partitions on it, I just createt a LVM-PV and then created an ext3
filesystem. I think all the data should be there, but I don't know how
to repair it. On the second disk I created a new VG called "Backup"
(thinking it was another disk). What I have to do is: Get the old PT
with the old LVM informations on it back. But how? I am an absolute
LVM-Newbie. This information should not be more than some bytes,
right?

Anyone any ideas here?
