From: NagyZ <nagyz@piarista-kkt.sulinet.hu>
Subject: Re: [linux-lvm] vgcreate -- no valid physical volumes in command
 line
In-Reply-To: <200209081533.59821.daniel@danielgardner.org>
Message-ID: <Pine.LNX.4.44.0209081648320.15938-100000@server.piarista-kkt.sulinet.hu>
MIME-Version: 1.0
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
Date: Sun Sep  8 09:54:00 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Sun, 8 Sep 2002, Daniel Gardner wrote:

> Hi,
[..]
> root@gentoo daniel # vgcreate main /dev/hda2
> vgcreate -- no valid physical volumes in command line
try:
vgcreate main /dev/ide/host0/bus0/target0/lun0/part2

are you using devfs?:)

NagyZ
