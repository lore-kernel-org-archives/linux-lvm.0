Return-Path: <tomlins@cam.org>
From: Ed Tomlinson <tomlins@cam.org>
Subject: Re: [linux-lvm] [BUG] segmentation fault on snapshot with beta8
Date: Tue, 31 Jul 2001 17:09:37 -0400
References: <20010726122738.E052917573@oscar.casa.dyndns.org> <20010727162747.9542515354@oscar.casa.dyndns.org> <20010730083550.A20819@sistina.com>
In-Reply-To: <20010730083550.A20819@sistina.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-Id: <20010731210937.CA04F6F2E@oscar.casa.dyndns.org>
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
To: linux-lvm@sistina.com, AJ Lewis <lewis@sistina.com>

On July 30, 2001 09:35 am, AJ Lewis wrote:
> On Fri, Jul 27, 2001 at 12:27:47PM -0400, Ed Tomlinson wrote:
> > My impression with the above bug is that the snapshot is filling much too
> > quickly and getting disabled.  At this point seg faults start happening.
>
> I saw some Oopses and segfaults on 2.4.6 on Friday, but after I put the kdb
> into the kernel I can't reproduce it.  I never see this with 2.4.7.
>
> This was with LVM 0.9.1 Beta8 and the patches you previously mentioned.

I have seen this happen only once here too.  It was with 2.4.7 though.  I will see
if I can get trigger it again.

Ed Tomlinson
