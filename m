Return-Path: <misiek@pld.ORG.PL>
Subject: Re: [linux-lvm] problems with gcc 3.0 & lvm tools
References: <Pine.LNX.4.33.0106262221410.7216-100000@moon.dice.hu>
	<3B38F9ED.29BA245A@tls.msk.ru>
From: Arkadiusz Miskiewicz <misiek@pld.ORG.PL>
Date: 26 Jun 2001 23:28:50 +0200
In-Reply-To: <3B38F9ED.29BA245A@tls.msk.ru>
Message-ID: <877kxzkk19.fsf@arm.t19.ds.pwr.wroc.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Content-Type: text/plain; charset="utf-8"
To: linux-lvm@sistina.com

Michael Tokarev <mjt@tls.msk.ru> writes:

> Gergely Tamas wrote:
> > 
> > GCC 3.0 implements ``printf'' as a macro.
> 
> Why *gcc* *implements* printf at all???  It is in
> C library, not in compiler, or always was that.

glibc defines printf() as fprintf(stdout, ...) macro when it detects
compiler >= 2.97 (because gcc can optimize fprintf()), so it's not gcc
problem.

> But wait: *if* this *is* an issue, then TONS of other programs
> will break the same way.  And gcc people should just not do so,
> is is a bug (serious) in gcc in this case and should be fixed
> in a first place.

http://sources.redhat.com/ml/libc-alpha/2001-01/msg00187.html
http://sources.redhat.com/ml/libc-alpha/2001-01/msg00214.html
and whole thread
http://sources.redhat.com/ml/libc-alpha/2001-01/msg00186.html

>  Michael.

-- 
 Arkadiusz Mi�kiewicz, AM2-6BONE, 1024/3DB19BBD
 IPv6 ready PLD Linux at http://www.pld.org.pl/
My jsme Borg. Odpor je marn�, budete asimilov�ni
