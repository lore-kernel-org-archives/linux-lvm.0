From: Andreas Dilger <adilger@clusterfs.com>
Subject: Re: [linux-lvm] bug in lvm 1.0.[23]
Message-Id: <20020301115523.S22608@lynx.adilger.int>
References: <20020301185709.GC1654@kakerlak>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20020301185709.GC1654@kakerlak>; from wodecki@gmx.de on Fri,
    Mar 01, 2002 at 07:57:09PM +0100
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
Date: Fri Mar  1 12:55:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wiktor Wodecki <wodecki@gmx.de>
Cc: linux-lvm@sistina.com

On Mar 01, 2002  19:57 +0100, Wiktor Wodecki wrote:
> Well, my new drives were merged to a vg called "storage", lv's were
> created, everything fine. Now I pluged-in the old drives, and, well,
> okay, it was party my fault by now, the old 'storage' vg was accessible,
> the new one wasn't. I renamed the active vg to vg0 and rebootet in
> hope for two vg's to be available. There still was only one vg active,
> the old one. Suprisingly it was accessible under the new *and* the old
> name. Rather strange. I pluged the old disks of, and started my pc, to
> discover that the new vg was accessible under those two names, too. I
> could rename them and work with the old and the new vg, but the point
> is that I have 4 vgs now in my system - I only should see two. It's a
> nasty bug and one shouldn't be so dumb as I was, but I think some sanity
> checks in the code wouldn't be bad.

Probably just old devices in /dev.  Just delete /dev/storage and /dev/vg0
and re-run vgscan.  It should set it up properly now.

Cheers, Andreas
--
Andreas Dilger
http://sourceforge.net/projects/ext2resize/
http://www-mddsp.enel.ucalgary.ca/People/adilger/
