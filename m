Message-ID: <003401c20c0f$23a7afb0$0300000a@STATION>
From: "Aslak Sommerfelt Skretting" <aslak@skretting.org>
References: <000001c20c0c$e4b7b220$0201a8c0@fosi>
Subject: Re: [linux-lvm] EXT2 to EXT3 LVM volume on Redhat
MIME-Version: 1.0
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
Date: Tue Jun  4 16:29:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

This journal=data you talk about, is this an option to be used with the
'mount' command?

----- Original Message -----
From: "Steve Wray" <steve.wray@paradise.net.nz>
To: <linux-lvm@sistina.com>
Sent: Tuesday, June 04, 2002 11:15 PM
Subject: RE: [linux-lvm] EXT2 to EXT3 LVM volume on Redhat


> > From: linux-lvm-admin@sistina.com
> > [mailto:linux-lvm-admin@sistina.com] On Behalf Of Aslak
> >
> > Hi again, and thanks for your quick reply!
> >
> > >----- Original Message -----
> > >From: "Ben Lutgens" <blutgens@sistina.com>
> [big snip]
> > >Don't presume that because it's EXT3 that fscks are no longer
> > >necessary. Only thing the journal guarantees is that your metadata
> > >won't become corrupt (i think journal=data mount option fixes this
> but
> > >will affect performance and not neccessarily badly). If your
> filesystem
> > >has been shutdown cleanly many many times you could still has some
> > >loss. A fsck should take care of that.
>
> Yup journal=data is fantastic; I wouldn't be without it
> on the volume that holds the home directories!
> I tend to allocate filesystems based on functionality;
> tmp gets ext2 cos its fast,
> places like /var/spool get XFS cos it can be grown
> in a pinch.
>
>
>
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
>
>
