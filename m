Return-Path: <patrick@tykepenguin.cix.co.uk>
Date: Mon, 2 Apr 2001 15:27:47 +0100
From: Patrick Caulfield <caulfield@sistina.com>
Subject: Re: [linux-lvm] lvcreate error
Message-ID: <20010402152747.A512@tykepenguin.com>
References: <Pine.LNX.4.21.0104011921510.3969-100000@rdb.linux-help.org>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.21.0104011921510.3969-100000@rdb.linux-help.org>; from ardy@rdb.linux-help.org on Sun, Apr 01, 2001 at 07:32:51PM -0400
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

On Sun, Apr 01, 2001 at 07:32:51PM -0400, ardy@rdb.linux-help.org wrote:
> I'm trying to add a seventh logical volume on a two-disk, striped volume
> group. vgdisplay shows the following:
> 
> I've redone this system, and the only difference is that I'm striping this
> time. I was capable of creating more logical volumes when I wasn't
> striping. Also, I could create a seventh volume using 3900MB, but not
> 4000MB.

When you create a striped LV of 4g you will need 2g free on both disks. You can
check this with pvscan.


patrick
