Return-Path: <patrick@tykepenguin.cix.co.uk>
Date: Tue, 27 Mar 2001 09:07:06 +0100
From: Patrick Caulfield <caulfield@sistina.com>
Subject: Re: [linux-lvm] LVM-0.9.1beta6, XFS and 2.4.2 ...
Message-ID: <20010327090706.B556@tykepenguin.com>
References: <008b01c0b293$2873fac0$0e01a8c0@myplace.net> <yq1lmpyrgcb.fsf@jaguar.mkp.net>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <yq1lmpyrgcb.fsf@jaguar.mkp.net>; from mkp@linuxcare.com on Wed, Mar 21, 2001 at 03:56:36PM -0500
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

On Wed, Mar 21, 2001 at 03:56:36PM -0500, Martin K. Petersen wrote:
> >>>>> "Bas" == Bas  <list@showme.wox.org> writes:
> 
> Bas> Mar 21 20:22:40 wisdom kernel: lvm -- lvm_blk_ioctl: unknown
> Bas> command 0x126e
> 
> Hmmm. That's me (XFS-specific).

Yes XFS does that - it has some private ioctls it likes to do on the block 
device that aren't implemented in LVM. Ignore it. 

The XFS patch adds support for their ioctl to the generic devices but not LVM,
but seeing as thy all retrun the same value (the default) anyway it doesn't do
much...yet.

patrick
