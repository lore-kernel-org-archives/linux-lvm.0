From: Jens Hoffrichter <joho@hausboot.org>
Subject: Re: [linux-lvm] Best practice for lvm on raid-5
Message-ID: <20040202182846.GO5191@deepthought.hausboot.org>
References: <20040202153506.GN5191@deepthought.hausboot.org> <20040202162025.GA27150@muon.de>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20040202162025.GA27150@muon.de>
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
Date: Mon Feb  2 13:30:02 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Mon, Feb 02, 2004 at 05:20:25PM +0100, Nils Juergens wrote:

> > Currently I have /dev/md0 as my only physical volume, but this will lead
> > to problems if I am going to expand the raid 5 by adding another 80 GB
> > harddrive to (as pvresize is not implemented again yet, as I understand).
> 
> Unless I am mistaken, it is not even possible to expand /dev/md0 by adding
> another drive in the first place. And because linux software raid has
> no way of knowing which blocks are in use and which are not, i do not see
> how this could ever be possible.
Yes, it should be possible using raidreconf. I have not testet it yet, but
at least the manpage states it. Converting a raid 0 to a raid 5 of same size
worked without problem.

> If you add another array (raid1 or raid5) as /dev/md1, you can vgextend your
> VG.
Yes, I'm aware of this, but for this I have to add another 3 disk to the
system, and I want to avoid this.

CU all,
Jens
-- 
GPG: 1024D/CF884D50  F2E8 F7FC F823 6464 4E9D  EFAB 6EE9 8B9C CF88 4D50
------------------------------------------------------------------------
 Jens Hoffrichter / joho@hausboot.org / Joho@IRC / Fon: +43-650-5376989
    A dream is a wish your heart makes. 
                               (Seen on a parade in Walt Disney World)
