From: Patrick Caulfield <caulfield@sistina.com>
Subject: Re: [linux-lvm] disk naming
Message-ID: <20030104195544.GB11424@tykepenguin.com>
References: <1041610095.19844.45.camel@mosix> <20030103174618.Z9539@zealot.blacknet.de> <1041613503.20036.49.camel@mosix> <1023440000.1041619125@[192.168.200.4]> <20030103192045.GI18613@tykepenguin.com> <1121550000.1041664663@[192.168.200.4]> <20030104100014.GA11424@tykepenguin.com> <1216750000.1041705320@[192.168.200.4]>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1216750000.1041705320@[192.168.200.4]>
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
Date: Sat Jan  4 13:55:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Sat, Jan 04, 2003 at 12:35:20PM -0600, Steven Lembark wrote:
> 
> 
> 
> Try this on a system with two scsi cards and you'll see what
> I mean: without changing anything else, switch which of the
> cards the two disk chains connect to (i.e., disks on bus0
> are now on bus1). Reboot the machine and see if it will boot
> successfully.
> 
> The UUID is bus specific.


No.

LVM puts it's OWN UUID on the disk. nothing to do with anybody elses UUID. It
travels with the disk and has nothing to do with where the disk is. Even if it's
over an NBD connection to another machine, LVM will find it and it will work.

Patrick
