From: Andreas Dilger <adilger@turbolabs.com>
Message-ID: <20011026124355.P23590@turbolinux.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] Re: Clean up /proc/lvm/global formatting
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
Date: Fri Oct 26 13:43:01 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

"Heinz J . Mauelshagen" <mauelshagen@sistina.com> writes:
> The only objection which comes to my mind is related to potential parsers
> out there.  Please request on the linux-lvm, if soembody complains about
> changing the output format (to the better one you come up with :-)
> because of potential parser breaks.

So, the question is - does anyone parse the output of /proc/lvm/global for
scripts?  I would hope not, since it is quite a mess, and you are better
off reading from /proc/VGs/<vg>/{LVs,PVs}/* for your information.

Cheers, Andreas

> On Wed, Oct 24, 2001 at 10:41:48PM -0600, Andreas Dilger wrote:
> > Heinz,
> > I'm wondering if you have any objection to me committing a change to
> > lvm-fs.c which cleans up the output formatting of /proc/lvm/global?  It is a
> > rather large patch line-wise (it includes some code formatting changes),
> > but does some other things as well.
> > 
> > It removes the third pass through the VG/LV/PV structs when collecting the
> > {vg,lv,pv}_counts values*, and also ensures that we do not have a buffer
> > overrun if a VG/LV/PV is added at the same time we are reading from
> > /proc/lvm/global** (which could easily happen if the LVM config is changed
> > between the first and second passes).
> > 
> > (*) Since the first time through we don't actually care about the actual
> >     values of {vg,lv,pv}_counts (we are only counting string lengths) it
> >     doesn't matter what these values are.  As a result, we can use the
> >     first pass to do find {vg,lv,pv}_counts and add a small margin onto
> >     the total string length to accomodate the final number of digits.
> > (**)We use snprintf() when printing into the buffer, to avoid any buffer
> >     overflows when generating the output.  If we run out of buffer space
> >     because a VG/LV/PV was added while we were writing in the second pass
> >     we restart with a larger buffer.
> > 
> > The output format goes from (old and new samples):
> > 
> > =========================== old format =====================================
> > LVM driver version 0.9.1_beta2 (18/01/2001)
> > 
> > Total:  2 VG  3 PV  6 LV (2 LVs open)
> > Global: 31944 bytes malloced   IOP version: 10   5 days 21:18:14 active
> > 
> > VG:  vgboot  [1 PV, 1 LV/0 open 0 times]  PE Size: 1024 KB
> >   Usage [KB/PE]:    7168 /7 total     7168 /7 used       0 /0  free
> >   PV:  [AA] hda2                      7168 /7           7168 /7              0 /0    
> >     LV:  [AWDL  ] lvboot                        7168 /7        close
> > 
> > VG:  vgtest  [2 PVs, 5 LVs/2 open 2 times]  PE Size: 4096 KB
> >   Usage [KB/PE]: 6152192 /1502 total  5935104 /1449 used  217088 /53 free
> >   PVs: [AA] hda6                   3076096 /751      3076096 /751            0 /0    
> >        [AA] hda8                   3076096 /751      2859008 /698        217088 /53    
> >     LVs: [AWDL  ] lvtest                     5124096 /1251     1x open
> >          [AWDL  ] lvjournal                   131072 /32       close
> >          [AWDL  ] lvreiser                    102400 /25       close
> >          [AWDL  ] lvjbd                        65536 /16       close
> >          [AWDL  ] lvswap                      512000 /125      1x open
> > =========================== new format =====================================
> > LVM module LVM version 1.0.1-rc4(03/10/2001)
> > 
> > Total:  2 VG  3 PV  6 LV (2 LV open)         
> > Global: 31944 bytes allocated  IOP version: 10  Active: 8d12:12:13
> > 
> > VG:  vgboot  [1 PV, 1 LV/0 open]  PE Size: 1024 kB
> >   Total Used Free [kB/PE]:         7168/7           7168/7              0/0
> >   PV: [AA] hda2                    7168/7           7168/7              0/0
> >   LV: [AWDL  ] lvboot                               7168/7     (closed)
> > 
> > VG:  vgtest  [2 PV, 5 LV/2 open]  PE Size: 4096 kB
> >   Total Used Free [kB/PE]:      6152192/1502     5935104/1449      217088/53
> >   PV: [AA] hda6                 3076096/751      3076096/751            0/0
> >   PV: [AA] hda8                 3076096/751      2859008/698       217088/53
> >   LV: [AWDL  ] lvtest                            5124096/1251    1x open
> >   LV: [AWDL  ] lvjournal                          131072/32     (closed)
> >   LV: [AWDL  ] lvreiser                           102400/25     (closed)
> >   LV: [AWDL  ] lvjbd                               65536/16     (closed)
> >   LV: [AWDL  ] lvswap                             512000/125     1x open
> > ============================================================================
> > 
> > Notable differences:
> > 1) all of the total, used, free columns are aligned so it is easy to compare
> >    PV/VG/LV usage of each in either kB or PE sizes
> > 2) all of the PV and LV rows are marked as such
> > 3) only show "open x times" if the number of opens is different than the
> >    number of open LVs 
> > 4) remove "plurals" from names (not very important anyways)
> > 5) remove annoying line wrap problems from PV output
> > 6) more space to hold LV names
> > 
> > I kept the order and number of all the columns (mostly) consistent with the
> > original output, in case it is parsed by scripts (shouldn't be very common
> > in any case).
> > 
> > I _was_ going to make all of the size outputs in MB instead of kB (only
> > very strange setups would have PE size < 1MB, and it would give us more
> > room for large LVs), but then I decided against it.  It would really
> > confuse scripts, and all other disk values are in kB also (like
> > /proc/partitions, df, du, etc).
> >
> > As it is, I have left room for 9.99TB values.
--
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
