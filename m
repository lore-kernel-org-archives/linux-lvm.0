Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m04M1nLY027146
	for <linux-lvm@redhat.com>; Fri, 4 Jan 2008 17:01:49 -0500
Received: from xchg03.bolivar.k12.mo.us (liberator.bolivar.k12.mo.us
	[204.185.27.8])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id m04M1LL3005348
	for <linux-lvm@redhat.com>; Fri, 4 Jan 2008 17:01:21 -0500
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="----_=_NextPart_001_01C84F1D.56EC5A85"
Subject: RE: [LINUX-LVM] shrinking a volume inside an LVM
Date: Fri, 4 Jan 2008 15:58:43 -0600
Message-ID: <F61B3F3722111146AF452DF29FDCCF5F038D1BDA@xchg03.bolivar.k12.mo.us>
References: <Pine.LNX.4.44.0801041556120.5886-100000@bmsred.bmsi.com>
From: "Kemp, Levi" <lnkemp@bolivar.k12.mo.us>
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
To: LVM general discussion and development <linux-lvm@redhat.com>

This is a multi-part message in MIME format.

------_=_NextPart_001_01C84F1D.56EC5A85
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Ok I understand. Is there anything I need to do to the volume to prep it =
first, as in defragment it or something similar? I'm unsure as to how =
the ext2/3 file systems work with data, so I didn't know if it needed to =
be moved before shrinking the file system, then shrinking the LV, then =
exanding the file system to fill the LV, leaving room in the LVM to =
create another LV with whatever file system I want correct? Doesn't =
sound as complicated now. Thanks.

Levi


-----Original Message-----
From: linux-lvm-bounces@redhat.com on behalf of Stuart D. Gathman
Sent: Fri 1/4/2008 2:59 PM
To: LVM general discussion and development
Subject: RE: [LINUX-LVM] shrinking a volume inside an LVM
=20
On Fri, 4 Jan 2008, Kemp, Levi wrote:

> Most of this makes sense. Especially the part about using a live CD. =
But if
> you don't mind I'm gonna pick your brain on the other parts because I =
like to
> understand a command before I use it, so I can blame myself when I =
mess up
> ;-) Actually the only part I'm unsure about is 9-11. resize2fs will =
resize my
> ext2/3 file system which will clear up more room in my lvm to create =
another
> lv correct? Or do you have to shrink the file system then the lv to =
have the
> space back? I'm going to back up anything that I need to be safe, but =
I'd
> like to avoid a total reinstall right now(that's for May). Thanks =
again. I
> think you've got me on track. One more quick one, on 9 you said =
"amount
> occupied + some" wouldn't it be minus some?

The plan given was to shrink the fs first, then reduce the LV to =
something
*bigger* than the shrunk filesystem.  I would add a little to the size
on lvreduce just to be sure.  The second resize is then to grow the fs
into the exact size of the LV (which it can do automatically and =
safely).

Shrinking is more dangerous than growing with current tools because the
lvreduce isn't smart enough to know exactly how big the filesystem
inside is, and you had better have shrunk the fs sufficiently first.

resize2fs, on the other hand, *does* know exactly how big the underlying =
LV or
other device is when expanding.

--=20
	      Stuart D. Gathman <stuart@bmsi.com>
    Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 =
591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://www.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/


------_=_NextPart_001_01C84F1D.56EC5A85
Content-Type: application/ms-tnef;
	name="winmail.dat"
Content-Transfer-Encoding: base64

eJ8+IhYWAQaQCAAEAAAAAAABAAEAAQeQBgAIAAAA5AQAAAAAAADoAAEIgAcAGAAAAElQTS5NaWNy
b3NvZnQgTWFpbC5Ob3RlADEIAQ2ABAACAAAAAgACAAEEgAEAMQAAAFJFOiBbTElOVVgtTFZNXSBz
aHJpbmtpbmcgYSB2b2x1bWUgaW5zaWRlIGFuIExWTQAVEAEFgAMADgAAANgHAQAEAA8AOgArAAUA
XQEBIIADAA4AAADYBwEABAAQAAEAFQAFAA8BAQmAAQAhAAAANDBCNUY0NkQ1RDE1MDM0RkE4NEU5
NDIzRUE3Rjk3RjUAPQcBA5AGAOQOAAA5AAAAAwAmAAAAAAADADYAAAAAAEAAOQBhd8n4HE/IAR4A
PQABAAAABQAAAFJFOiAAAAAAAgFHAAEAAAA4AAAAYz1VUzthPSA7cD1Cb2xpdmFyIFItMSBTY2hv
O2w9WENIRzAzLTA4MDEwNDIyMDEyMVotNzIzNQAeAEkAAQAAADEAAABSRTogW0xJTlVYLUxWTV0g
c2hyaW5raW5nIGEgdm9sdW1lIGluc2lkZSBhbiBMVk0AAAAAQABOAADl7rIUT8gBHgBaAAEAAAAd
AAAAbGludXgtbHZtLWJvdW5jZXNAcmVkaGF0LmNvbQAAAAACAVsAAQAAAFcAAAAAAAAAgSsfpL6j
EBmdbgDdAQ9UAgAAAABsaW51eC1sdm0tYm91bmNlc0ByZWRoYXQuY29tAFNNVFAAbGludXgtbHZt
LWJvdW5jZXNAcmVkaGF0LmNvbQAAAgFcAAEAAAAiAAAAU01UUDpMSU5VWC1MVk0tQk9VTkNFU0BS
RURIQVQuQ09NAAAAHgBdAAEAAAASAAAAU3R1YXJ0IEQuIEdhdGhtYW4AAAACAV4AAQAAAD8AAAAA
AAAAgSsfpL6jEBmdbgDdAQ9UAgAAAABTdHVhcnQgRC4gR2F0aG1hbgBTTVRQAHN0dWFydEBibXNp
LmNvbQAAAgFfAAEAAAAVAAAAU01UUDpTVFVBUlRAQk1TSS5DT00AAAAAHgBmAAEAAAAFAAAAU01U
UAAAAAAeAGcAAQAAAB0AAABsaW51eC1sdm0tYm91bmNlc0ByZWRoYXQuY29tAAAAAB4AaAABAAAA
BQAAAFNNVFAAAAAAHgBpAAEAAAAQAAAAc3R1YXJ0QGJtc2kuY29tAB4AcAABAAAALQAAAFtMSU5V
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
jTNc0w7ACrAvE385azuQSvUMgofQq3NAnyCmPB2QQLJAYicwaT9y/j5KlatxUuBR4V1SdmA8MG88
wCKzBrAnBEk+wIfBUGcloB9APdA3MCZwQ1AxlC0wsZAxQlBheLEoUDYxNTQ5dCIIUG7+ZlGgklFP
QiawKLA2oJ4i/mZcESQgdxEFAXIgdxGIgP+0k34QqrBuYo4BN4IjYB7x9yshOXRJME0N4ANgI2AB
gN9t8QIgI2AYIXwgVx5DabW/NgON0jCBA2ElkB5RP34Q71niBJBQcjlrX71/vo+/Wv+Y1T4GT1ED
EB7iODAdkMBtBz8JOXR1QHRwczov1C93xKAuPxgvwWIDgf4vweILgAIQxgE+FaJWnvGBMnZIT1ct
VE8egI8FQMQixHGJAGRwLgWwrGcvyGHIoC8ysS3KBAU5en3L0AAeADUQAQAAAEQAAAA8RjYxQjNG
MzcyMjExMTE0NkFGNDUyREYyOUZEQ0NGNUYwMzhEMUJEQUB4Y2hnMDMuYm9saXZhci5rMTIubW8u
dXM+AB4AORABAAAAOgAAADxQaW5lLkxOWC40LjQ0LjA4MDEwNDE1NTYxMjAuNTg4Ni0xMDAwMDBA
Ym1zcmVkLmJtc2kuY29tPgAAAB4ARxABAAAADwAAAG1lc3NhZ2UvcmZjODIyAAALAPIQAQAAAB8A
8xABAAAAbgAAAFIARQAlADMAQQAgAFsATABJAE4AVQBYAC0ATABWAE0AXQAgAHMAaAByAGkAbgBr
AGkAbgBnACAAYQAgAHYAbwBsAHUAbQBlACAAaQBuAHMAaQBkAGUAIABhAG4AIABMAFYATQAuAEUA
TQBMAAAAAAALAPYQAAAAAEAABzAKFcf4HE/IAUAACDCPqPpWHU/IAQMA3j+vbwAAAwDxPwkEAAAe
APg/AQAAAAsAAABLZW1wLCBMZXZpAAACAfk/AQAAAFYAAAAAAAAA3KdAyMBCEBq0uQgAKy/hggEA
AAAAAAAAL089Qk9MSVZBUiBSLTEgU0NIT09MUy9PVT1CT0xJVkFSL0NOPVJFQ0lQSUVOVFMvQ049
TE5LRU1QAAAAHgD6PwEAAAAVAAAAU3lzdGVtIEFkbWluaXN0cmF0b3IAAAAAAgH7PwEAAAAeAAAA
AAAAANynQMjAQhAatLkIACsv4YIBAAAAAAAAAC4AAAADAP0/5AQAAAMAGUAAAAAAAwAaQAAAAAAD
AB1AAAAAAAMAHkAAAAAAHgAwQAEAAAAHAAAATE5LRU1QAAAeADFAAQAAAAcAAABMTktFTVAAAB4A
MkABAAAAHQAAAGxpbnV4LWx2bS1ib3VuY2VzQHJlZGhhdC5jb20AAAAAHgAzQAEAAAAQAAAAc3R1
YXJ0QGJtc2kuY29tAB4AOEABAAAABwAAAExOS0VNUAAAHgA5QAEAAAACAAAALgAAAAMAdkD/////
CwApAAAAAAALACMAAAAAAAMABhCMF2DcAwAHEMgHAAADABAQAAAAAAMAERAAAAAAHgAIEAEAAABl
AAAAT0tJVU5ERVJTVEFORElTVEhFUkVBTllUSElOR0lORUVEVE9ET1RPVEhFVk9MVU1FVE9QUkVQ
SVRGSVJTVCxBU0lOREVGUkFHTUVOVElUT1JTT01FVEhJTkdTSU1JTEFSP0lNVQAAAAACAX8AAQAA
AEQAAAA8RjYxQjNGMzcyMjExMTE0NkFGNDUyREYyOUZEQ0NGNUYwMzhEMUJEQUB4Y2hnMDMuYm9s
aXZhci5rMTIubW8udXM+AF1D

------_=_NextPart_001_01C84F1D.56EC5A85--
