From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] cache buffer size
Message-ID: <20021106140245.B1228@sistina.com>
References: <3DC1EFFC.A0EEBAFD@be.mbn.or.jp> <20021105151020.D27825@sistina.com> <3DC85406.C03B0AA0@be.mbn.or.jp>
Mime-Version: 1.0
In-Reply-To: <3DC85406.C03B0AA0@be.mbn.or.jp>; from nickey@be.mbn.or.jp on Wed, Nov 06, 2002 at 08:28:06AM +0900
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
Date: Wed Nov  6 07:08:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Wed, Nov 06, 2002 at 08:28:06AM +0900, Miwako Nakai wrote:
> Thank you, Mr.Mauelshagen
> 
> JFS can not have fixed block size. But I heard from JFS group in IBM
> that on 2.5 or later it will be improved. I do not know JFS will have
> fixed block size or not. They said 'improved'.

Didn't know that as a JFS no-user :)
Fixed block sizes is a suboptimal solution for the various io
needs of a filesystem (think small metedata and large data io).

If they do io with varying blocksizes, that would explain the MD RAID5
behaviour already. No way to avoid it in your combination for now then
I guess.


> 
> I think LVM(2?) will be able to handle non-consitant block size on
> 2.5 well.

Yes.

Regards,
Heinz    -- The LVM Guy --


> 
> "Heinz J . Mauelshagen" wrote:
> > 
> > On Fri, Nov 01, 2002 at 12:07:40PM +0900, Miwako Nakai wrote:
> > > I'm using jfs on lvm/raid5 with snapshot.
> > >
> > > When I copy file, it happens frequently
> > > 'raid5: switching cache buffer size XXX -> XXX'.
> > > This message appears to syslog. It caused speed down to access disks.
> > > So, I cut this message. It's seemed ok.
> > 
> > Could be filesystems with different blocksizes accessing the underlying
> > raid5 md through LVM constantly forcing the raid5 stripe cache to be flushed.
> > If that's the case, you want to put filesystems of the _same_ blocksize
> > onto all of the logical volumes allocated to the raid5 device.
> > 
> > Regards,
> > Heinz    -- The LVM Guy --
> > 
> > >
> > > But it's still going to switch cache buffer size. I think it cost
> > > some cpu time. When switching buffer cache size, it always happen
> > > reflushing memories.
> > >
> > > I want to fix buffer size. What shall I do?
> > > I asked JFS group. But they do nothing about cache buffer.
> > >
> > > kernel 2.4.20-pre10-ac2
> > > lvm    1.0.5
> > > jfs    1.0.23
> > >
> > > --
> > > nakai@ezinc.com
> --
> nakai@ezinc.com
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
