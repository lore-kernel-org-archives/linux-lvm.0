From: Patrick Caulfield <caulfield@sistina.com>
Subject: Re: [linux-lvm] recovering a bad physical volume
Message-ID: <20020717072144.GD11802@tykepenguin.com>
References: <20020716071417.GB957@tykepenguin.com> <Pine.SOL.4.44.0207162219080.19234-100000@green.csi.cam.ac.uk>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Pine.SOL.4.44.0207162219080.19234-100000@green.csi.cam.ac.uk>
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
Date: Wed Jul 17 02:21:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Tue, Jul 16, 2002 at 10:22:43PM +0100, Matthew Johnson wrote:
> 
> OK, from that I get the error "size of volume differs from backup",
> although the volume group mounts fine. However, mount can't find a
> filesystem. Bit more info - I checked the partition sizes (I was playing
> around with some) - but they cylinder numbers are the same as the list I
> have before I started. Second - its a 3gb partition, and the missing
> logical volume is a 10Gb one. Hence, the last 7Gb are on the OK physical volumes. Can I
> get back at least those, if not the whole lot.
> 
> Alternatively, at this point the question might better be asked to the
> reiserfs lists.


Hmm, that message is a bit odd. Check that the partition sizes really do match
what LVM thinks they ought to be. vgcfgrestore -ll -n <vg> will show you this.

If the sizes match up and the disk is OK there's no reason why the filesystem
shouldn't mount.

-- 

patrick
