Return-Path: <thornber@btconnect.com>
Date: Thu, 26 Jul 2001 13:39:38 +0100
Subject: Re: [linux-lvm] Some ideas regarding snapshots (was: Reiserfs, 2.4.7, snapshots w/ 0.9)
Message-ID: <20010726133938.A723@btconnect.com>
References: <20010725103640.J5363@unirez.com> <01072511465701.00921@exodus> <20010726135514.B26425@tiger.bigcats.invalid>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20010726135514.B26425@tiger.bigcats.invalid>; from weissel@netcologne.de on Thu, Jul 26, 2001 at 01:55:14PM +0200
From: Joe Thornber <thornber@btconnect.com>
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

On Thu, Jul 26, 2001 at 01:55:14PM +0200, Wolfgang Weisselberg wrote:
> Iain Campbell (iain@sandon.ca) wrote 64 lines:
> > Quote from Teigland and Mauelshagens's Volume Manager whitepaper:
> 
> > journalled file system. These operations (fsck or journal replay) require 
> > writing to  the snapshot ligical volume, which is not allowed."
> 
> On a related subject: would it be possible to have a writable
> snapshot (probably a 'reverse' snapshot)?

Writeable snapshot's are easy to implement, I believe someone has
already made a patch for the current LVM series (search the list).  I
certainly intend putting it into the experimental LVM branch soon.

- Joe
