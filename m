From: Andreas Dilger <adilger@clusterfs.com>
Subject: Re: [linux-lvm] ext2online and 2.4.18
Message-ID: <20020622081138.GC22411@clusterfs.com>
References: <1024512969.1862.6.camel@hiro.prowell.org.bogus> <20020619195508.GA22427@clusterfs.com> <1024521044.1861.6.camel@hiro.prowell.org.bogus> <20020619214731.GB22427@clusterfs.com> <1024525638.1861.54.camel@hiro.prowell.org.bogus> <1024572480.3d11bc400c205@webmail3.wanadoo.nl> <20020620163420.GN22427@clusterfs.com> <482222938.20020621234918@wanadoo.nl>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <482222938.20020621234918@wanadoo.nl>
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
Date: Sat Jun 22 03:13:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Sander <boeraa@wanadoo.nl>
Cc: linux-lvm@sistina.com

On Jun 21, 2002  23:49 +0200, Sander wrote:
> One message in dmesg which I don't see in a kernel without the patch:
> "EXT2-fs warning: maximal mount count reached, running e2fsck is
> recommended", strange since I have fs checking automatically.

This may happen if you are doing lots of testing.  The interface to the
online resize is done via "mount -o remount,resize=<new_size> /device"
so each time you do a resize it counts as an extra mount.  At one time
I thought I should fix this, so that you don't get filesystem checks
more often, but online resizing is a bit dangerous in the end, so if
you do lots of resizing it probably isn't a bad idea to do extra
checks on the filesystem.

> I have seen other messages on a few previous boots with a patched
> kernel, that I unfortunately can not reproduce, where there are
> complaints about an option 'resize' that is not understood.

This would indicate that the filesystem you are trying to resize does
not have the kernel patch applied.

Cheers, Andreas
--
Andreas Dilger
http://www-mddsp.enel.ucalgary.ca/People/adilger/
http://sourceforge.net/projects/ext2resize/
