Message-ID: <392048A3.BA78B2A3@ednet.ns.ca>
Date: Mon, 15 May 2000 15:57:40 -0300
From: Patrick Boutilier <boutilpj@ednet.ns.ca>
MIME-Version: 1.0
Subject: Re: [linux-lvm] How can activate the LVM in start
References: <00a201bfbe75$7395a020$4b1f04d5@migue> <20000515194742.A1442@home.ds9a.nl>
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@msede.com

Or stick it in your system startup files like /etc/rc.d/rc.sysinit on REdHat
Linux.


bert hubert wrote:

> On Mon, May 15, 2000 at 03:57:02PM +0200, Miguel Angel wrote:
>
> > When I restart de computer I have to execute "vgchange -a y " to activate
> > /dev/mi_vg . How can I activate it at the start ?
>
> That's life, you need to activate it manually.
>
> --
>                        |              http://www.rent-a-nerd.nl
>                        |                     - U N I X -
>                        |          Inspice et cautus eris - D11T'95
