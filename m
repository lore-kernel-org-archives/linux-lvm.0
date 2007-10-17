Date: Wed, 17 Oct 2007 02:28:58 +0100
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] pvmove obliterates filesystem (Opensuse 10.2, x86-64)
Message-ID: <20071017012858.GW10006@agk.fab.redhat.com>
References: <ff3hde$7rt$2@ger.gmane.org>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ff3hde$7rt$2@ger.gmane.org>
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
Content-Transfer-Encoding: 7bit
To: Brian Strand <bstrand@switchmanagement.com>
Cc: linux-lvm@redhat.com

On Tue, Oct 16, 2007 at 11:27:42PM +0000, Brian Strand wrote:
> 2462 dual-port FC HBA, using qla2400 (no dm-multipath).  Note:  I had
> just completed a successful pvmove of another lv about 30 minutes prior
> to this incident.
 
>   LVM version:     2.02.13 (2006-10-27)
>   Library version: 1.02.12 (2006-10-13)
>   Driver version:  4.7.0
> Linux somebox 2.6.18.2-34-default #1 SMP Mon Nov 27 11:46:27 UTC 2006
> x86_64 x86_64 x86_64 GNU/Linux
 
(need to check those versions are all compatible and kernel isn't missing
relevant patches)

>     Creating switch-pvmove0
>   device-mapper: create ioctl failed: Device or resource busy

That should *not* happen.
Are you sure the preceding pvmove completed correctly?
Is some version of udev enabled on dm devices that might be interfering?

>   device-mapper: reload ioctl failed: Invalid argument

>     Creating volume group backup "/etc/lvm/backup/switch" (seqno 250).

Need to check through the sequence of backups to see all the metadata
changes it actually made (probably need the ones in the on-disk metadata
area rather than just the /etc/lvm/backup ones).

>   ABORTING: Segment progression failed.

>   /dev/sdc: Moved: 60.0%

Message could be incorrect, need to check.

> Oct  9 22:33:21 somebox kernel: device-mapper: table: 253:13: linear:
> dm-linear: Device lookup failed

So it couldn't use that device (a common cause is a size error when wrong
device is used e.g. with software raid or partially-cloned devices).

Alasdair
-- 
agk@redhat.com
