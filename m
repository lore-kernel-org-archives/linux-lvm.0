Date: Tue, 23 Apr 2019 09:27:44 -0500
From: David Teigland <teigland@redhat.com>
Message-ID: <20190423142744.GA9541@redhat.com>
References: <5CBE9F89020000F900061398@prv1-mh.provo.novell.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5CBE9F89020000F900061398@prv1-mh.provo.novell.com>
Subject: Re: [linux-lvm] pvscan: /dev/sdc: open failed: No medium found
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
To: Gang He <ghe@suse.com>
Cc: linux-lvm@redhat.com

On Mon, Apr 22, 2019 at 11:15:53PM -0600, Gang He wrote:
> Hello List,
> 
> One user complained this error message.
> The user has a usb sd card reader with no media present.  When they issue a pvscan under lvm2-2.02.180 the device is opened which results in 'No medium found' being reported. 
> But lvm2-2.02.120 did not do this (the device appears to get filtered out earlier). The customer views the 'No medium found' message as an issue/bug.
> Any suggest/comments for this error message?
> 
> The detailed information is as below,
> lvm2 2.02.180-9.4.2
> OS: SLES12 SP4
> Kernel 4.12.14-95.3-default
> Hardware: HP ProLiant DL380 Gen10
> 
> After upgrade from sles12SP3 to SP4, customer is reporting the following error message:
> 
>  # pvscan
>  /dev/sdc: open failed: No medium found
>  PV /dev/sdb   VG Q11vg10         lvm2 [5.24 TiB / 2.00 TiB free]
>  Total: 1 [5.24 TiB] / in use: 1 [5.24 TiB] / in no VG: 0 [0   ]

I've heard this a few times now, I guess we should drop it, it's probably
more trouble than help.
