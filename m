From: Theo Van Dinter <felicity@kluge.net>
Subject: Re: [linux-lvm] Mandrake 8.1 and LVM
Message-ID: <20011129190920.B23998@kluge.net>
References: <Pine.LNX.4.21.0111291649440.435-100000@sol.rune.org> <Pine.LNX.4.33.0111291608480.4437-100000@lx1.daboard.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.33.0111291608480.4437-100000@lx1.daboard.com>; from mitch@mdmiller.com on Thu, Nov 29, 2001 at 04:10:04PM -0600
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
Date: Thu Nov 29 18:07:01 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Thu, Nov 29, 2001 at 04:10:04PM -0600, mitch@mdmiller.com wrote:
> Sure ... but doesn't /var typically live on a partition of it's own,
> anyway?  Say, is there a HOWTO or other document which describes
> partitioning considerations and/or the standard directory structure?
> Sorry for all the questions, but I've been brain numbed by a WinTel
> world!!

There probably is, but partitioning has always been more art than science so
you'll get a different answer depending on who you talk to and what you're
trying to do.

If you're interested, here's my take on it:

My rule of thumb for disk layout on a server is:
	/boot	- Small, usually 32-128MB, don't run out of space here.
	/	- I put /usr in here since there's no reason not to any
		  longer.  So this will be any size you think is
		  appropriate.	I will usually put anywhere from 4-8GB
		  here, depending on disk size.  These files should be
		  static-ish, no major changed here.  Don't let it hit 100%.
	/var	- As someone's already stated, filling up /var can be a DoS.
		  Also, at least RedHat keeps other things down here, like
		  MySQL/PostgreSQL/etc ...  If you're not going to move this
		  stuff to another area, make /var as big as necessary.  I
		  usually limit /var to log files, give it 1G or so, and move
		  my databases and such to a better partition.
	/tmp	- Yet another possible DoS, don't allow user-writable areas
		  to live on /.  128-512M should be sufficient, it's
		  temporary space after all.

The rest of the disk is split up for any data.  Of that, I would leave
/boot and / as straight partitions and let everything else be LVM-based.
/boot and / are required for booting and if the LVM blows up for some
reason (disk failure, vg won't start, corruption, etc,) you can at least
boot into single user mode and you don't have to worry about non-standard
drivers/rescue disks and the like.

You also get the benefit of LVM for the areas that are more dynamic and may
require shifting over time.

For other non-critical machines (home, personal workstations, etc,) I
tend to just make one big root partition and call it good since I don't
really care about DoS there.  If the box runs out of space, there should be
nothing stored there (it's on the server being backed up, right?,) so I
usually swap hard drives and blow a new OS image on there via
kickstart/jumpstart/your os' favorite automated install system ...

I hope this has been useful to some degree. :)

-- 
Randomly Generated Tagline:
"I am NOT a computer geek! ... I just spend too much time in front of the 
 computer."                  - Theo
