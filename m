From: Jens Hoffrichter <joho@hausboot.org>
Subject: Re: [linux-lvm] Physical volume size changed
Message-ID: <20020522132013.H6806@deepthought.hausboot.org>
References: <20020522121144.G6806@deepthought.hausboot.org> <20020522102722.GC802@turbolinux.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20020522102722.GC802@turbolinux.com>; from adilger@clusterfs.com on Wed, May 22, 2002 at 04:27:22AM -0600
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
Date: Wed May 22 06:21:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Wed, May 22, 2002 at 04:27:22AM -0600, Andreas Dilger wrote:

> > Now we have extended the logical volume on the IBM ServeRaid by using
> > 3 36 GB disks, so the logical volume on the raid controller now has
> > 203.4 GB. 
> 
> I assume when you say "logical volume" you actually mean "physical
> volume"?
Yes, I meant the logical volume on the raid controller which is the physical
volume for the LVM. Sorry for the confusion :))

> > I have issued a SCSI reset on the bus hoping that the LVM notices on the
> > fly that the physical volume size has changed, but it doesn't recognize
> > it.
> 
> No, you need to use "pvresize", which is part of very recent LVM tools.
> I'm not sure if it needs kernel support or not.
OK, thx, I upgraded my lvm tools and I found the program. I just have to
convince my users now that they can't use the server for a while so I can
unmount the partitions on the lvm logical volume. But I have to resize
the partitions on the lv nevertheless :))

Thanks very much for the help from all of you!

CU all,
Jens
-- 
GPG: 1024D/CF884D50  F2E8 F7FC F823 6464 4E9D  EFAB 6EE9 8B9C CF88 4D50
------------------------------------------------------------------------
  Jens Hoffrichter / joho@hausboot.org / Joho@IRC / Fon: 0172/5376989
     A room without books is like a body without a soul! (Cicero)
