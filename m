From: Holger Grothe <grothe@mathematik.tu-darmstadt.de>
Subject: Re: [linux-lvm] A way to bypass LVM and extract the raw data off?
Message-Id: <20020109172947.A24522@fb0442.mathematik.tu-darmstadt.de>
References: <1010309724.3c381a5ce8cbe@www.snappymail.ca>
    <1010343969.3c38a0214056f@www.snappymail.ca>
    <20020106152433.Q12868@lynx.no>
    <1010359883.3c38de4b3692f@www.snappymail.ca>
    <1010543196.3c3baa5c40c49@www.snappymail.ca>
    <20020108200408.R769@lynx.adilger.int>
    <1010588497.3c3c5b5182e7e@www.snappymail.ca>
MIME-Version: 1.0
In-Reply-To: <1010588497.3c3c5b5182e7e@www.snappymail.ca>; from
    ipso@snappymail.ca on Wed, Jan 09, 2002 at 07:01:37AM -0800
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
Date: Wed Jan  9 10:30:03 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Wed, Jan 09, 2002 at 07:01:37AM -0800, IpSo wrote:
> Well, I gave this a shot and everything seemed promising until I mounted the
> loop back file.
> 
> dd if=/dev/hda bs=512 skip=4670127 count=35461377 of=/big/backup_hda6.bin
                             ^^^^^^^
> 
> -rw-r--r--    1 root     root     17105949184 Jan  8 22:05 backup_hda6.bin
> 
> File size seems about right. 
> 
> [root@ipso big]# mount -o loop ./backup_hda6.bin /test -t reiserfs
> mount: wrong fs type, bad option, bad superblock on /dev/loop0,
>        or too many mounted file systems
> 
> Understandable...
> 
> [root@ipso big]# reiserfsck --rebuild-sb ./backup_hda6.bin

IMHO the wrong way. To my experience the mount error message indicates
a "bad filesystem structure", which means you skipped a wrong number of 
blocks when using dd.

> Uhh, what happened to all the data? And theres no lost+found directory either.

Due to the "bad filesystem structure" the filesystem is _more_ or less
initialised by the reiserfsck command. reiserfs has no lost+found directory.

> > > Possible extended partition at offset(249mb)
> > >    Possible partition(Linux LVM physical volume), size(17315mb),
> > offset(2280mb)
> > >       type: 142(0x8E)(Linux LVM physical volume)
> > >       size: 17315mb #s(35461377) s(4670127-40131503)
                                         ^^^^^^^
If I'am right this means sectors #4670127 to #40131503 (35461377 sectors)
are used for the volume. Therfore the dd command should skip only the
first 4670126 sectors:
  dd if=/dev/hda bs=512 skip=4670126 count=35461377 of=/big/backup_hda6.bin
                             ^^^^^^^
Please try.

Holger
-- 
Holger Grothe  (Email: grothe@mathematik.tu-darmstadt.de)
Fachbereich Mathematik, TU Darmstadt
