Return-Path: <mjt@tls.msk.ru>
Message-ID: <3A2BADF1.A12C700A@tls.msk.ru>
Date: Mon, 04 Dec 2000 17:45:05 +0300
From: Michael Tokarev <mjt@tls.msk.ru>
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
[]
> 
> Hm.  The same definitions are in 2.4-pre kernel patch...
> So 2.4 lvm should also *not* work for 512-byte i/o size.
> But Jorg de Jong claims that he successefully created
> tablespace on raw dev with 2.4-pre11 kernel... I'm
> confused...  And for S390 -- is smallest i/o size 4K ?!

Changed BLOCK_SIZE to 512 (from 1024) and recompiled.
Lvm won't work anymore at all, any i/o (read/write) on
any lv gives "no such device or address" error...

Any ideas? :(((

Regards,
 Michael.
