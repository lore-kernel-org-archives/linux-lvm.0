Date: Mon, 22 Mar 2004 14:41:45 -0800
From: Dave Olien <dmo@osdl.org>
Subject: Re: [linux-lvm] LVM2 scalability within volume group
Message-ID: <20040322224145.GA26571@osdl.org>
References: <20040317173637.GA2126@osdl.org>
	<20040317120005.C31599@homer.msp.redhat.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20040317120005.C31599@homer.msp.redhat.com>
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: agk@redhat.com


I finally tried reducing metadata rundancy, and re-ran my experiment
with the single volume group containing 200 physical volumes.  I constructed
the new volume group with redundant metadata on only 6 PVs, instead of
the default copy on every volume group.  This helped a lot.  Here's comparing
the new configuration with the old configuration:

        - Time to add a  PV to a VG with large number of PV's:

                                elasped time (secs)
                PV number:      New      Old
                1st PV took      5         3
                40th PV took     6        13
                60th PV took     7        24
                200th PV took   15       426

        - Time to create a Logical Volume within that Volume group:
                                New             Old
                                 30 seconds     14 minutes

        - Time to activate a volume group:
                                New             Old
                                29 seconds      45 minutes

While this is a big improvement, 15 second still seems a long time
for adding that 200th PV.  Likewise 29 seconds to activate the VG
is much better.  But can these be made faster?

I did an strace on some of these commands.  It seems that every
command opens about 480 file descriptors.  I Iooked at the
/etc/lvm/.cache file. It looks like every device listed there is opened
for every command.  I wasn't able to reduce this .cache file very much,
because even though I was using only 200 devices in one volume group,
I still wanted to put the other 200 devices into other volume groups.  

Can these user-level commands be made smarter in this regard?

Is this something that using the lvm(8) shell would help?  On a large
system, re-activing lots of large volume groups could take a while.
Could the startup script for LVM benefit from run an lvm(8) script to
do the startup work?


On Wed, Mar 17, 2004 at 12:00:05PM -0600, Alasdair G Kergon wrote:
> On Wed, Mar 17, 2004 at 09:36:38AM -0800, Dave Olien wrote:
> > Having redundant copies of meta data is a good thing.  But how about
> > allowing the adminstrator to set a limit on the degree of redundancy when
> > a VG is created.  You could limit a VG to having for example 10 redundant
> > copies.  Then adding more PVs beyond the 10th would encounter less overhead.
> > Am I missing something important?
> 
> There'll be a VG-level option for this eventually; until then, use the
> pvcreate options to say how many copies of metadata you want on each PV.
> e.g. pvcreate --metadatacopies 0
> [Careful use of the --restorefile option lets you reduce it on a PV already in the VG.]
> 
> For complex VGs you should increase the space set aside for metadata too:
>   --metadatasize
> 
> See the pvcreate man page.
>  
> Alasdair
> -- 
> agk@redhat.com
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
