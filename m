Message-ID: <3BBC90C9.309A3D75@ti.com>
Date: Thu, 04 Oct 2001 18:39:37 +0200
From: christian e <cej@ti.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] lvm 1.0 and kernel 2.2.19.Is rawio patch necessary ??
References: <3BBC550E.442F190C@ti.com> <3BBC7C22.1119BF0@promofinarsa.es>
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

Jesus Manuel NAVARRO LOPEZ wrote:


> Well, I'm in same position than you, but having problems.
> I also asked about the necesity of raw-io patches (specifically for
> 2.2.19) but till the moment no answer.

This concerns me if it's so important to patch with someone ought to
know..
I'm not keen on rolling this setup into production if I don't know the
consequences of not having a rawio patch applied (if any).



> Well, I patched kernel with raw-io for 2.2.18, and then with the lvm
> patch provided by ./configure then make at PATCHES, but my kernel didn't
> compile (well, the kernel did, but the make modules failed).

I think I'll try the 2.2.18 patch as well..Will let you all know if it
turned out ok or not..


> 
> So, from your experience I'm going to try to compile *without* the
> raw-io patch and see what happens.  Anyway, since I know that at least
> your compilation was ended with success, would you be kind enough to
> e-mail me your configuration file (/usr/src/linux/.config) to look for
> differencies?

You've got mail :-)

> 
> And, if you know about the reason or necesity (or lack of) the raw-io
> patch stuff, please post it to the list, so others like will know.
> TIA
>

So far I haven't found out..If someone could enlighten us ,please ??

best regards

Christian
