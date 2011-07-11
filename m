Date: Mon, 11 Jul 2011 03:24:33 +0100
From: Alasdair G Kergon <agk@redhat.com>
Message-ID: <20110711022433.GD7857@agk-dp.fab.redhat.com>
References: <4E19E3FD.9000805@tlinx.org>
	<20110710220815.GB7857@agk-dp.fab.redhat.com>
	<4E1A50C7.5090006@tlinx.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4E1A50C7.5090006@tlinx.org>
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

On Sun, Jul 10, 2011 at 06:24:23PM -0700, Linda A. Walsh wrote:
>   Why is CAP_SYS_ADMIN needed to access a disk device when device  
> permissions
> are already present for this?

It is reading control information about the device, which is not the
same as reading the device itself.

A global CAP_SYS_ADMIN restriction is easy to implement and audit.
Anything else increases complexity and security exposure and like I
said, there's simply been hardly any demand to implement it - nor has
there been demand for proper selinux integration.

For now, configuring sudo is the closest you can get.

Alasdair
