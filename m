Return-Path: <Stefan.Giessler@netshare.de>
Message-ID: <20010815211548.A2456@nshhvrnbk013.netshare.ag>
From: "STEFANG(GMX)" <sgiessler@gmx.net>
Subject: Re: [linux-lvm] Why can't I get more bandwidth by adding more dis
	ks?
Date: Wed, 15 Aug 2001 21:15:48 +0200
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

Hallo list,

on Fri, 10 Aug 2001, James Mello (kingjamm@colltech.com) wrote:

> In this case instead of writing seqentially, you can use an a random call
> followed by an fseek to write a block or block(s) to a relatively random
> location. If I can get some time, I'll try to write something up. But I'd
> venture to say that someone out there has written a tool that already does
> this. Perhaps a google search may be in order.

If you don't mind, to do the test's on a filesystem (instead of raw
IO) you can use bonnie.  Raw IO benchmarks usually only matter for
Databases installed on raw devices...   For practical considerations
a filesystem and bonnie seem more appropriate.

CU,
   Stefan
-- 
Stefan Giessler                                       e-mail:
sgiessler@gmx.net

I'd never join any club that would have the likes of me as a member.
                                                                -- Groucho
Marx
