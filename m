Return-Path: <patrick@tykepenguin.cix.co.uk>
Date: Wed, 16 May 2001 15:03:32 +0100
From: Patrick Caulfield <caulfield@sistina.com>
Subject: Re: [linux-lvm] RE: Problem adding pv to vg
Message-ID: <20010516150332.D552@tykepenguin.com>
References: <Pine.LNX.4.31L2.0105160700300.28712-100000@theendoftime.net>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.31L2.0105160700300.28712-100000@theendoftime.net>; from fox@theendoftime.net on Wed, May 16, 2001 at 07:01:44AM -0600
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

On Wed, May 16, 2001 at 07:01:44AM -0600, fox@theendoftime.net wrote:
> Hi;
> 
> Turns out a reboot fixed this problem.  I didn't think to run with debug,
> but if this occurs again, I will do that.

In that case it could have been the partition table update. Did you run fdisk
just before the pvcreate ?

If you get the message "device is busy" when leaving fdisk then a reboot is
usually needed to get the kernel to re-read the new partition table.

patrick
