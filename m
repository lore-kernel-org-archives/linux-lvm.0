Message-ID: <3DB54B39.64208BCC@silicide.dk>
From: Jon Bendtsen <jon+lvm@silicide.dk>
MIME-Version: 1.0
Subject: Re: [linux-lvm] lvm -- lvm_chr_ioctl: unknown command 0x8004fe97
References: <3DB3BDA4.75B552B6@silicide.dk> <20021021151240.GG838@tykepenguin.com> <3DB537AB.642A6854@silicide.dk> <20021022114410.GC1154@tykepenguin.com>
Content-Transfer-Encoding: 7bit
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
Date: Tue Oct 22 07:58:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Patrick Caulfield wrote:
> 
> On Tue, Oct 22, 2002 at 01:34:04PM +0200, Jon Bendtsen wrote:
> > Patrick Caulfield wrote:


[cut]


> > More than one. vgchange -a y <VG>
> > lvremove (snapshopts)
> 
> It does sound a lot like an "odd" lvm toolset (or perhaps library) that's
> interfering. It's worth checking whicg vgchange (etc) command is being run (ie
> is there one in /usr/local or /usr/sbin that's earlier in the PATH than the
> "real" one. Also do "ldd" in the library to see which library is being picked
> up.

i think it was the debian packages, because it stopped after removing
the
debian packages and make;make install
the lvm-1.1-rc2



JonB
