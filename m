From: Patrick Caulfield <caulfield@sistina.com>
Subject: Re: [linux-lvm] lvm -- lvm_chr_ioctl: unknown command 0x8004fe97
Message-ID: <20021021151240.GG838@tykepenguin.com>
References: <3DB3BDA4.75B552B6@silicide.dk>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3DB3BDA4.75B552B6@silicide.dk>
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
Date: Mon Oct 21 10:13:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Mon, Oct 21, 2002 at 10:41:08AM +0200, Jon Bendtsen wrote:
> Since i want to run with ext3 and use snapshots, i applied the 
> 	linux-2.4.18-VFS-lock.patch
> to my default 2.4.18 kernel. I just did that file since making
> the patches, and applying that would fail during compilation.
> (something about md driver ?, which i dont use)
> 
> So, after just getting the VFS-lock patch to work, i've tried
> to use it on my debian woody, with 
> 	lvm-common     1.5.5
> 	lvm10          1.0.4-4
> installed. But i get alot of errors :/
> 	lvm -- lvm_chr_ioctl: unknown command 0x8004fe97
> 	lvm -- lvm_chr_ioctl: unknown command 0x8004fe97
> 	lvm -- lvm_chr_ioctl: unknown command 0x8004fe97
> 	lvm -- lvm_chr_ioctl: unknown command 0x8004fe97
> 
> And sometimes vgscan cant find my VG, and i cant activate it with
> 	vgchange -a y ...
> 
> 
> It _MIGHT_ be because i'm running lvm ontop of a loop-AES, but it does
> work most of the time.
> 
> 
> 
> JonB
> ps: right now i'm starting all over with 
> 	2.4.19
> 	lvm_1.1-rc2.tar.gz

You really don't want to do that... 1.1 is well broken.

> and removing those debian packages.

The Debian packages should be fine. Plenty of other people are using them.

Can you tell which command is issued the illegal ioctl ? It could be that the
LVM device has a wrong major/minor or something else has take the LVM
major/minor device number, because those are /not/ LVM ioctl numbers.

If you can determine what command is issuing those odd ioctls then you're
probably half-way to finding the culprit.

patrick
