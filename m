From: Patrick Caulfield <caulfield@sistina.com>
Subject: Re: [linux-lvm] lvm -- lvm_chr_ioctl: unknown command 0x8004fe97
Message-ID: <20021022114410.GC1154@tykepenguin.com>
References: <3DB3BDA4.75B552B6@silicide.dk> <20021021151240.GG838@tykepenguin.com> <3DB537AB.642A6854@silicide.dk>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3DB537AB.642A6854@silicide.dk>
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
Date: Tue Oct 22 06:45:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Tue, Oct 22, 2002 at 01:34:04PM +0200, Jon Bendtsen wrote:
> Patrick Caulfield wrote:
>  
> [cut]
> 
> > You really don't want to do that... 1.1 is well broken.
> 
> uhoh, i'm already doing it, not production yet, but soon.
> I figured that the latest from oktober 3, 1.1-rc2 would be
> good enough.
> 
> 
> > > and removing those debian packages.
> > 
> > The Debian packages should be fine. Plenty of other people are using them.
> > 
> > Can you tell which command is issued the illegal ioctl ? It could be that the
> > LVM device has a wrong major/minor or something else has take the LVM
> > major/minor device number, because those are /not/ LVM ioctl numbers.
> 
> More than one. vgchange -a y <VG>
> lvremove (snapshopts)
 
It does sound a lot like an "odd" lvm toolset (or perhaps library) that's
interfering. It's worth checking whicg vgchange (etc) command is being run (ie
is there one in /usr/local or /usr/sbin that's earlier in the PATH than the
"real" one. Also do "ldd" in the library to see which library is being picked
up. 

 
patrick
