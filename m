Date: Fri, 8 Sep 2000 20:28:11 +0200
From: Jan Niehusmann <jan@gondor.com>
Subject: Re: [linux-lvm] LVM and I2O
Message-ID: <20000908202811.A30951@gondor.com>
References: <200009081707.LAA01055@lynx.turbolabs.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <200009081707.LAA01055@lynx.turbolabs.com>; from adilger@turbolinux.com on Fri, Sep 08, 2000 at 11:07:52AM -0600
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andreas Dilger <adilger@turbolinux.com>
Cc: Linux LVM mailing list <linux-lvm@msede.com>

On Fri, Sep 08, 2000 at 11:07:52AM -0600, Andreas Dilger wrote:
> Jan Niehusmann writes:
> > But mkfs and mkswap are tools that are normally only called manually by an
> > administrator who should know what he does.

> And pvcreate _won't_ be called by the same person?  I don't see any
> difference between overwriting your disk with mkfs, fdisk, or pvcreate.

Sorry, I didn't check which tools actually had problems with unknown partition
types. pvcreate, of course, is similar enough to mkfs to share the same checks.

Jan
