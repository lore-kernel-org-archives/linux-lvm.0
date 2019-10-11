Date: Fri, 11 Oct 2019 10:14:05 -0500
From: David Teigland <teigland@redhat.com>
Message-ID: <20191011151405.GA31912@redhat.com>
References: <CH2PR18MB32067A650CBE520D9A0DC547CFB10@CH2PR18MB3206.namprd18.prod.outlook.com>
	<6b055125-2e06-df7d-89fa-6c347404a9cd@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6b055125-2e06-df7d-89fa-6c347404a9cd@suse.com>
Subject: Re: [linux-lvm] pvresize will cause a meta-data corruption with
 error message "Error writing device at 4096 length 512"
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Heming Zhao <heming.zhao@suse.com>
Cc: Gang He <GHe@suse.com>, linux-lvm@redhat.com

On Fri, Oct 11, 2019 at 08:11:29AM +0000, Heming Zhao wrote:

> I analyze this issue for some days. It looks a new bug.

Yes, thanks for the thorough analysis.

> In user machine, this write action was failed, the PV header data (first
> 4K) save in bcache (cache->errored list), and then write (by
> bcache_flush) to another disk (f748).

It looks like we need to get rid of cache->errored completely.

> If dev_write_bytes failed, the bcache never clean last_byte. and the fd
> is closed at same time, but cache->errored still have errored fd's data.
> later lvm open new disk, the fd may reuse the old-errored fd number,
> error data will be written when later lvm call bcache_flush.

That's a bad bug.

> 2> duplicated pv header.
>     as <1> description, fc68 metadata was overwritten to f748.
>     this cause by lvm bug (I said in <1>).
> 
> 3> device not correct
>     I don't know why the disk scsi-360060e80072a670000302a670000fc68 has below wrong metadata:
> 
> pre_pvr/scsi-360060e80072a670000302a670000fc68
> (please also read the comments in below metadata area.)
> ```
>      vgpocdbcdb1_r2 {
>          id = "PWd17E-xxx-oANHbq"
>          seqno = 20
>          format = "lvm2"
>          status = ["RESIZEABLE", "READ", "WRITE"]
>          flags = []
>          extent_size = 65536
>          max_lv = 0
>          max_pv = 0
>          metadata_copies = 0
>          
>          physical_volumes {
>              
>              pv0 {
>                  id = "3KTOW5-xxxx-8g0Rf2"
>                  device = "/dev/disk/by-id/scsi-360060e80072a660000302a660000f768"
>                                                                      Wrong!! ^^^^^
>                           I don't know why there is f768, please ask customer
>                  status = ["ALLOCATABLE"]
>                  flags = []
>                  dev_size = 860160
>                  pe_start = 2048
>                  pe_count = 13
>              }
>          }
> ```
>     fc68 => f768  the 'c' (b1100) change to '7' (b0111).
>     maybe disk bit overturn, maybe lvm has bug. I don't know & have no idea.

Is scsi-360060e80072a660000302a660000f768 the correct device for
PVID 3KTOW5...?  If so, then it's consistent.  If not, then I suspect
this is a result of duplicating the PVID on multiple devices above.


> On 9/11/19 5:17 PM, Gang He wrote:
> > Hello List,
> > 
> > Our user encountered a meta-data corruption problem, when run pvresize command after upgrading to LVM2 v2.02.180 from v2.02.120.
> > 
> > The details are as below,
> > we have following environment:
> > - Storage: HP XP7 (SAN) - LUN's are presented to ESX via RDM
> > - VMWare ESXi 6.5
> > - SLES 12 SP 4 Guest
> > 
> > Resize happened this way (is our standard way since years) - however - this is our first resize after upgrading SLES 12 SP3 to SLES 12 SP4 - until this upgrade, we
> > never had a problem like this:
> > - split continous access on storage box, resize lun on XP7
> > - recreate ca on XP7
> > - scan on ESX
> > - rescan-scsi-bus.sh -s on SLES VM
> > - pvresize  ( at this step the error happened)
> > 
> > huns1vdb01:~ # pvresize /dev/disk/by-id/scsi-360060e80072a660000302a6600003274
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
