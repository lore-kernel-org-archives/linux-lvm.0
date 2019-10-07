Date: Mon, 7 Oct 2019 11:42:18 -0500
From: David Teigland <teigland@redhat.com>
Message-ID: <20191007164218.GA4398@redhat.com>
References: <8d1e7b13-eeec-18c0-592b-564dc5740636@yahoo.co.uk>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8d1e7b13-eeec-18c0-592b-564dc5740636@yahoo.co.uk>
Subject: Re: [linux-lvm] recovery of a VG - how?
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
Content-Type: text/plain; charset="utf-8"
To: lejeczek <peljasz@yahoo.co.uk>
Cc: "linux-lvm@redhat.com" <linux-lvm@redhat.com>

On Mon, Oct 07, 2019 at 05:25:15PM +0100, lejeczek wrote:
> hi guys
> 
> I have a VG which I try to restore:
> 
> $ vgcfgrestore --file /etc/lvm/archive/chenbro0.0_00308-2121179640.vg chenbro0.0
> � /dev/mapper/chenbro_a: Checksum error at offset 428544
> � Couldn't read volume group metadata from /dev/mapper/chenbro_a.
> � Metadata location on /dev/mapper/chenbro_a at 428544 has invalid summary for VG.

The latest upstream version of lvm has some improvements to help recover
from problems like this.  So, you could try building lvm 2.03.05, and
running 'vgck --updatemetadata'.  Otherwise, the old approach has been to
use pvcreate with --restorefile and --uuid, followed by vgcfgrestore.
(I'd experiment with that using some test devices if possible.)
Dave
