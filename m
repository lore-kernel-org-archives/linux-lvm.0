Return-Path: <j.e.s.de.jong@freeler.nl>
Message-ID: <3A2BF1E6.55FF3BF6@freeler.nl>
Date: Mon, 04 Dec 2000 20:35:02 +0100
From: Jorg de Jong <j.e.s.de.jong@freeler.nl>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Using Oracle with lvm AND rawio: read(512) from
References: <200012020529.WAA00876@lynx.turbolabs.com> <3A298498.86AB907B@tls.msk.ru> <3A29A31E.BC6A6243@tls.msk.ru> <3A2B58EA.71F92196@tls.msk.ru> <3A2BADF1.A12C700A@tls.msk.ru> <3A2BB554.2D83919E@tls.msk.ru>
Content-Type: multipart/mixed;
 boundary="------------26F16B73F78D6D28633BFA79"
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
To: linux-lvm@sistina.com

This is a multi-part message in MIME format.
--------------26F16B73F78D6D28633BFA79
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Michael Tokarev wrote:
> 
> And -- Jorg de Jong, can you please strace the ts creation
> process?  I'm very interested on i/o buffer sizes used there.
> 
....
>   # strace -o trc -v -p 14344 ($PID of that process)
> 
>   [ sqlplus window ]
>   SQL> create tablespace ... ;
> 
>   [ other window ]
>   ^C
>   # _
> 
> Then examine `trc' file made by strace.  I'm interested in:
>  1) st_blksize of /dev/raw/rawNN device
>  2) read/write sizes requested by oracle on that device.
> 
I successfully created a tabelspace on a raw device.
See the attachment... 

> And also try:
>   dd of=/dev/null if=/dev/raw/raw100 bs=512
>    and the same with bs=1024
>   (this will not destroy data)
>  (/dev/raw/raw100 bound to one of LVs).
> 

[root] /tmp > dd of=/dev/null if=/dev/raw/raw1 bs=512
1024000+0 records in
1024000+0 records out
[root] /tmp > dd of=/dev/null if=/dev/raw/raw1 bs=1024
512000+0 records in
512000+0 records out

Also no problems here !

> If you successefully created the tablespace, then
> either oracle uses only 1024*n i/o (my 8.1.6 uses 512
> sometimes) or your kernel allows to use 512 bytes...
> 
> Thank you!
> 
> Regards,
>  Michael.
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm

-- 
Jorg de Jong
Work : mailto:jorg.de.jong@ict.nl 
Play : mailto:j.e.s.de.jong@freeler.nl
--------------26F16B73F78D6D28633BFA79
Content-Type: application/x-gzip;
 name="trc.gz"
Content-Transfer-Encoding: base64
Content-Disposition: inline;
 filename="trc.gz"

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
--------------26F16B73F78D6D28633BFA79--
