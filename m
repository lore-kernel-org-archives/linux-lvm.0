Subject: Re: [linux-lvm] pvcreate error
From: richard turner <rturner@san.rr.com>
In-Reply-To: <1041897923.1053.41.camel@rich-laptop>
References: <1041637712.1854.10.camel@rich-laptop> 
	<20030107000654.A10176@sistina.com>  <1041897923.1053.41.camel@rich-laptop>
Content-Transfer-Encoding: 7bit
Message-Id: <1041965288.1046.26.camel@rich-laptop>
Mime-Version: 1.0
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
Date: Tue Jan  7 12:46:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

I have some additional information that hopefully someone will be
familiar with and provide some assistance.

The kernel I am using 2.4.18-6 was created using devfs. However, when I
am trying to create a physical volume on /dev/hdb devfs is not active.
My /proc/partitions is as follows:

22   0      15972   hdc
 3   0   20066251   ide/host0/bus0/target0/lun0/disc
 3   1     313267   ide/host0/bus0/target0/lun0/part1
 3   2     265072   ide/host0/bus0/target0/lun0/part2
 3   3          1   ide/host0/bus0/target0/lun0/part3
 3   5    3076416   ide/host0/bus0/target0/lun0/part5
 3  64   20066251   ide/host0/bus0/target1/lun0/disc

is it the case that pvcreate is interpreting "disc" as a partition
because it does not detect a traditional "hdb" and therefore cannot
create the physical volume? is devfs required to be active for pvcreate
to locate the disc according to its naming convention?
 
On Mon, 2003-01-06 at 16:05, richard turner wrote:
> i have tried that with no success.
> dd if=/dev/zero of=/dev/hdb bs=512 count=1
> blockdev --rereadpt /dev/hdb
> 
> is there a patch i dont know about for devfs? or kernel 2.4.18?
> 
> On Mon, 2003-01-06 at 15:06, Heinz J . Mauelshagen wrote:
> > On Fri, Jan 03, 2003 at 03:48:31PM -0800, richard turner wrote:
> > > i am trying to create a pv on an entire disk /dev/hdb with the following
> > > command:
> > > pvcreate -ff -y /dev/hdb
> > > 
> > > it returns the following error:
> > > pvcreate --device "/dev/hdb" has a partition table
> > > 
> > > fdisk, sfdisk and all other methods prove there is not a partition table
> > > on /dev/hdb
> > > 
> > > using lvm 1.0.1 with mandrake8.2 kernel 2.4.18-6
> > > 
> > > what is causing pvcreate to think i have a partition table on /dev/hdb?
> > 
> > The identifier at the end of the first sector.
> > 
> > dd if=/dev/zero of=/dev/hdb bs=512 count=1
> > 
> > should make pvcreate happy ;)
> > 
> > > 
> > > 
> > > 
> > > _______________________________________________
> > > linux-lvm mailing list
> > > linux-lvm@sistina.com
> > > http://lists.sistina.com/mailman/listinfo/linux-lvm
> > > read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> > 
> > -- 
> > 
> > Regards,
> > Heinz    -- The LVM Guy --
> > 
> > *** Software bugs are stupid.
> >     Nevertheless it needs not so stupid people to solve them ***
> > 
> > =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
> > 
> > Heinz Mauelshagen                                 Sistina Software Inc.
> > Senior Consultant/Developer                       Am Sonnenhang 11
> >                                                   56242 Marienrachdorf
> >                                                   Germany
> > Mauelshagen@Sistina.com                           +49 2626 141200
> >                                                        FAX 924446
> > =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
> > 
> > _______________________________________________
> > linux-lvm mailing list
> > linux-lvm@sistina.com
> > http://lists.sistina.com/mailman/listinfo/linux-lvm
> > read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> 
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
