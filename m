Return-Path: <wichert@cistron.nl>
Date: Fri, 27 Jul 2001 13:31:17 +0200
From: Wichert Akkerman <wichert@cistron.nl>
Subject: Re: [linux-lvm] File System type on (LVM) partition
Message-ID: <20010727133117.A29848@cistron.nl>
References: <3B61138B.DEEBA1D9@atix.de>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3B61138B.DEEBA1D9@atix.de>; from julien@atix.de on Fri, Jul 27, 2001 at 09:08:59AM +0200
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

Previously Julien Baboud wrote:
>  is there a way to know the file system type installed on a partition
> (wich could be of LVM type or not)

You completely missed our point. LVM is *not* a filesystem. It is a layer
you can put on top of physical storage, and on top of LVM you can create
logical volumes which contain filesystems.

Now if your real question is: how can you check if a block device (ie
a storage device) contains a PV (Physical Volume, the lowest layer in
a LVM setup) I suspect there is some magic value on the disk you could
check for.

Someone should probably write some file(1) magic for it :)

Wichert.

-- 
  _________________________________________________________________
 /       Nothing is fool-proof to a sufficiently talented fool     \
| wichert@wiggy.net                   http://www.liacs.nl/~wichert/ |
| 1024D/2FA3BC2D 576E 100B 518D 2F16 36B0  2805 3CB8 9250 2FA3 BC2D |
