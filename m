Return-Path: <Jean-Eric.Cuendet@linkvest.com>
Message-ID: <B45465FD9C23D21193E90000F8D0F3DF683CC1@mailsrv.linkvest.com>
From: Jean-Eric Cuendet <Jean-Eric.Cuendet@linkvest.com>
Subject: RE: [linux-lvm] Lost filesystems on LVs (forgot the attachment)
Date: Wed, 16 May 2001 07:48:39 +0200
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
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "'linux-lvm@sistina.com'" <linux-lvm@sistina.com>

> > The superblock could not be read or does not describe a correct ext2
> > filesystem.  If the device is valid and it really contains an ext2
> > filesystem (and not swap or ufs or something else), then 
> the superblock
> > is corrupt, and you might try running e2fsck with an 
> alternate superblock:
> >     e2fsck -b 8193 <device>
> >  
> > [root@fatboy filesrv]#
> > 
> > e2fsck -b 8193 doesn't help...
> 
> Try e2fsck -b 32768 -B 4096

Thanks for the tip, but... too late...
I mke2fs the filesystem last evening. The data was not so important, so
recreating it was ~30 minites. 
But I'll be happy if someone could explain that, so it's not coming again!

Thanks for your help
-jec

> -- 
> Andreas Dilger  \ "If a man ate a pound of pasta and a pound 
> of antipasto,
>                  \  would they cancel out, leaving him still hungry?"
> http://www-mddsp.enel.ucalgary.ca/People/adilger/             
>   -- Dogbert
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> 
