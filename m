Date: Wed, 17 Oct 2001 15:29:57 +0100
From: Patrick Caulfield <caulfield@sistina.com>
Subject: Re: [linux-lvm] read_intr errors
Message-ID: <20011017152957.E644@tykepenguin.com>
References: <20011016234034.B7778@sistina.com> <002601c156ed$ecc4c180$0300000a@pacbell.net>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <002601c156ed$ecc4c180$0300000a@pacbell.net>; from e@arix.com on Wed, Oct 17, 2001 at 02:27:21AM -0700
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

On Wed, Oct 17, 2001 at 02:27:21AM -0700, Erick Calder wrote:
> hi everyone, I've read a number of dialogues on the archives concerning the
> errors below which I'm getting but have not found any answers:
> 
> I'm running RedHat 7.0 (2.4.9 kernel + LVM 1.0.1rc1) on a little PIII box
> and I'm using the ide controllers built into the motherboard (drivers built
> into the kernel - not modules).  I have CONFIG_IDEDISK_MULTI_MODE set to y
> in the .config for the kernel.  The drive is an IBM-DTLA-307030 (as reported
> by /proc/ide) and is brand new.
> 
> here are the errors:
> 
> Oct 17 02:00:34 beowulf kernel: hdc: read_intr: error=0x04 {
> DriveStatusError }
> Oct 17 02:00:34 beowulf kernel: hdc: read_intr: status=0x59 { DriveReady
> SeekComplete DataRequest Error }
> Oct 17 02:00:34 beowulf kernel: hdc: read_intr: error=0x04 {
> DriveStatusError }
> Oct 17 02:00:34 beowulf kernel: ide1: reset: success
> 
> I've been moving data in and out of the drive and everything seems ok but I
> get lots of the above errors which leaves me with a queasy feeling...
> anyone know what the deal is with this?

I'm afraid they look a lot like hardware errors to me. It might just be that it
doesn't like MULTI_MODE though. I'm not an IDE expert.

patrick
