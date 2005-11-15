Subject: Re: [linux-lvm] Sorry, dm:1.02, lvm2:2.02 did not work for me
From: "James G. Sack (jim)" <jsack@tandbergdatacorp.com>
In-Reply-To: <1132073680.4968.3.camel@jgs4.ino.pvt>
References: <20051111163525.18AE1734B1@hormel.redhat.com>
	<1131758026.4975.77.camel@jgs4.ino.pvt>
	<20051112020710.GN26394@agk.surrey.redhat.com>
	<20051112220320.GO26394@agk.surrey.redhat.com>
	<20051112224941.GP26394@agk.surrey.redhat.com>
	<1132073680.4968.3.camel@jgs4.ino.pvt>
Date: Tue, 15 Nov 2005 14:23:16 -0800
Message-Id: <1132093397.4968.41.camel@jgs4.ino.pvt>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: "LVM LIST linux-lvm@redhat.com" <linux-lvm@redhat.com>
Cc: Alasdair G Kergon <agk@redhat.com>

On Tue, 2005-11-15 at 08:54 -0800, James G. Sack (jim) wrote: 
> On Sat, 2005-11-12 at 22:49 +0000, Alasdair G Kergon wrote: 
> > On Sat, Nov 12, 2005 at 10:03:21PM +0000, Alasdair G Kergon wrote:
> > > I've reproduced this if the LV is activated with an old release but
> > > the snapshot is created with the new code.  Should be easy to fix.
> >  
> > Try the current CVS versions.
... 
> Ok, I've grabbed the cvs images, done the configure/make/make install on
> dm and then lvm, and I now see:
> 
> lvm version
>   LVM version:     2.02.01-cvs (2005-11-10)
>   Library version: 1.02.01-cvs (2005-11-10)
>   Driver version:  4.4.0
> 
> I rebooted and reran my test procedure which 
> 1) loops on {lvcreate, sleep 10, lvremove, sleep 2}
> and simultaneously
> 2) loops on {cp abcd wxyz;cp wxyz abcd) 
> operating on a 1GB file on the origin filesystem
> 
> 
> The kcopyd.c BUG at line 145 is triggered by the first lvremove
> following start of the i/o (copy loop).
.. 
> ==> I will go rerun my test scenario on a new origin volume, to see if
> there's any differences.

Result with origin volume on new pv/vg/lv was same, namely: kcopyd.c BUG
at line 145 & oops.

Is there something else I can provide to assist in diagnostics?

hmmm- I thought I might simplify my test environment by removing all
older lvm devices, so I pulled disks containing 3 other pv's. Then I was
getting another scsi read error so I pulled that disk (<heh> I have a 9-
disk NAS I'm playing on, in case anyone's wondering)

Then after reboot, and rerun of my test procedure, I still get the same
behavior --except that it now seems to lockup hard -- no ssh, no ping,
no console scrollback, no keyboard (although sysrq works), no
dmesg/syslog output. There *is* console screen output, ending with what
looks like the trailing part of the oops calltrace. Is it worth
configuring a serial console in order to capture this? (Or can someone
tell me how to capture it otherwise?)

Regards.
..jim
