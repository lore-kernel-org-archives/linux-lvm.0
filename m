Return-Path: <7ab29702063ed6e05fc76617c7eed80c@interlinx.bc.ca>
Date: Sun, 24 Jun 2001 15:32:17 -0700
Subject: Re: [linux-lvm] LVM configuration question....
Message-ID: <20010624153217.K2299@pc.ilinx>
References: <Pine.LNX.4.33.0106241729370.4554-100000@bobak.net> <20010624234800.B7709@dragon.blacknet.de>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20010624234800.B7709@dragon.blacknet.de>
From: "Brian J. Murrell" <lvm@interlinx.bc.ca>
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

On Sun, Jun 24, 2001 at 11:48:00PM +0200, Goetz Bock wrote:
> 
> On Sun, Jun 24 '01 at 17:30, Mark J. Bobak wrote:
> > # pvcreate /dev/sdc
> > pvcreate -- device "/dev/sdc" has a partition table
> > 
> > So, can anyone offer me a clue as to the problem?
> Well, you can force pvcreate to use /dev/sdc, but you should not.

Why not?  I thought for non-system (i.e. boot) disks this was
perfectly acceptable.

b.
