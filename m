Date: Mon, 23 Jan 2006 22:35:16 +0000
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] pvcreate can't use entire disk?
Message-ID: <20060123223516.GN4280@agk.surrey.redhat.com>
References: <200601232226.RAA22595@out-of-band.media.mit.edu>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <200601232226.RAA22595@out-of-band.media.mit.edu>
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
To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: f-lvm@media.mit.edu

On Mon, Jan 23, 2006 at 05:26:00PM -0500, f-lvm@media.mit.edu wrote:
> "Device /dev/hdd not found."  The disk is surely online:  I can

> I would have -expected- pvcreate to complain about a partition table
> existing 

The currrent internal structure of LVM2 makes that difficult.
Add -vvvv to commands for more information like that.

Invalid devices are filtered out at a low level in the libraries
so tools such as 'pvcreate' never see them.

If your disk has a partition table, then LVM2 insists you use those
partitions to reduce the risk of accidents.
 
> (at which point I would have zeroed it and tried again)

Did you try that?
(And then you might need to run 'vgscan'.)

Alasdair
-- 
agk@redhat.com
