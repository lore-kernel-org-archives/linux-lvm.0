Return-Path: <plamb_98@yahoo.com>
Message-ID: <20010727121801.38519.qmail@web13403.mail.yahoo.com>
Date: Fri, 27 Jul 2001 05:18:01 -0700 (PDT)
From: Pierre Lamb <plamb_98@yahoo.com>
Subject: Re: [linux-lvm] File System type on (LVM) partition
In-Reply-To: <20010727133117.A29848@cistron.nl>
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
To: linux-lvm@sistina.com

I believe the stand ext2 is 83 and lvm is 8e so one
could check for those values

Pierre
--- Wichert Akkerman <wichert@cistron.nl> wrote:
> Previously Julien Baboud wrote:
> >  is there a way to know the file system type
> installed on a partition
> > (wich could be of LVM type or not)
> 
> You completely missed our point. LVM is *not* a
> filesystem. It is a layer
> you can put on top of physical storage, and on top
> of LVM you can create
> logical volumes which contain filesystems.
> 
> Now if your real question is: how can you check if a
> block device (ie
> a storage device) contains a PV (Physical Volume,
> the lowest layer in
> a LVM setup) I suspect there is some magic value on
> the disk you could
> check for.
> 
> Someone should probably write some file(1) magic for
> it :)
> 
> Wichert.
> 
> -- 
>  
>
_________________________________________________________________
>  /       Nothing is fool-proof to a sufficiently
> talented fool     \
> | wichert@wiggy.net                  
> http://www.liacs.nl/~wichert/ |
> | 1024D/2FA3BC2D 576E 100B 518D 2F16 36B0  2805 3CB8
> 9250 2FA3 BC2D |
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at
http://www.sistina.com/lvm/Pages/howto.html


__________________________________________________
Do You Yahoo!?
Make international calls for as low as $.04/minute with Yahoo! Messenger
http://phonecard.yahoo.com/
