From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] Mandrake 8.1 and LVM
Message-ID: <20011130093008.B18867@colombina.comedia.it>
References: <20011129181708.B16013@colombina.comedia.it> <NBBBKLKHMJHIJLHOGAOJOEDFJCAA.steve.wray@the.net.nz>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <NBBBKLKHMJHIJLHOGAOJOEDFJCAA.steve.wray@the.net.nz>; from steve.wray@the.net.nz on Fri, Nov 30, 2001 at 10:05:18AM +1300
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
Date: Fri Nov 30 02:28:01 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Fri, Nov 30, 2001 at 10:05:18AM +1300, Steve Wray wrote:
> > you can setup lvm during install, but you cannot put root over lvm
> > sorry.
> 
> No don't be sorry!!!
> 
> I don't know why people even think of doing that...
well i do
> Can *anyone* give a good reason (and I don't include
> "because its tidier to have everything LVM") for having
> root on LVM? Its just begging for trouble; like running
> windows XP!
i have been running root lvm for about 1 year on my main system
which has a respectable uptime.
i am in the process of changing it to a new system, which will run mandrake
8.1 and will have root lvm as the previous one.

it is tidier, more flexible, and since linux distribution makers default to
trowing every piece of junk in /lib, and provide dynamycally linked executables
in /sbin, i have been bitten once too many whith a small root.

what i believe is that boot loaders should be able to read files off LVM volumes (provided they are
contigous), like patched lilo does, and that we should all live without the idiotic partition
tables, heck even microshaft groked this!

wherever root is you better have a way of booting into your system if root is corrupted.

> My only worry is that Mandrake 8.1 defaults to devfs
> and there was a recent message about a problem with devfs and LVM.
i have both devfs and lvm, there are known bugs in the lvm tools regarding devfs, but none critical
someone (me?) will fix these sooner or later.

what i'll do next is fixing mkinitrd to understand lvm root.

L.

-- 
Luca Berra -- bluca@comedia.it
        Communication Media & Services S.r.l.
 /"\
 \ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
 / \
