Date: Mon, 11 Jul 2011 03:53:32 +0100
From: Alasdair G Kergon <agk@redhat.com>
Message-ID: <20110711025332.GE7857@agk-dp.fab.redhat.com>
References: <4E19E3FD.9000805@tlinx.org>
	<20110710220815.GB7857@agk-dp.fab.redhat.com>
	<4E1A50C7.5090006@tlinx.org>
	<20110711022433.GD7857@agk-dp.fab.redhat.com>
	<4E1A6065.8010209@tlinx.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4E1A6065.8010209@tlinx.org>
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

On Sun, Jul 10, 2011 at 07:31:01PM -0700, Linda A. Walsh wrote:
>    As for reading control information -- um....is there a reason why the 
> information
> couldn't be exported through a /proc interface?

Complexity of supported device construction.

We do export some basic core dm state now through sysfs.

Alasdair
