Return-Path: <patrick@tykepenguin.cix.co.uk>
Date: Thu, 19 Jul 2001 13:48:47 +0100
From: Patrick Caulfield <caulfield@sistina.com>
Subject: Re: [linux-lvm] I/O error: dev 08:11, sector 0
Message-ID: <20010719134847.E752@tykepenguin.com>
References: <20010718231729.A791@digit-safe.dyndns.org> <20010719111351.A28183@sistina.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20010719111351.A28183@sistina.com>; from Mauelshagen@sistina.com on Thu, Jul 19, 2001 at 11:13:51AM +0200
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

On Thu, Jul 19, 2001 at 11:13:51AM +0200, Heinz J. Mauelshagen wrote:
> 
> Allan,
> 
> 08:11 (/dev/sda11) shows that I/O error, you use /dev/sdb, which is 08:16
> for your VG -> no problem for LVM.
> 
> Because /dev/sda11 seems to be configured, LVM reads it on its search for
> physical volumes.
> 
> If you are not using /dev/sda11 for anything you are fine for the moment.

If the minor number is in hex that makes it /dev/sdb1 - which seems slightly
more sensible to me :-)

patrick
