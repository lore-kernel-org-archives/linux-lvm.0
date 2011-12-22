Date: Thu, 22 Dec 2011 18:21:08 +0000
From: Alasdair G Kergon <agk@redhat.com>
Message-ID: <20111222182108.GA30117@agk-dp.fab.redhat.com>
References: <20111222172548.GA31021@agk-dp.fab.redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20111222172548.GA31021@agk-dp.fab.redhat.com>
Subject: Re: [linux-lvm] FW: CVE-2011-4127 kernel: possible privilege
	escalation via	SG_IO ioctl
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
To: linux-lvm@redhat.com, dm-devel@redhat.com

On Thu, Dec 22, 2011 at 05:25:48PM +0000, Alasdair G Kergon wrote:
> A kernel patch that fixes device-mapper/LVM devices is here:
>   http://people.redhat.com/agk/patches/linux/editing/dm-block-sg_io-ioctls.patch
>   ftp://sources.redhat.com/pub/dm/patches/2.6-unstable/editing/patches/dm-block-sg_io-ioctls.patch
 
Complete patchset to fix this proposed here:
  https://lkml.org/lkml/2011/12/22/270

Alasdair
