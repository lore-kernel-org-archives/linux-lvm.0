Return-Path: <patrick@tykepenguin.cix.co.uk>
Date: Mon, 5 Feb 2001 11:32:58 +0000
From: Patrick Caulfield <caulfield@sistina.com>
Subject: Re: [linux-lvm] Shutdown Probs
Message-ID: <20010205113258.B525@tykepenguin.com>
References: <3A7E57E8.4DBED014@qis-systemhaus.de>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3A7E57E8.4DBED014@qis-systemhaus.de>; from heinrichs@qis-systemhaus.de on Mon, Feb 05, 2001 at 08:36:08AM +0100
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

On Mon, Feb 05, 2001 at 08:36:08AM +0100, Dirk Heinrichs wrote:
> Hi there,
> 
> I'm using lvm-0.9.1-beta3 on RH7.0 with kernel 2.4.0 and devfs.
> Everything works fine so far, but I get strange messages on shutdown.
> 
> I placed "/sbin/vgchange -a n" in /etc/init.d/halt right after
> unmounting filesystems. But I get a message like "Cannot deactivate
> volume group with open logical volumes". I then added some
> "/sbin/lvchange -a n [LogicalVolumePath]" for each lv before the the
> vgchange call. Then I get some "operation not permitted on (open)
> logical volume" messages.

My guess is that something still has a file open on one of the LVs so
it can't be unmounted by umount -a. Put a ps -ef in the script just before the
lvchange and see if you can see anything.

patrick
