Return-Path: <joe@66bassett.freeserve.co.uk>
Date: Sat, 6 Jan 2001 22:09:22 +0000
From: Joe Thornber <joe@66bassett.freeserve.co.uk>
Subject: Re: [linux-lvm] Create a VG on a /dev/md??
Message-ID: <20010106220922.A1592@66bassett.freeserve.co.uk>
References: <5.0.0.25.0.20010106030148.00aa4e20@mail.arcologie.net>
Mime-Version: 1.0
In-Reply-To: <5.0.0.25.0.20010106030148.00aa4e20@mail.arcologie.net>; from f.brockerhoff@arcologie.net on Sat, Jan 06, 2001 at 03:14:12AM +0100
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

On Sat, Jan 06, 2001 at 03:14:12AM +0100, Falk Brockerhoff wrote:
> Hello!
> 
> I'm just installing my new Fileserver. It has to have the following goodies
> 
> - software raid - to make the data safe
> - lvm (?) to change the size of the system in both ways: increase and decrease
> 
> I have three 45G disks.
> 
> My first considering was to create to create a software-Raid-5-System and put
> a lvm-system on it. But I can only create a lvm on physical discs?!

The latest 2.2.18-lvm0.9 patch (in CVS) contains new code which will allow
LVM to stack on top of software raid.  This code has had very little
testing outside my own machine so use with caution, that said I think
it'll work fine.

You cannot stack software raid on LVM for the 2.2 kernels.

I believe LVM0.9 will happily stack on top of software raid for 2.4.

Can I re-iterate that 0.9 is beta software, if this is production
system use 0.8final.

- Joe
