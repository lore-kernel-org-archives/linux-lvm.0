Subject: Re: [linux-lvm] LVM and SPL 
In-Reply-To: Message from Rob Latham <rlatham@plogic.com> 
   of "Fri, 31 Aug 2001 08:40:53 EDT." <20010831084053.A24948@otto.plogic.internal> 
Mime-Version: 1.0
Date: Fri, 31 Aug 2001 11:11:18 -0700
From: "Michael J. Declerck" <declerck@sistina.com>
Message-Id: <20010831181118.4F4BE32643@spook>
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

I'll preface this with the statement that I am not a lawyer (nor do I have
a desire to become one).


rlatham@plogic.com said:
> sistina this week switched the license for the GFS tools from the GPL
> to the SPL 

> http://www.sistina.com/Sistina%20Public%20License%201.0.pdf 

> I'm worried now that Sistina will switch the license for LVM. However,
> considering there was almost a fork of the project (mostly) because of
> something as "simple" as mailing list policy, i guess openLVM would
> pop up again pretty quickly in that case...   Is it concievable that
> the kernel patches will stay GPL'ed but a more restrictive license
> applied to the userspace tools ? 

LVM is GPL'ed and the copyright is held by a number of entities that have
contributed substantial pieces of code to the project over its life. IMO,
this makes it impossible to relicense LVM under a different license.

Sistina has no intention of changing the existing LVM user-space tools to
another license.  The LVM kernel patches and use-space tools will remain under
the GPL.

As I said earlier, LVM is GPL'ed and has multiple copyright holders currently
that protect its position as a GPL project.  Sistina is committed to
maintaining this status and working with the LVM community to enhance and
maintain it.


---
Michael Declerck, declerck@sistina.com   +1.510.823.7991
