Return-Path: <mark@bobak.net>
Date: Sun, 24 Jun 2001 17:57:38 -0400 (EDT)
From: "Mark J. Bobak" <mark@bobak.net>
Subject: Re: [linux-lvm] LVM configuration question....
In-Reply-To: <20010624234800.B7709@dragon.blacknet.de>
Message-ID: <Pine.LNX.4.33.0106241757150.4832-100000@bobak.net>
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
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Thanks Goetz.  I'll give it a try!

-Mark

On Sun, 24 Jun 2001, Goetz Bock wrote:

>
> On Sun, Jun 24 '01 at 17:30, Mark J. Bobak wrote:
> > # pvcreate /dev/sdc
> > pvcreate -- device "/dev/sdc" has a partition table
> >
> > So, can anyone offer me a clue as to the problem?
> Well, you can force pvcreate to use /dev/sdc, but you should not.
> use fdisk to make one partition (/dev/sdc1) with the full capacity of
> /dev/sdc and make it as LVM (type: 8e). Than use pvcreate /dev/sdc1
> (this marks sdc1 as a PV) and add it to the VG as described in the
> whitepaper/faq.
>
>     Goetz.
>
