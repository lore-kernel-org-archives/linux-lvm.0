Return-Path: <adilger@turbolinux.com>
From: Andreas Dilger <adilger@turbolinux.com>
Message-Id: <200102271702.f1RH2lm27059@webber.adilger.net>
Subject: Re: [linux-lvm] Problem mounting ext2 fs on LVM
In-Reply-To: <m24rxg2lqi.fsf@isnogud.escape.de> from Urs Thuermann at "Feb 27,
 2001 04:23:33 pm"
Date: Tue, 27 Feb 2001 10:02:47 -0700 (MST)
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
List-Id: <linux-lvm.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Urs writes:
> After having decided that the performance problem I described in the
> other thread in this ML are probably not that important for me, I
> tried to create an ext2 fs with 1024 byte blocks on a 1 GB LV.
> 
> But I can't mount it after creating the fs.  I can mount it if I
> create it on sda5 instead of the LV, or if I choose 4K block size.
> 
>     isnogud:/root# mount /dev/vg0/test /mnt
>     mount: wrong fs type, bad option, bad superblock on /dev/vg0/test,
>     	   or too many mounted file systems

What does it say in the syslog?  This will tell you why ext2 thinks it
can't mount, and will give us a clue on how to fix LVM.  I'm guessing
that when ext2 tries to set the blocksize to 1k it fails.

Cheers, Andreas
-- 
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
