Return-Path: <adilger@turbolinux.com>
From: Andreas Dilger <adilger@turbolinux.com>
Message-Id: <200104042156.f34Lu8110316@webber.adilger.int>
Subject: Re: [linux-lvm] vgscan -- no volume groups found
In-Reply-To: <005e01c0bd4b$12bdcf40$0400a8c0@ci696011a.lxintn1.ky.home.com> from
 Jonathan DeHaan at "Apr 4, 2001 05:06:09 pm"
Date: Wed, 4 Apr 2001 15:56:08 -0600 (MDT)
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

Jonathan DeHaan writes:
> beta 6 tools vgscan seems to work, and with a beta6 kernel, I am finally

Yes, I know.  I have submitted a patch for this already.

> back into my system. However, I cannot mount loop devices. losetup works,
> but mount fails with no messages, and it's process cannot be killed even
> with kill -9. ps lists it's state as D (uninterruptable sleep). Any ideas?

If you have 2.4.2 then this is a bug in the kernel.  I think it is fixed
in 2.4.3.  I just had the same problem this afternoon.

Cheers, Andreas
-- 
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
