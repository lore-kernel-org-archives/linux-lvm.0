Return-Path: <patrick@tykepenguin.cix.co.uk>
Date: Wed, 16 May 2001 09:00:07 +0100
From: Patrick Caulfield <caulfield@sistina.com>
Subject: Re: [linux-lvm] Problems adding pv to new volume group
Message-ID: <20010516090007.A552@tykepenguin.com>
References: <Pine.LNX.4.31L2.0105151152590.25751-100000@theendoftime.net>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.31L2.0105151152590.25751-100000@theendoftime.net>; from fox@theendoftime.net on Tue, May 15, 2001 at 11:56:18AM -0600
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

On Tue, May 15, 2001 at 11:56:18AM -0600, fox@theendoftime.net wrote:
> Hi all;
> 
> [root@web /root]# pvcreate /dev/hda4
> pvcreate -- physical volume "/dev/hda4" successfully created
> 
> [root@web /root]# vgcreate apps /dev/hda4
> vgcreate -- INFO: using default physical extent size 4 MB
> vgcreate -- INFO: maximum logical volume size is 255.99 Gigabyte
> vgcreate -- ERROR "vg_write(): write" storing data of volume group "apps"
> on disk(s)

Can you run vgcreate with the -d (debug) option please ? 

patrick
