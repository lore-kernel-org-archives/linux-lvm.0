Return-Path: <scott@dixie.dyndns.org>
Date: Wed, 23 May 2001 23:46:49 -0400
From: "S. Michael Denton" <scott@dixie.dyndns.org>
Message-Id: <200105240346.f4O3knD02189@dixie.dyndns.org>
Subject: Re: [linux-lvm] Is now: Resizing & LVM shutdown
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

Yes, the docs say that online ext2 resizing is dangerous, but I think
it's just that the docs haven't been updated in some time :)
I've done several online ext2 resizes (before going to reiser) and they've
all been successful.  The only real danger lies in a crash during a resize
in progress (not a whole lot you can do with ANY filesystem there... just
hope everything is journaled properly and can be recovered).  Personally,
I just ignore the warning that it's 'dangerous' :)
