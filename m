Return-Path: <thornber@btconnect.com>
Date: Thu, 26 Jul 2001 23:24:53 +0100
Subject: Re: [linux-lvm] Nasty bug in lvm and/or md and/or reiserfs
Message-ID: <20010726232453.A1209@btconnect.com>
References: <20010726131928.D1779@linux.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20010726131928.D1779@linux.com>; from tack@linux.com on Thu, Jul 26, 2001 at 01:19:28PM -0400
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

On Thu, Jul 26, 2001 at 01:19:28PM -0400, Jason Tackaberry wrote:
> I have discovered one or more severe bugs in any or all of lvm, md, and
> reiserfs.  I'm not a kernel guy and I don't claim to know how these
> things are supposed to interact at that level, so I'm not going to point
> fingers.  Instead, here's what happened and I'll let you decide. :)
> 
> The problem surfaces when you create a volume group with lvm and include
> a partition that happens to be mounted.

This was a stupid thing to do; and yes we should probably check to see
if anyone else has the pv open when we do a pvcreate.  I will look into
it to see how much code needs to be changed.

pvcreate would have stamped it's own metadata over md's metadata, so
I'm not surprised md had trouble.  This is not a bug in md or
reiserfs, just user error that LVM should have caught.

- Joe
