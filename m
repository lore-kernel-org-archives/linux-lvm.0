Date: Tue, 31 Oct 2000 20:35:59 +0100
From: Jan Niehusmann <jan@gondor.com>
Subject: Re: [linux-lvm] Exporting VG
Message-ID: <20001031203559.A8120@gondor.com>
References: <39FF049B.F7651520@imim.es> <200010311816.e9VIG6d09539@webber.adilger.net>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <200010311816.e9VIG6d09539@webber.adilger.net>; from adilger@turbolinux.com on Tue, Oct 31, 2000 at 11:16:06AM -0700
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andreas Dilger <adilger@turbolinux.com>
Cc: linux-lvm@msede.com

> When you do vgexport, this does not do anything like NFS export (does NOT
> allow network access to the VG).  It allows you to physically move the
> disks to another machine.

Is vgexport/vgimport doing something important? I just moved a harddisk with
a vg to another computer without vgexport/vgimport and didnot notice any 
problems. Or is it only needed if I add a vg to an already running system?

Jan
