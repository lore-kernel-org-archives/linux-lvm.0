Return-Path: <j.e.s.de.jong@freeler.nl>
Message-ID: <3A2BA6C4.A752DBE8@freeler.nl>
Date: Mon, 04 Dec 2000 15:14:28 +0100
From: Jorg de Jong <j.e.s.de.jong@freeler.nl>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Using Oracle with lvm AND rawio: read(512) from
References: <200012020529.WAA00876@lynx.turbolabs.com> <3A298498.86AB907B@tls.msk.ru> <3A29A31E.BC6A6243@tls.msk.ru> <3A2B58EA.71F92196@tls.msk.ru>
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

"Michael Ju. Tokarev" wrote:
> 

Hi Michael, 

I had a look at you original message and I found two things;

- the man page of raw says that you can not use dd on a raw device !?!
- further more I suspect that it might be the case that our logical volume is
to small to create the requested table on.

The oracle documentation says on the subject :

>Raw Device Setup
>
>Keep in mind the following items when creating raw devices: 
>
>    When creating the volumes, ensure that the owner and group are oracle and oinstall, respectively. 
>
>     The size of an Oracle datafile created in a raw partition must be at least two Oracle block sizes smaller than the size of the
>     raw partition. 


-- 
Jorg de Jong
Work : mailto:jorg.de.jong@ict.nl 
Play : mailto:j.e.s.de.jong@freeler.nl
