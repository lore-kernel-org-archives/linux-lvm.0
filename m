From: Andreas Dilger <adilger@clusterfs.com>
Subject: Re: [linux-lvm] ext2online and 2.4.18
Message-ID: <20020620163420.GN22427@clusterfs.com>
References: <1024512969.1862.6.camel@hiro.prowell.org.bogus> <20020619195508.GA22427@clusterfs.com> <1024521044.1861.6.camel@hiro.prowell.org.bogus> <20020619214731.GB22427@clusterfs.com> <1024525638.1861.54.camel@hiro.prowell.org.bogus> <1024572480.3d11bc400c205@webmail3.wanadoo.nl>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1024572480.3d11bc400c205@webmail3.wanadoo.nl>
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
Date: Thu Jun 20 11:36:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: sander@sanderscorner.com
Cc: linux-lvm@sistina.com

On Jun 20, 2002  13:28 +0200, sander@sanderscorner.com wrote:
> I applied your patch to 2.4.18 kernel. It applied cleanly. Compiled the new
> kernel and no problems doing that but... ext2online still fails while in the
> kernel.

Could you be more specific?  Do you get any messages in syslog or from
dmesg?  Does the command just lock up and never return?  If you mount
the filesystem with "-o debug,check" you get a few extra messages that
may help narrow down the problem.

Cheers, Andreas
--
Andreas Dilger
http://www-mddsp.enel.ucalgary.ca/People/adilger/
http://sourceforge.net/projects/ext2resize/
