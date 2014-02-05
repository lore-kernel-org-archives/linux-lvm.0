Date: Wed, 5 Feb 2014 23:27:38 +0000
From: Alasdair G Kergon <agk@redhat.com>
Message-ID: <20140205232737.GC20685@agk-dp.fab.redhat.com>
References: <52F2C4DB.1070808@mglug.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <52F2C4DB.1070808@mglug.de>
Subject: Re: [linux-lvm] does grub(2) recognize lvm-raid-partitions?
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
To: Oliver Rath <rath@mglug.de>
Cc: linux-lvm@redhat.com

On Thu, Feb 06, 2014 at 12:10:19AM +0100, Oliver Rath wrote:
> I know, that lvm2 has its own raid-managment. If I want to put i.e. an
> "/" (including /boot) to an lvm-raid6-device, is grub(2) able to
> recognize this device and boot from it, if i include grub-lvm-module?
 
There is upstream code that attempts to support this, but it has some
serious shortcomings so we do not recommend anyone uses the lvm support
built into grub at this time.  Consider it an unreliable prototype.

Work is gradually progressing on a rewrite that will be fully supported,
so watch this space!

Alasdair
