Return-Path: <mjt@tls.msk.ru>
Message-ID: <3A2BB554.2D83919E@tls.msk.ru>
Date: Mon, 04 Dec 2000 18:16:36 +0300
From: Michael Tokarev <mjt@tls.msk.ru>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Using Oracle with lvm AND rawio: read(512) from
References: <200012020529.WAA00876@lynx.turbolabs.com> <3A298498.86AB907B@tls.msk.ru> <3A29A31E.BC6A6243@tls.msk.ru> <3A2B58EA.71F92196@tls.msk.ru> <3A2BADF1.A12C700A@tls.msk.ru>
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

Michael Tokarev wrote:
> 
[]
> 
> Changed BLOCK_SIZE to 512 (from 1024) and recompiled.
> Lvm won't work anymore at all, any i/o (read/write) on
> any lv gives "no such device or address" error...
> 
> Any ideas? :(((

Oh, my bad, I'm sorry!..  It worked with BLOCK_SIZE=512, I forgot to
vgchange -ay !

So, with BLOCK_SIZE=512, it is ok, and dd ... bs=512 is also ok.
With 1024, it won't work with invalid argument.

What I noticied also is that regardless of actual block size
used in lvm, stat() on raw device on top of it reports
st_blksize=4096 (not 512 nor 1024) -- is this Ok?

And -- Jorg de Jong, can you please strace the ts creation
process?  I'm very interested on i/o buffer sizes used there.

If e.g. your ORACLE_SID=orcl, do the following:

  oracle> sqlplus internal/
  SQL>

then in other window/terminal, find pid of "oracleorcl"
(oracle$ORACLE_SID) process started by sqlplus:
  # ps -fu oracle
  ...
  oracle   14343 13857  0 18:02 pts/3    00:00:00 sqlplus
  oracle   14344 14343  0 18:02 ?        00:00:00 oracleorcl (DESCRIPTION=(LOCAL=...
           ^^^^^ ^^^^^                            ^^^^^^^^^^
and do the following:
  [ other window ]
  # strace -o trc -v -p 14344 ($PID of that process)

  [ sqlplus window ]
  SQL> create tablespace ... ;

  [ other window ]
  ^C
  # _  

Then examine `trc' file made by strace.  I'm interested in:
 1) st_blksize of /dev/raw/rawNN device
 2) read/write sizes requested by oracle on that device.

And also try:
  dd of=/dev/null if=/dev/raw/raw100 bs=512
   and the same with bs=1024
  (this will not destroy data)
 (/dev/raw/raw100 bound to one of LVs).

If you successefully created the tablespace, then
either oracle uses only 1024*n i/o (my 8.1.6 uses 512
sometimes) or your kernel allows to use 512 bytes...

Thank you!

Regards,
 Michael.
