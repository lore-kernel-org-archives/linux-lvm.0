From: Patrick Caulfield <caulfield@sistina.com>
Subject: Re: [linux-lvm] lvm and fai
Message-ID: <20030204142604.GE1185@tykepenguin.com>
References: <20030129151209.GB2200@elrond.lohmann-services.de> <20030129151819.GE802@tykepenguin.com> <20030129153229.GC2200@elrond.lohmann-services.de> <20030129154207.GF802@tykepenguin.com> <20030129155936.GA2428@elrond.lohmann-services.de> <20030129160958.GG802@tykepenguin.com> <3E3FC8F6.5050405@ibourgogne.net>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3E3FC8F6.5050405@ibourgogne.net>
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
Date: Tue Feb  4 08:26:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Tue, Feb 04, 2003 at 03:06:46PM +0100, S?bastien GALLET wrote:
> Hello guys,
> This message is for the debian maintainer of lvm package.
> I've got a little problem using fai (Fully Automatic Installation) and lvm.
> My server runs lvm.
> When creating fai-nfsroot (using debootstrap) with lvm activated, 
> debootstrap stops with this message :
> 
> # vgcfgbackup -- ERROR: VGDA in kernel and lvmtab are NOT consistent; 
> please run vgscan
> # dpkg: error processing lvm10 (--configure):
> # subprocess post-installation script returned error exit status 98
> # Errors were encountered while processing:
> # lvm10
> 
> I suppose that my server configuration interferes with the one in 
> debootstrap.
> 
> Why include vgcfgbackup in postinst scripts ? Is it possible do it in 
> "silent" mode even if there's errors ?
> 

The reason that vgcfgbackup is run is to make upgrades as painless as
possible by ensuring that people have the latest metadata backups available
(you'd be surprised how many people have been hit by that).

I'm not familiar with fai so I'm not sure what is actually happening here. I
suppose the metadata backups in the chroot are different to what the host
machine is really using but I'm not sure how they got there in the first place
or what they are based on. Maybe you could copy the server's metadata backups
into the chroot to get around the problem (it shouldn't interfere with the
target system as it will do a vgscan when it first boots up).

Another thing you could do is build a customised package without the
vgcfgbackup in postinst (that's easier than it sounds, simply apt-get source
lvm10, edit lvm10-<version>/debian/lvm.postinst, then dpkg-buildpackage
-rfakeroot)

-- 

patrick
