Date: Sun, 10 Jul 2011 23:08:15 +0100
From: Alasdair G Kergon <agk@redhat.com>
Message-ID: <20110710220815.GB7857@agk-dp.fab.redhat.com>
References: <4E19E3FD.9000805@tlinx.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4E19E3FD.9000805@tlinx.org>
Subject: Re: [linux-lvm] Bug!  lvs shouldn't need 'root' access
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
To: "Linda A. Walsh" <lvm@tlinx.org>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

On Sun, Jul 10, 2011 at 10:40:13AM -0700, Linda A. Walsh wrote:
> I could write to the darn things!, but all I NEED is read (hmmm

I thought so too when we first began work on LVM, but - surprising 
to me - there's been hardly any demand expressed for this feature.

The proposed method of handling this was to accept dm ioctls on
the actual devices themselves controlled by normal ioctl permissions.

Currently, you need CAP_SYS_ADMIN (and access to /dev/mapper/control).

Alasdair
