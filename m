Date: Wed, 8 Nov 2000 01:55:34 -0600
From: Heinz Mauelshagen <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] Re: LVM 2.2 snapshot bug
Message-ID: <20001108015534.B15731@homer.sistina.com>
References: <20001107174504.A5834@inspiron.suse.de> <Pine.LNX.4.05.10011080001260.12418-100000@humbolt.nl.linux.org>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.05.10011080001260.12418-100000@humbolt.nl.linux.org>; from riel@conectiva.com.br on Wed, Nov 08, 2000 at 12:04:50AM +0100
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Rik van Riel <riel@conectiva.com.br>
Cc: linux-lvm@msede.com, sct@redhat.com

On Wed, Nov 08, 2000 at 12:04:50AM +0100, Rik van Riel wrote:
> On Tue, 7 Nov 2000, Andrea Arcangeli wrote:
> > On Tue, Nov 07, 2000 at 03:56:59PM +0100, Rik van Riel wrote:
> > > That's a bit much to type in by hand ... and it's basically
> > > kjournald being confused by all its writes failing on a RW
> > > block device.
> > 
> > So ext3 will crash also if I/O errors happen during the log reply.  
> > The Oopses seems due an _ext3_ bug (not due the missing ro_bits in the
> > LVM snapshot) as far I can tell.
> 
> I haven't checked yet if LVM actually returns an error
> to ext3 or if it just silently (well, except for the
> syslog noise) discards the data :)
> 
> > > Indeed this is the case. When the block device is read-write
> > > (the is_read_only(blk_dev) is non-true) it tries to replay
> > > the log, even for a read-only mounted FS.
> > 
> > Ok, I agree it's a minor LVM bug, but again I can't see how that minor
> > bug can cause oopses and I think setting ro_bits won't fix the real
> > bug but it will only hide it.
> 
> Exposing a read-only device as read-write to the users
> will cause a bit of confusion, yes :)
> 
> > BTW, LVM also internally checks for the LV_WRITE bitflag during
> > open(2) so any attempt to open the snapshot RW will fail return
> > -EACCESS as expected.
> 
> Indeed, I saw this in my syslog...
> 
> > > It's with the LVM from the Conectiva kernel RPM, which
> > > uses the source code from your 2.2 LVM driver.
> > 
> > OK.
> > 
> > I will fix the is_read_only thing for the snapshot but you should make
> > sure the bug that is oopsing your machine gets fixed too :).
> 
> *nod*
> 
> Though I guess Stephen's decision to do log replay on
> read-only mounted filesystems on read-write block
> devices is certainly a defendable decision. Btw, don't
> the reiserfs people do the same?

Yes.
Chris Mason and I came up with a VFS extension which flushes the Journal,
sets the FS to a clean state and locks it to enable LVM to activate the
snapshot and to unlock the filesystem again.
BTW: Stephen was involved with the design/implementation and we presented
     it at the Linux Storage Management Workshop in Miami, Rik.


-- 

Regards,
Heinz      -- The LVM guy --

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Heinz Mauelshagen                                 Sistina Software Inc.
Senior Consultant/Developer                       Bartningstr. 12
                                                  64289 Darmstadt
                                                  Germany
Mauelshagen@Sistina.com                           +49 6151 7103 86
                                                       FAX 7103 96
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
