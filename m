Return-Path: <bluca@comedia.it>
Date: Sat, 4 Aug 2001 17:40:49 +0200
From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] LVM with multi-path disks?
Message-ID: <20010804174049.B564@colombina.comedia.it>
References: <3B6B30C4.B4427F3D@cup.hp.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3B6B30C4.B4427F3D@cup.hp.com>; from defranco@cup.hp.com on Fri, Aug 03, 2001 at 04:16:20PM -0700
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

On Fri, Aug 03, 2001 at 04:16:20PM -0700, John DeFranco wrote:
> Does LVM work with multi-path disks? For example I have
> a fibre channel configuration in which I have two paths
> to each disk. I pvcreate a disk and am able to use it
> within a vg but when I reboot and do a vgscan, lvm cannot
> find any vg's. If I remove the second path lvm can see
> the vg fine.

John, there is an addition for multi-path to the md driver
you can fetch it from the redhat source kernel rpm.
you can then stack lvm on top of md to achieve your goal

Regards,
Luca

-- 
Luca Berra -- bluca@comedia.it
        Communication Media & Services S.r.l.
 /"\
 \ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
 / \
