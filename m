Return-Path: <terjekv@ifi.uio.no>
Subject: Re: [linux-lvm] Writing forward compatible applications using /proc
References: <20010811235718.A20414@linux.com>
From: Terje Kvernes <terjekv@math.uio.no>
Date: 13 Aug 2001 11:10:43 +0200
In-Reply-To: Jason Tackaberry's message of "Sat, 11 Aug 2001 23:57:18 -0400"
Message-ID: <wxxhevctje4.fsf@nommo.uio.no>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Jason Tackaberry <tack@linux.com> writes:

> I have some ideas for a comprehensive GUI disk administration tool,
> and I am first thinking about some of the issues I'll face regarding
> interfacing with controllers, disks, partitions, md, and LVM.

  cool. I've written a perl module to interface LVM via /proc. if
  you're interested I'll repost some of the code here. it's a backend,
  totally seperate from any representation of the data. 
 
> I am curious if it's a silly idea to write an application that
> relies on the data in /proc? 

  not really. some of the tools need special permissions to be run,
  and I _might_ want to have a quick peek at my LVM status without
  being root. besides, it's a lot cleaner (IMHO) than doing piping
  things to a process and catching the output, like the suggestion is
  atm. 

> I don't mind having to release a new update to be compatible with a
> new format in /proc every once and a while, but if it's constantly a
> moving target I may want to look at alternatives.

  you'll have to keep somethings in mind, before 0.9.1 beta 8 the PV's
  listed in /proc only had their basename listed. using devfs this
  could break badly, as you'd get easily get two identical
  identifiers. so you'd still have to check what data you're getting
  and see what you can, or more importantly can't, do.
 
> I also have the same question with LVM related tools. Is it sane to
> try to wrap a GUI around lvm tools or is there some API approach
> that would be better?

  I've wrapped the tools to do the dirtywork. as in, I use create a
  lvextend-command when someone does a "$lv->size('+1G')". 

-- 
Terje
