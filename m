From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] cache buffer size
Message-ID: <20021107175801.A8382@sistina.com>
References: <OF442EBFE4.3A4EDB03-ON85256C69.005AF60C@pok.ibm.com>
Mime-Version: 1.0
In-Reply-To: <OF442EBFE4.3A4EDB03-ON85256C69.005AF60C@pok.ibm.com>; from sbest@us.ibm.com on Wed, Nov 06, 2002 at 11:17:05AM -0600
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
Date: Thu Nov  7 11:03:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Wed, Nov 06, 2002 at 11:17:05AM -0600, Steve Best wrote:
> 
> Miwako Nakai wrote:
> >Thank you, Mr.Mauelshagen
> >
> >JFS can not have fixed block size. But I heard from JFS group in IBM
> >that on 2.5 or later it will be improved. I do not know JFS will have
> >fixed block size or not. They said 'improved'.
> 
> This isn't right, JFS block size is fixed at 4k. Do you only have this
> problem if you snapshot? Could you explain some more about your setup.
> Are all of your LVs JFS?
> 
> Heinz is it possible that the 1k is coming from the snapshot?

You pointed to the right spot, Steve :)

Indeed snapshot exception table ios go by blocks of 1k.

Puting the snapshot store on the same device as the original is not
recommended in general for performance reasons.

In case 1k blocks are possible with JFS:

if snapshots are used regularly and there's no seperate PV to put the
snapshot onto, you might want to create a 1k blocked jfs and try if
that performs better than the RAID 5 stripe cache flush penalty with the 4k
blocked filesystem.

Regards,
Heinz    -- The LVM Guy --


> 
> >
> >I think LVM(2?) will be able to handle non-consitant block size on
> >2.5 well.
> 
> >"Heinz J . Mauelshagen" wrote:
> >>
> >> On Fri, Nov 01, 2002 at 12:07:40PM +0900, Miwako Nakai wrote:
> >> > I'm using jfs on lvm/raid5 with snapshot.
> >> >
> >> > When I copy file, it happens frequently
> >> > 'raid5: switching cache buffer size XXX -> XXX'.
> >> > This message appears to syslog. It caused speed down to access disks.
> >> > So, I cut this message. It's seemed ok.
> >>
> >> Could be filesystems with different blocksizes accessing the underlying
> >> raid5 md through LVM constantly forcing the raid5 stripe cache to be
> flushed.
> >> If that's the case, you want to put filesystems of the _same_ blocksize
> >> onto all of the logical volumes allocated to the raid5 device.
> >>
> >> Regards,
> >> Heinz    -- The LVM Guy --
> >>
> >> >
> >> > But it's still going to switch cache buffer size. I think it cost
> >> > some cpu time. When switching buffer cache size, it always happen
> >> > reflushing memories.
> >> >
> >> > I want to fix buffer size. What shall I do?
> >> > I asked JFS group. But they do nothing about cache buffer.
> >> >
> >> > kernel 2.4.20-pre10-ac2
> >> > lvm    1.0.5
> >> > jfs    1.0.23
> >> >
> >> > --
> >> > nakai@ezinc.com
> >>
> 
> Steve
> JFS for Linux http://oss.software.ibm.com/jfs
> 
> 
> 
> 
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

*** Software bugs are stupid.
    Nevertheless it needs not so stupid people to solve them ***

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Heinz Mauelshagen                                 Sistina Software Inc.
Senior Consultant/Developer                       Am Sonnenhang 11
                                                  56242 Marienrachdorf
                                                  Germany
Mauelshagen@Sistina.com                           +49 2626 141200
                                                       FAX 924446
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
