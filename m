Subject: Re: [linux-lvm] XFS crash on lvm
From: Steve Lord <lord@sgi.com>
In-Reply-To: <1017872898.18631.8.camel@dumbo.zwecker.de>
References: <1017872898.18631.8.camel@dumbo.zwecker.de>
Content-Transfer-Encoding: 7bit
Message-Id: <1017874608.931.1426.camel@jen.americas.sgi.com>
MIME-Version: 1.0
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
Date: Wed Apr  3 16:56:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com, doc@zwecker.de

On Wed, 2002-04-03 at 16:28, Christophe Zwecker wrote:
> Hi,
> 
> I use 2.4.18-xfs with lvm-tools-1.0.1rc4_iop10-fr2
> lvm-base-1.2-fr1
> 
> I havw a 200GB lv. I had 2.4.16 running after fiddling with usb the
> whole machine crashed, reboot, the fs was corrupt. I had to zerosize the
> journal log, xfs_repair, everything in lost+found.

Are you running on ide with write caching enabled? corruption after a
crash is possible in that configuration. Also the forced shutdown path
did used to corrupt the filesystem, so once you hit a forced shutdown
it is possible to end up with a zeroed superblock and lose your root
directory too. That is fixed in current code - which is difficult to get
right now. There are ftp mirrors, here is one:

	ftp://ftp.thebarn.com/mirror/SGI

> 
> Reformating the fs didnt do the trick (ext3 or xfs) I got told when
> mounting the empty fs, the superblock was not found. Ok I did another
> xfs_repair, after I could reformat again and mount the empty xfs fs.
> 
> Put some data, after 10 hours I got this in kernel log:
> 
> Apr  2 18:07:33 dumbo Corruption of in-memory data detected.  Shutting
> down filesystem: lvm(58,1)
> Apr  2 18:07:33 dumbo Please umount the filesystem, and rectify the
> problem(s)
> 
> again the fs is corrupt. I searched google for this error and found
> somthing in sgi's mailinglist archive. Too bad oss.sgi.com is down since
> about 2 days :-(

oss is getting rebuilt from scratch - and I suspect, that since it was
scheduled to be relocated on Friday anyway, it will not be back until
after that. Please don't complain to me about it by the way!

A new kernel should help, at least the forced shutdown will not trample
on the filesystem.

Steve

-- 

Steve Lord                                      voice: +1-651-683-3511
Principal Engineer, Filesystem Software         email: lord@sgi.com
