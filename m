Subject: Re: [linux-lvm] One PV destroyed - now the whole VG isn't working anymore
Message-ID: <20031105141644.GB11363@planungsteam-eb.de>
References: <20031101142538.34423cb0.sebastian@beneke-it.de> <20031103110555.E1850@sistina.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20031103110555.E1850@sistina.com>
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
Date: Wed Nov  5 08:18:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

> On Sat, Nov 01, 2003 at 02:25:38PM +0100, Sebastian Beneke wrote:
> > Now /dev/hde
> > was destroyed by"dd if=/dev/zero of=/dev/diskname bs=1k count=1"

Do I understand correctly that only the first 1K of the disk was
overwritten? Of the PV, of the disk (/dev/hde), of something else ... ?

If it's the first 1K of /dev/hde, you've probably only lost the
partition table, which you could re-create with fdisk, presuming you
remember exactly how your disk was partitioned (i.e. where your PV was).
Remember to set the type of the partition correctly (8e - Linux LVM).

I'm not sure what the beginning of a PV contains and whether there's a
simple way to restore that ...

Hope that helps,

Holger
