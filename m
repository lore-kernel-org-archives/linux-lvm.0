Return-Path: <adilger@turbolinux.com>
From: Andreas Dilger <adilger@turbolinux.com>
Message-Id: <200106052048.f55KmDgu005844@webber.adilger.int>
Subject: Re: [linux-lvm] Does LVM support ext2 filesystem?
In-Reply-To: <991770222.3b1d366e29932@www.etfal.g12.br> =?US-ASCII?Q?from_Leandro_Sales_-_Estagi=E1rio_GTI_at_Jun_5=2C_2001_04=3A43=3A?=
 =?US-ASCII?Q?42_pm?=
Date: Tue, 5 Jun 2001 14:48:13 -0600 (MDT)
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

Leandro writes:
>   I'd like to know if LVM support ext2 filesystem? With a logical volume in 
> use, can I resize the partition or I have to umount my LVM Volume?

You need to have a kernel patch, and user tools to do online (mounted)
resizing of an ext2 filesystem.
See http://sourceforge.net/projects/ext2resize/

Once you have this patch and user tools, then e2fsadm will allow you to
resize a mounted ext2 filesystem.

Cheers, Andreas
-- 
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
