Subject: Re: [linux-lvm] Block-Level Backup
From: Markus Schiltknecht <markus@bluegap.ch>
In-Reply-To: <1060243375.28308.6.camel@rocky>
References: <1060243375.28308.6.camel@rocky>
Message-Id: <1060244848.11191.7.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Date: Thu Aug  7 03:29:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

On Thu, 2003-08-07 at 10:02, Rocky Lee wrote:
> Hi all,
> 
> How to do block-level Backup with LVM?
> "tar" seems like only support file-level backup.
> any backup tool recommand?

What exactly shall this be good for?

I immediately thought about ISO files: CD-ROM images. You can do the
very same to any block device:

dd if=/dev/hda1 of=/tmp/disk.bak

Of course, the drive mounted ot /tmp has to be larger than /dev/hda1, in
this case... and it's filesystem should probably support files > 2GB.
Compression might help, too.

Not sure if that's whah you're looking for...

Markus
