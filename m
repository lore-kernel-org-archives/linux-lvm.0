From: Trond Michelsen <mike@crusaders.no>
Subject: Re: [linux-lvm] removing a bad HD
Message-ID: <20031007175710.B25658@crusaders.no>
References: <20031004210122.S14777@crusaders.no> <3F8105B3.1040506@webhackande.se>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3F8105B3.1040506@webhackande.se>; from richie@webhackande.se on Mon, Oct 06, 2003 at 06:04:05AM +0000
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
Date: Tue Oct  7 11:06:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Mon, Oct 06, 2003 at 06:04:05AM +0000, Rickard Olsson wrote:
> Trond Michelsen wrote:
> 
> > Recently a harddrive in my LVM started giving me read-errors, so
> > naturally I wanted to replace the drive with a new one.
> 
> I recently went through this (with the added complication of some bad 
> metadata) and you have a few options.
> 
> The best one may be to use dd (with NOERROR) to raw copy the contents 
> from the old disk to a new one of the same size and then use the new one 
> when doing the pvmove.
> 
> Another path is to upgrade to LVM2 (you may have to do this anyway, I 
> needed some functionality in the LVM2 pvcreate to pull my stunt off) and 
> use the "partial" feature. I haven't tried this myself.
> 
> There are more details of my tribulations just a few weeks back in the 
> list archives, but feel free to ask if there's something missing (I had 
> some private conversations with Heinz on the topic as well).

Thanks, but is it really necessary to copy the PE at all? It's broken,
and I don't care about that 8MB of data. Isn't it possible to just
reassign the LE that's mapped to the broken PE to a completely empty PE
at some other disk?

At the moment I'm a bit tempted to just set up a new VG, and migrate
data from the old VG file by file, disk by disk.

-- 
  // Trond Michelsen
\X/  mike@crusaders.no
