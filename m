Return-Path: <lord@sgi.com>
Message-Id: <200105221248.f4MCm3c07854@jen.americas.sgi.com>
Subject: Re: [linux-lvm] Re: LVM writeable snapshot patch for use with XFS 
In-Reply-To: Message from "Heinz J. Mauelshagen" <Mauelshagen@sistina.com> 
   of "Tue, 22 May 2001 12:33:26 -0000." <20010522123326.C15681@sistina.com> 
Date: Tue, 22 May 2001 07:48:03 -0500
From: Steve Lord <lord@sgi.com>
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

> 
> Steve,
> 
> thanks for updating on this.
> 
> As I mentioned when you offered the code it will show up in post 1.0 Linux LV
> M.
> 
> Can we get in touch to sort it out of XFS once it is in post LVM 1.0?
> 
> Regards,
> Heinz    -- The LVM Guy --
> 
>

Hi Heinz, 

Hmm, there may be a little confusion here. The code I was refering to was
the code to pause and flush xfs to disk for snapshotting. This has no
dependencies on lvm, and is in the xfs tree now. The code for making 
snapshots writeable from Dale Stephenson at Connex is very lvm specific,
we could provide that as a patch to our tree until you are ready to take
it. Is this the code you are refering to? There is also the code you
already provide as a patch to make the write_super_lockfs and unlockfs
calls - is that remaining in patch form in 1.0?

Steve
