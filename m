From: Peter Palfrader <peter@palfrader.org>
Subject: Re: [linux-lvm] PV#s are not unique
Message-ID: <20011211182356.GA864@marvin.palfrader.org>
References: <20011208170737.GA15685@marvin.palfrader.org> <20011211123626.C27568@sistina.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20011211123626.C27568@sistina.com>
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
Date: Tue Dec 11 12:28:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Hi Heinz!

On Tue, 11 Dec 2001, Heinz J . Mauelshagen wrote:

> But anyway:
> 
> you need to read te first sector of
> 
> /dev/ide/host0/bus1/target1/lun0/part1
> and
> /dev/ide/host0/bus0/target1/lun0/part1.
> 
> Change unsigned int value (4 byte) at decimal offset 432 to 5 for bus1
> and to 7 for bus0 which should give you unique numbering of PVs and store
> them back to the corresponding disks.

Thank you for your reply, I did this.  PVids are unique now, but vgscan
still does not find and activate the volume group.

Do you have something else I could try?

I think of trying to restore the metadata on all PVs using vgcfgrestore
since I have a few copies of vg_stuff.conf in /etc/lvmconf.  Would this
be a stupid idea?

TIA
					yours,
					peter

-- 
 PGP signed and encrypted  |  .''`.  ** Debian GNU/Linux **
    messages preferred.    | : :' :      The  universal
                           | `. `'      Operating System
 http://www.palfrader.org/ |   `-    http://www.debian.org/
