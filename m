Return-Path: <patrick@tykepenguin.cix.co.uk>
Date: Wed, 25 Apr 2001 08:39:16 +0100
From: Patrick Caulfield <caulfield@sistina.com>
Subject: Re: [linux-lvm] disk add means trouble: vgscan -- invalid i/o protocol version 5
Message-ID: <20010425083916.C806@tykepenguin.com>
References: <3ADB3B2A.B28AC133@mpi-hd.mpg.de> <20010416142849.B16508@sistina.com> <3ADF74AA.CEED3E97@mpi-hd.mpg.de> <20010420114908.C569@tykepenguin.com> <3AE5CB8F.C3449990@mpi-hd.mpg.de>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3AE5CB8F.C3449990@mpi-hd.mpg.de>; from Stefan.Helfert@mpi-hd.mpg.de on Tue, Apr 24, 2001 at 08:53:03PM +0200
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

On Tue, Apr 24, 2001 at 08:53:03PM +0200, Stefan Helfert wrote:
> Patrick Caulfield wrote:
> 
> My kernel and user tools are in sync (lvm_0.8) and my initial problem
> here is that I get the IOP message -- and I get this message out of the
> blue. No software changes, no kernel changes, nothing else except adding
> another disk drive, the configuration had been running stable since
> ages. I do not see anything here except the vgscan error, and the output
> of "vgscan -d" is here:
> 
> bash-2.04# vgscan -d                                                   
> <1> lvm_get_iop_version -- CALLED
> <22> lvm_check_special -- CALLED
> <22> lvm_check_special -- LEAVING
> <1> lvm_get_iop_version -- AFTER ioctl ret: 0 
> <1> lvm_get_iop_version -- LEAVING with ret: 5   
> vgscan -- invalid i/o protocol version 5

Sorry, but if you're getting an invalid IOP message then the kernel and tools
can't possibly be in sync, that's what "in sync" means in this context.

There's nothing that can happen just by adding a disk drive (unless it has some
other tools on it that appear in the PATH) that can cause this.

All I can suggest is that you download the user tools that match your kernel and
rebuild them.

patrick
