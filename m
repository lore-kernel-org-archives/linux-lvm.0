Date: Tue, 14 Oct 2014 17:07:17 -0400
From: Mike Snitzer <snitzer@redhat.com>
Message-ID: <20141014210717.GA19345@redhat.com>
References: <15785B7E063D464C86DD482FCAE4EBA501B7EB057A20@XCH11.scidom.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <15785B7E063D464C86DD482FCAE4EBA501B7EB057A20@XCH11.scidom.de>
Subject: Re: [linux-lvm] kernel errors from a merging snapshot
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
To: "Lentes, Bernd" <bernd.lentes@helmholtz-muenchen.de>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

On Tue, Oct 14 2014 at  2:08pm -0400,
Lentes, Bernd <bernd.lentes@helmholtz-muenchen.de> wrote:

> Hi,
> 
> i have a /-filesystem residing on a lv. I also had a snapshot of that lv because I tried some software. After testing the software I merged the snapshot into the origin, by rebooting. It seemed to went fine.
> Btw: how do I know when merging is finished ? Where can I see results from the merging ?

You can use lvm to see the merge in progress (via lvs).  Or you can have
a look at the "How to determine when a merging is complete" section of
the kernel's Documentation/device-mapper/snapshot.txt

> But in /var/log/messages I have error messages about a block device:
> 
> Oct 14 16:22:45 vm59093-4 kernel: [    7.580247] Buffer I/O error on device dm-3, logical block 0
> Oct 14 16:22:45 vm59093-4 kernel: [    7.580254] Buffer I/O error on device dm-3, logical block 1
> Oct 14 16:22:45 vm59093-4 kernel: [    7.580258] Buffer I/O error on device dm-3, logical block 2
> Oct 14 16:22:45 vm59093-4 kernel: [    7.580261] Buffer I/O error on device dm-3, logical block 3
> Oct 14 16:22:45 vm59093-4 kernel: [    7.580264] Buffer I/O error on device dm-3, logical block 0
> Oct 14 16:22:45 vm59093-4 kernel: [    7.580271] Buffer I/O error on device dm-3, logical block 9961471
> Oct 14 16:22:45 vm59093-4 kernel: [    7.580274] Buffer I/O error on device dm-3, logical block 9961471
> Oct 14 16:22:45 vm59093-4 kernel: [    7.580341] Buffer I/O error on device dm-3, logical block 0
> Oct 14 16:22:45 vm59093-4 kernel: [    7.580345] Buffer I/O error on device dm-3, logical block 1
> 
> Dm-3 is the snapshot I merged (although I named it root-snapshot while creating, not root--snapshot !):
> 
> Dmsetup info says:
> 
> ...
> Name:              vg_1-root--snapshot
> State:             ACTIVE
> Read Ahead:        1024
> Tables present:    LIVE
> Open count:        0
> Event number:      0
> Major, minor:      252, 3
> Number of targets: 1
> UUID: LVM-ZfsXYr9bkOt1d9bMNpcrn7MxH2aX6H0bhELCnywHd7rbddry6f63xtkk1vqs1hvv
> ...
> 
> The errors appeared during the reboot. Is that normal ?

We replace the device that is being merged with the "error" target.  So
any IO directly to the merging device will get errored out.  But IIRC
that was fixed with an updated lvm2 (libdm) change to hide the device
from udev (udev rules were trying to read labels from the device via
blkid, etc).

Which distro and kernel are you using?
