Return-Path: <patrick@tykepenguin.cix.co.uk>
Date: Tue, 15 May 2001 13:13:57 +0100
From: Patrick Caulfield <caulfield@sistina.com>
Subject: Re: [linux-lvm] LVM and *bad* performance (no striping)
Message-ID: <20010515131357.D524@tykepenguin.com>
References: <200104111949.f3BJnFHt014761@webber.adilger.int> <m2n18eygvs.fsf@isnogud.escape.de>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <m2n18eygvs.fsf@isnogud.escape.de>; from urs@isnogud.escape.de on Tue, May 15, 2001 at 01:46:15PM +0200
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

On Tue, May 15, 2001 at 01:46:15PM +0200, Urs Thuermann wrote:
> 
> And am I really the only one who sees this?  I would really be
> interested to hear from some more people about performance for their
> LVM.

I think one problem is that your "benchmarks" are not very realistic. In 
real world use the overhead of LVM is very small. I would respectfully suggest
that you try something like bonnie++ before getting too worried about the 
performance of LVM on your machine - unless you spend most of your day doing
"dd" to your disks :-)

Here are some bonnie++ benchmarks of a disk partition and and LV (same disk)
using reiserfs* on my machine:


Disk Partition:
Version 1.00g       ------Sequential Output------ --Sequential Input- --Random-
                    -Per Chr- --Block-- -Rewrite- -Per Chr- --Block-- --Seeks--
Machine        Size K/sec %CP K/sec %CP K/sec %CP K/sec %CP K/sec %CP  /sec %CP
tyke           496M 10462  98 20675  53  7699  20 11707  96 17808  16 257.0   1
                    ------Sequential Create------ --------Random Create--------
                    -Create-- --Read--- -Delete-- -Create-- --Read--- -Delete--
              files  /sec %CP  /sec %CP  /sec %CP  /sec %CP  /sec %CP  /sec %CP
                 16  8426 100 +++++ +++ 12622 100  8031 100 +++++ +++  9635 100

Logical Volume:
Version 1.00g       ------Sequential Output------ --Sequential Input- --Random-
                    -Per Chr- --Block-- -Rewrite- -Per Chr- --Block-- --Seeks--
Machine        Size K/sec %CP K/sec %CP K/sec %CP K/sec %CP K/sec %CP  /sec %CP
tyke           496M 10577 100 20631  52  7739  20 11676  96 17622  17 260.7   1
                    ------Sequential Create------ --------Random Create--------
                    -Create-- --Read--- -Delete-- -Create-- --Read--- -Delete--
              files  /sec %CP  /sec %CP  /sec %CP  /sec %CP  /sec %CP  /sec %CP
                 16  8521 100 +++++ +++ 12661  99  8007 100 +++++ +++  9555  99


patrick

* ext2 is comparable, just the numbers are different.
