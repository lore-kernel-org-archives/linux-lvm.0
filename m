Date: Wed, 14 Jul 2004 20:19:28 +0100
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] Problems with LVM2 creating large numbers of volumes.
Message-ID: <20040714191928.GV30186@agk.surrey.redhat.com>
References: <20040713230331.GA12061@osdl.org>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20040713230331.GA12061@osdl.org>
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
To: Dave Olien <dmo@osdl.org>
Cc: linux-lvm@redhat.com

On Tue, Jul 13, 2004 at 04:03:31PM -0700, Dave Olien wrote:
> Beginning in volume group vg3, I get some behavior I can't explain.

Firstly, confirm you included the kernel fix for >1024 devices.
[Latest CVS includes device-number fixes for >256 devices.]

To investigate, you need to send standard diagnostics:

lvm version
dmsetup -c info
ls -d /sys/block/dm-*

complete log file from the problem command - e.g. in lvm.conf:
     log {
        file="/tmp/lvm2.log"
        level=7
	activation=1
     }

Alasdair
