From: Daniel Gardner <daniel@danielgardner.org>
Subject: Re: [linux-lvm] vgcreate -- no valid physical volumes in command line
References: <Pine.LNX.4.44.0209081648320.15938-100000@server.piarista-kkt.sulinet.hu>
In-Reply-To: <Pine.LNX.4.44.0209081648320.15938-100000@server.piarista-kkt.sulinet.hu>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Message-Id: <200209081603.53176.daniel@danielgardner.org>
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
Date: Sun Sep  8 10:10:06 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

On Sunday 08 September 2002 3:49 pm, NagyZ wrote:
> On Sun, 8 Sep 2002, Daniel Gardner wrote:
> > root@gentoo daniel # vgcreate main /dev/hda2
> > vgcreate -- no valid physical volumes in command line
>
> try:
> vgcreate main /dev/ide/host0/bus0/target0/lun0/part2
>
> are you using devfs?:)

ooooh! Shiny things :)

I've just mounted a nice new XFS filesystem, thanks so much!

Daniel
