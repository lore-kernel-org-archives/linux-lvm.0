From: Patrick Caulfield <caulfield@sistina.com>
Subject: Re: [linux-lvm] vgcfgrestore ouput
Message-ID: <20021021081217.GB838@tykepenguin.com>
References: <20021021071750.GA838@tykepenguin.com> <1035187149.2789.5.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1035187149.2789.5.camel@localhost.localdomain>
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
Date: Mon Oct 21 03:12:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Mon, Oct 21, 2002 at 02:59:09AM -0500, Austin Gonyou wrote:
> > 
> > It'll be fine :-) just
> > 
> > # pvcreate /dev/sdb
> > # pvcreate /dev/sdc
> > 
> > and then issue the vgcfgrestore commands you have above.
> 
> My only worry about this, is that the configuration I have, is from
> smaller disks. I don't know if that will screw my FS or not. :(

Ah, you mean the LVM metadata is not actually from the sdb/sdc as they really
were?

It's a bit dodgy. but if LVM can activate the VG (no guarantee unless you have
EXACTLY recreated the old metadata) then you should be able to mout the
filesystems readonly to see what is recoverable.

If you don't have the original LVM metadata anything you do is going to be
rather risky.

One thing you could do (if you know EXACTLY how your original LVs were created)
is to use the two smaller disk and pvcreate them with --size to fake the size of
them to be the same as the bigger disks. Then create your VGs and LVs as you
KNOW they were(!). Then vgcfgrestore /that/ metadata onto the bigger disks.

If you want interactive help on this join us on irc.openprojects.net #lvm

patrick
