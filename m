Return-Path: <seawolf@attglobal.net>
Message-ID: <3ACB8FF2.C4CB446C@attglobal.net>
Date: Wed, 04 Apr 2001 17:19:46 -0400
From: Les Hazelton <seawolf@attglobal.net>
MIME-Version: 1.0
Subject: Re: [linux-lvm] vgscan -- no volume groups found
References: <005e01c0bd4b$12bdcf40$0400a8c0@ci696011a.lxintn1.ky.home.com>
Content-Transfer-Encoding: 7bit
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
To: linux-lvm@sistina.com

Jonathan DeHaan wrote:
> 
> beta 6 tools vgscan seems to work, and with a beta6 kernel, I am finally
> back into my system. However, I cannot mount loop devices. losetup works,
> but mount fails with no messages, and it's process cannot be killed even
> with kill -9. ps lists it's state as D (uninterruptable sleep). Any ideas?
> 
----  snip ----

This sounds like a 2.4.2 kernel.  I had the same problem with that
kernel.  Loopback is broken in that kernel.  When I moved to the 2.4.3
kernel the problem was corrected.

> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm

-- 

Good Journey, longevity and prosperity to all

Les Hazelton
