From: Andreas Dilger <adilger@clusterfs.com>
Subject: Re: [linux-lvm] Physical volume size changed
Message-ID: <20020522102722.GC802@turbolinux.com>
References: <20020522121144.G6806@deepthought.hausboot.org>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20020522121144.G6806@deepthought.hausboot.org>
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Help: <mailto:linux-lvm-request@sistina.com?subject=help>
List-Post: <mailto:linux-lvm@sistina.com>
List-Subscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=subscribe>
List-Unsubscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=unsubscribe>
List-Archive: <http://lists.sistina.com/pipermail/linux-lvm/>
Date: Wed May 22 05:29:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jens Hoffrichter <joho@hausboot.org>
Cc: linux-lvm@sistina.com

On May 22, 2002  12:11 +0200, Jens Hoffrichter wrote:
> Now we have extended the logical volume on the IBM ServeRaid by using
> 3 36 GB disks, so the logical volume on the raid controller now has
> 203.4 GB. 

I assume when you say "logical volume" you actually mean "physical
volume"?

> I have issued a SCSI reset on the bus hoping that the LVM notices on the
> fly that the physical volume size has changed, but it doesn't recognize
> it.

No, you need to use "pvresize", which is part of very recent LVM tools.
I'm not sure if it needs kernel support or not.

Cheers, Andreas
--
Andreas Dilger
http://www-mddsp.enel.ucalgary.ca/People/adilger/
http://sourceforge.net/projects/ext2resize/
