Return-Path: <chewie@wookimus.net>
Subject: Re: [linux-lvm] LVM 1.0 release decision 
In-Reply-To: Your message of "Wed, 16 May 2001 11:19:03 -0000."
             <20010516111903.E11984@sistina.com> 
References: <3AFC42EB.2910DAAE@wrkhors.com> <Pine.LNX.4.21.0105132046150.5468-100000@imladris.rielhome.conectiva>  <20010516111903.E11984@sistina.com> 
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <2378.990026612.1@wookimus.net>
Date: Wed, 16 May 2001 10:23:33 -0500
From: "Chad C. Walstrom" <chewie@wookimus.net>
Message-Id: <20010516152333.2A16C183F3@skuld.wk>
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
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

In message <20010516111903.E11984@sistina.com>, "Heinz J. Mauelshagen" writes:
> A little trust to accept a bigger patch *and* to sort pending issues
> out with the help of the community afterwards is a valid approach
> IMO to get faster to the point of an updated vanilla LVM driver than
> with the tiny patches approach.

Ahh.  OK.  I'm caught up on the situation now. ;-)  So Linus et. al.
are jumpy about a large patch to the kernel.  Not surprising.  Also
very frustrating for the end-user to know that tested and successful
code cannot be incorporated into the mainstream kernel en`masse,
rather it must be added piecemeal.  

With each version of LVM, bugs were fixed, interoperability was
improved, and stability was increased.  Will piecemealing these
changes into the "kernel proper" sacrifice these improvements for the
sake of trust?

I can appreciate the caution that Linus et. al. would prefer to
maintain, but if partial solutions break things just to get to the end
of the race, I'm not sure it's worth strapping on the running shoes.

I would second Heinz' view.

If it doesn't go your way, Heinz and crew, we appreciate all the hard
work you're doing.  When all is said and done, take some time off. ;-)
Grab a beer, some sun, and a much deserved vacation.

--
Chad Walstrom <chewie@wookimus.net>                 | a.k.a. ^chewie
http://www.wookimus.net/                            | s.k.a. gunnarr
Key fingerprint = B4AB D627 9CBD 687E 7A31  1950 0CC7 0B18 206C 5AFD
