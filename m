From: Andreas Dilger <adilger@clusterfs.com>
Subject: Re: [linux-lvm] 2TB limit of Linux
Message-ID: <20031024140942.N17778@schatzie.adilger.int>
References: <E1AD2e7-0006Es-00@hermes.sistina.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <E1AD2e7-0006Es-00@hermes.sistina.com>; from James.Deas@warnerbros.com on Fri, Oct 24, 2003 at 07:10:06AM -0700
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
Date: Fri Oct 24 17:19:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Oct 24, 2003  07:10 -0700, Deas, Jim wrote:
> Has any work been done to change the 2TB LV limit on i386 stuff up to
> 1PB? I am looking for a solution where I can combine several 2TB NFS
> shares to make volumes in the 10TB range for rich media content storage.
> Also are there any file systems for i386 that could handle this size if
> LVM could make them?

We have Lustre filesystems in the 100TB range right now.  We don't exceed
the 2TB block device/filesystem limits, but rather combine multiple
filesystems to provide a large virtual volume over the network.  This means
Lustre will work just fine with 2.4 kernels also.

Mind you, some of our customers have > 2TB NFS filesystems already, but I
don't think they are served by Linux (NetApps or something).  Since NFS
doesn't have a block device it isn't limited by the 2TB size.

Cheers, Andreas
--
Andreas Dilger
http://sourceforge.net/projects/ext2resize/
http://www-mddsp.enel.ucalgary.ca/People/adilger/
