Return-Path: <patrick@tykepenguin.cix.co.uk>
Date: Tue, 3 Jul 2001 11:11:47 +0100
From: Patrick Caulfield <caulfield@sistina.com>
Subject: Re: [linux-lvm] vgcreate
Message-ID: <20010703111147.C1128@tykepenguin.com>
References: <01070218330601.01439@alb-66-66-254-86>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <01070218330601.01439@alb-66-66-254-86>; from heartboy@nycap.rr.com on Mon, Jul 02, 2001 at 06:33:06PM -0400
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

On Mon, Jul 02, 2001 at 06:33:06PM -0400, Joe Morris wrote:
> Hey everyone, I'm new to this list adn have a question regarding LVM.  I 
> wanted to experiment with LVM, so I went into fdisk and changed /dev/hde11's 
> type to 8e.  I then ran
> pvcreate /dev/hde11
> 
> To make sure everything went okay, I ran pvscan:
> pvscan -- inactive PV "/dev/ide/host2/bus0/target0/lun0/part11" is in no VG  
> [9.76 GB]
> 
> Things were looking up until I ran vgcreate:
> vgcreate experiment /dev/hde11
> vgcreate -- no valid physical volumes in command line  

You will have to either refer to the PV by its full devfs name, 
ie: /dev/ide/host2/bus0/target0/lun0/part11 or make sure devfs is not compiled
into the kernel (just not mounting it doesn't help).

patrick
