Return-Path: <wichert@cistron.nl>
Date: Tue, 13 Mar 2001 23:26:26 +0100
From: Wichert Akkerman <wichert@cistron.nl>
Subject: Re: [linux-lvm] Problem with vgscan/ vgcfgrestore
Message-ID: <20010313232626.A31056@cistron.nl>
References: <20010313021438.A6401@cistron.nl> <200103130140.f2D1euw01293@webber.adilger.int>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <200103130140.f2D1euw01293@webber.adilger.int>; from adilger@turbolinux.com on Mon, Mar 12, 2001 at 06:40:56PM -0700
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

Previously Andreas Dilger wrote:
> Wichert writes:
> > I figured that out by now. I think I'll add the LVM10 ioctls to 
> > strace 4.4 actually :)
> 
> That would be nice.

Turns out this is impossible: LVM made the same mistake some of the OSS
sound drivers did and used ioctl numbers that the kernel already uses
for other purposes. This is not a problem for the kernel itself, but
means a tool like strace can't decode syscalls.

Wichert.

-- 
   ________________________________________________________________
 / Generally uninteresting signature - ignore at your convenience  \
| wichert@cistron.nl                  http://www.liacs.nl/~wichert/ |
| 1024D/2FA3BC2D 576E 100B 518D 2F16 36B0  2805 3CB8 9250 2FA3 BC2D |
