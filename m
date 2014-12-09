From: Sean Brisbane <s.brisbane1@physics.ox.ac.uk>
Date: Tue, 9 Dec 2014 21:48:31 +0000
Message-ID: <C6A70F0B3785A04BA88C056A0B39627C21938E12@EXCHNG15.physics.ox.ac.uk>
References: <C6A70F0B3785A04BA88C056A0B39627C21937A26@EXCHNG15.physics.ox.ac.uk>,
	<20141209150513.GB26238@redhat.com>
In-Reply-To: <20141209150513.GB26238@redhat.com>
Content-Language: en-GB
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] thin provisioned volume failed - perhaps issues
 extending metadata?
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
To: Mike Snitzer <snitzer@redhat.com>
Cc: "linux-lvm@redhat.com" <linux-lvm@redhat.com>

Dear All, 

Mike's suggestion to essentially RTFM was spot on.  The transcript is below, with one issue that I don't understand.  It seems that the size requirement for my intermediate  LV needed to be larger than the metadata volume I was repairing.

This was all performed with Redhat's el6 kernel 2.6.32-504 from October this year

#At start of restore process, meta data volume in thin pool was 140M, In my previous email, I noted that this was already a large extension compard to it's size when the error initially occurred.
lvcreate -L 140M VGData -n metarestore
lvchange -a y VGData/thinpool1
thin_dump --repair /dev/mapper/VGData-thinpool1_tmeta  > meta.xml 
thin_restore -o /dev/mapper/VGData-metarestore -i meta.xml
##Complains that block cant be allocated in metarestore
lvextend -L+1g VGData/metarestore
thin_restore -o /dev/mapper/VGData-metarestore -i meta.xml
#works fine now
lvchange -a n /dev/mapper/VGData-thinpool1
lvconvert --poolmetadata VGData/metarestore --thinpool VGData/thinpool1
lvchange -a y VGData/thinpool1
##then activate the thin volumes too
mount -a #all working

Thanks for your help. I'll investigate auto extending metadata.  

Cheers,
Sean
________________________________________
From: Mike Snitzer [snitzer@redhat.com]
Sent: 09 December 2014 15:05
To: Sean Brisbane
Cc: linux-lvm@redhat.com
Subject: Re: thin provisioned volume failed - perhaps issues extending metadata?

On Tue, Dec 09 2014 at  4:52am -0500,
Sean Brisbane <s.brisbane1@physics.ox.ac.uk> wrote:

> Hi,
>
> Last night a thin provisioned volume with snapshots failed with errors. I am not sure how to proceed with debugging this.
>
> Errors such as this written to the console:
>
> Buffer I/O error on device dm-6, logical block 153616394
> lost page write due to I/O error on dm-6
>
> I cant see what happened initially as the logs were not preserved after hard reboot. Now, when I try to mount (full logs at base of mail):
>
> Dec  9 08:52:22 pplxfs13 kernel: device-mapper: thin: 253:4: reached low water mark for metadata device: sending event.
>
> So, I suspect I need to extend the metadata on the pool. The pool itself has plenty of space, and I, perhaps naively, assumed that combining metadata and data into one volume would avoid any metadata space issues.
>
> So, I tried:
>
> > ls /dev/mapper/VGData-thinpool1*
> /dev/mapper/VGData-thinpool1
> /dev/mapper/VGData-thinpool1_tdata
> /dev/mapper/VGData-thinpool1_tmeta
> /dev/mapper/VGData-thinpool1-tpool
>
> > lvresize --poolmetadata +12M /dev/mapper/VGData-thinpool1
>
> But when I try to mount:
> Dec  9 09:37:04 pplxfs13 lvm[1698]: Thin metadata VGData-thinpool1-tpool is now 99% full.
>
> The lvresize operation had some effect:
>
> diff dmsetup_table_post dmsetup_table_pre
> 11c11
> < VGData-thinpool1_tmeta: 163840 98304 linear 8:16 76229298176
> ---
> > VGData-thinpool1_tmeta: 163840 73728 linear 8:16 76229298176
>
>
> In addition, the snapshots of this volume refuse to activate, so I appear to be unable to delete any of the 40 or so snapshots.
>
> Is there anything I can do to recover from this or other things I can try to help debug the issue?
>
> Thanks in advance,
> Sean
>
> Full logs
>
> messages:
>
> Dec  9 08:52:22 pplxfs13 kernel: device-mapper: thin: 253:4: reached low water mark for metadata device: sending event.
> Dec  9 08:52:22 pplxfs13 kernel: device-mapper: space map metadata: unable to allocate new metadata block
> Dec  9 08:52:22 pplxfs13 kernel: device-mapper: thin: 253:4: metadata operation 'dm_thin_insert_block' failed: error = -28
> Dec  9 08:52:22 pplxfs13 kernel: device-mapper: thin: 253:4: aborting current metadata transaction
> Dec  9 08:52:22 pplxfs13 kernel: device-mapper: thin: 253:4: switching pool to read-only mode
> Dec  9 08:52:22 pplxfs13 kernel: Buffer I/O error on device dm-6, logical block 153616394
> Dec  9 08:52:22 pplxfs13 kernel: lost page write due to I/O error on dm-6
> Dec  9 08:52:22 pplxfs13 kernel: Buffer I/O error on device dm-6, logical block 153616395
> Dec  9 08:52:22 pplxfs13 kernel: lost page write due to I/O error on dm-6
> [...more of these...]
> Dec  9 08:52:22 pplxfs13 kernel: Buffer I/O error on device dm-6, logical block 154140676
> Dec  9 08:52:22 pplxfs13 kernel: lost page write due to I/O error on dm-6
> Dec  9 08:52:22 pplxfs13 kernel: JBD: recovery failed
> Dec  9 08:52:22 pplxfs13 kernel: EXT4-fs (dm-6): error loading journal
> Dec  9 08:52:22 pplxfs13 kernel: EXT4-fs (dm-14): recovery complete
> Dec  9 08:52:22 pplxfs13 kernel: EXT4-fs (dm-14): mounted filesystem with ordered data mode. Opts:
> Dec  9 08:52:22 pplxfs13 kernel: JBD: recovery failed
> Dec  9 08:52:22 pplxfs13 kernel: EXT4-fs (dm-6): error loading journal


You definitely ran out of metadata space.  Which version of the kernel
and lvm2 userspace are you using?

See the "Metadata space exhaustion" section of the lvmthin manpage in a
recent lvm2 release to guide you on how to recover.

Also, once you've gotten past ths you really should configure lvm2 to
autoextend the thin-pool (both data and metadata) as needed in response
to low watermark, etc.  See "Automatically extend thin pool LV" in
lvmthin manpage.
