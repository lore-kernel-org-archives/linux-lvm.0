Date: Mon, 2 Aug 1999 17:37:56 +0200
From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] RAID and LVM?
Message-ID: <19990802173756.F21215@colombina.comedia.it>
Reply-To: bluca@comedia.it
References: <19990802150301.B20900@colombina.comedia.it> <Pine.LNX.4.10.9908021419460.1912-100000@fuse.aethos.co.uk>
Mime-Version: 1.0
In-Reply-To: <Pine.LNX.4.10.9908021419460.1912-100000@fuse.aethos.co.uk>; from James Pattinson on Mon, Aug 02, 1999 at 02:25:09PM +0100
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@msede.com

On Mon, Aug 02, 1999 at 02:25:09PM +0100, James Pattinson wrote:
> PS - I tried devfs on -ac12 last week as well, impressive, but I couldn't
> seem to use my SCSI cdrom drive anymore, no such thing as /dev/scd or even
> /dev/*cd* exists! Also, I had to `modprobe loop` before I could access
> /dev/loop*.
look for /dev/sr/ :)))
also the devfs patch adds a devfs directory
under linux/Documentation/filesystems
chech the files in there for a suggested
/etc/conf.modules configuration

L.

-- 
Luca Berra -- bluca@comedia.it
    Communications Media & Services S.r.l.
