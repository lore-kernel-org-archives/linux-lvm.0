Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m04KoNPs016048
	for <linux-lvm@redhat.com>; Fri, 4 Jan 2008 15:50:23 -0500
Received: from xchg03.bolivar.k12.mo.us (liberator.bolivar.k12.mo.us
	[204.185.27.8])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id m04Ko0Ln009734
	for <linux-lvm@redhat.com>; Fri, 4 Jan 2008 15:50:00 -0500
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="----_=_NextPart_001_01C84F13.5F580E78"
Subject: RE: [LINUX-LVM] shrinking a volume inside an LVM
Date: Fri, 4 Jan 2008 14:50:00 -0600
Message-ID: <F61B3F3722111146AF452DF29FDCCF5F038D1BD8@xchg03.bolivar.k12.mo.us>
References: <F61B3F3722111146AF452DF29FDCCF5F038D1BD3@xchg03.bolivar.k12.mo.us><F61B3F3722111146AF452DF29FDCCF5F038D1BD6@xchg03.bolivar.k12.mo.us>
	<20080104193819.GA2021@bdmcc-us.com>
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

------_=_NextPart_001_01C84F13.5F580E78
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Most of this makes sense. Especially the part about using a live CD. But =
if you don't mind I'm gonna pick your brain on the other parts because I =
like to understand a command before I use it, so I can blame myself when =
I mess up ;-)=20
Actually the only part I'm unsure about is 9-11. resize2fs will resize =
my ext2/3 file system which will clear up more room in my lvm to create =
another lv correct? Or do you have to shrink the file system then the lv =
to have the space back? I'm going to back up anything that I need to be =
safe, but I'd like to avoid a total reinstall right now(that's for May). =
Thanks again. I think you've got me on track. One more quick one, on 9 =
you said "amount occupied + some" wouldn't it be minus some?


Levi

-----Original Message-----
From: linux-lvm-bounces@redhat.com on behalf of Brian McCullough
Sent: Fri 1/4/2008 1:38 PM
To: LVM general discussion and development
Subject: Re: [LINUX-LVM] shrinking a volume inside an LVM
=20
On Fri, Jan 04, 2008 at 01:07:42PM -0600, Kemp, Levi wrote:
> I'm sure it's been asked before, but I must be terrible at searching =
because I cannot find the answer. I have, like many, followed defaults =
and ended up wiht a boot partion and a lvm. Inside the lvm is a / and a =
swap. I'd like to shrink the / so that I can do another install of a =
different distro without upsetting my current one. I don't have another =
computer, or equal setup to run my test on and cannot take this one down =
yet either. If it's impossible let me know, but either way thanks for =
the help.

This is relatively easy, as long as you are careful.

First, which filesystem format are you using?  I will base my answer on
ext2/ext3, because that's what I am most familiar with, others can
answer better if you have something else.


Second, I presume from your question that / is not full.


1. Boot with a Rescue Disk or Live CD ( you need to make sure that your
LVM is not Live and being used. )

2. Start a terminal window and run:

3. vgchange -a y

4. e2fsck -f /dev/"volgroupname"/"volname of '/'"  ( you can fill in the
blanks )

5. mkdir /mnt1

6. mount /dev/"volgroupname"/"volname of '/'" /mnt1

7. df ( check the amount of space occupied in / )

8. umount /mnt1

9. resize2fs /dev/"volgroupname"/"volname of '/'" "amount occupied +
some"

10. lvreduce -L "size from 9" /dev/"volgroupname"/"volname of '/'"=20
( If you want to be extra paranoid, you can add a "-t" parameter once,
and then run it without. )

11. resize2fs /dev/"volgroupname"/"volname of '/'"=20
( This will adjust the filesystem to fit the Logical Volume. )


At this point, you should have a smaller / volume and some free space.
Note that resize2fs will insist on the e2fsck, and may require it more
often than I have shown.

I have put in a couple of paranoia steps, such as 6-8, to make sure that
you are using the correct sizes in the next couple of steps.



Have fun!
Brian


_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://www.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/


------_=_NextPart_001_01C84F13.5F580E78
Content-Type: application/ms-tnef;
	name="winmail.dat"
Content-Transfer-Encoding: base64

eJ8+IgEUAQaQCAAEAAAAAAABAAEAAQeQBgAIAAAA5AQAAAAAAADoAAEIgAcAGAAAAElQTS5NaWNy
b3NvZnQgTWFpbC5Ob3RlADEIAQ2ABAACAAAAAgACAAEEgAEAMQAAAFJFOiBbTElOVVgtTFZNXSBz
aHJpbmtpbmcgYSB2b2x1bWUgaW5zaWRlIGFuIExWTQAVEAEFgAMADgAAANgHAQAEAA4AMgAAAAUA
KQEBIIADAA4AAADYBwEABAAOADIAAAAFACkBAQmAAQAhAAAARjQ1RTI3NkVEQURCMEE0Q0E2RThG
NjUyQzc0MzU2QzYAZwcBA5AGAJwQAAA5AAAAAwAmAAAAAAADADYAAAAAAEAAOQB4DlhfE0/IAR4A
PQABAAAABQAAAFJFOiAAAAAAAgFHAAEAAAA4AAAAYz1VUzthPSA7cD1Cb2xpdmFyIFItMSBTY2hv
O2w9WENIRzAzLTA4MDEwNDIwNTAwMFotNzEwNwAeAEkAAQAAADEAAABSZTogW0xJTlVYLUxWTV0g
c2hyaW5raW5nIGEgdm9sdW1lIGluc2lkZSBhbiBMVk0AAAAAQABOAIBHl1sJT8gBHgBaAAEAAAAd
AAAAbGludXgtbHZtLWJvdW5jZXNAcmVkaGF0LmNvbQAAAAACAVsAAQAAAFcAAAAAAAAAgSsfpL6j
EBmdbgDdAQ9UAgAAAABsaW51eC1sdm0tYm91bmNlc0ByZWRoYXQuY29tAFNNVFAAbGludXgtbHZt
LWJvdW5jZXNAcmVkaGF0LmNvbQAAAgFcAAEAAAAiAAAAU01UUDpMSU5VWC1MVk0tQk9VTkNFU0BS
RURIQVQuQ09NAAAAHgBdAAEAAAARAAAAQnJpYW4gTWNDdWxsb3VnaAAAAAACAV4AAQAAAEAAAAAA
AAAAgSsfpL6jEBmdbgDdAQ9UAgAAAABCcmlhbiBNY0N1bGxvdWdoAFNNVFAAYmRtY0BiZG1jYy11
cy5jb20AAgFfAAEAAAAXAAAAU01UUDpCRE1DQEJETUNDLVVTLkNPTQAAHgBmAAEAAAAFAAAAU01U
UAAAAAAeAGcAAQAAAB0AAABsaW51eC1sdm0tYm91bmNlc0ByZWRoYXQuY29tAAAAAB4AaAABAAAA
BQAAAFNNVFAAAAAAHgBpAAEAAAASAAAAYmRtY0BiZG1jYy11cy5jb20AAAAeAHAAAQAAAC0AAABb
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
xZiDJ6QgUiWxZNUecCmVijIecFMBkB+i/2OSIlE/8QPwInBBMFbDeIHLYCUrhDMecHZnE9EgYNUf
YC0gkHmVijQecC9ClSNhLR1QL1cRLyJacfsJwAhgcCMQSMGkA6SiHTL4Jy8nSOCY9SlCMPEDIL8k
ER9BK4QpgUKinXs1HnDMbWtWIAXAL20CMBrz/UrmNqkhR6Ojz6TfpeGpr/o3HnBkHVCZABPQBZA3
hH9Hhh1QOiRH9yQRbXCdezjvHnBaoKr0qb45LtqrT6xfu6XhR38rK4RIo5XrMB5w7zPwGCEa0KHR
TLcwMAOTI/45rXG1D7YfSOArhJkAfBH/IbJuAEfBPYQOwSPwH3I00Sc/cCjQpkZhZCciIi2+dEjg
wAKQEYkjOlAsjfb/ZkMDoHiCSZFzVZ1dLry7v9+8z73ZgQMvk8EgamMyN6bPODYmcDDwyiRMb01A
JZD9AyBWWoOdXSuFyiIdkXyw/wuAKMFG43OBSTB15R4QAMD/HwASgW1wWnUnAkiikxEJ4Ps6FIA1
Tl/xPLQu/VrieRT/H0KjJIJxInEAwB8gGCBF4f9hEzLjK4QdQA6wlDMqgo+k/3OAeyCAO9hFdvEz
gidCKxD/MREdQcAFbdEOsHPgKNEa0OOXUQQgNi04KNCZvyuE/4NGIDQfQjWFHhAvIXxxJFS/PTAO
0drY3AOVf0rmSDbCOYQAbiErhFHD4t8KX//mX+dv6DorhE8nHbGMkSBhvyCwHRDpTVA5K4RA8HRz
4NA6Ly937YAuUEizEPvqUQOBL+rCC4ACEO7hT0UPK4Q0cWZEVWJIT1ct3FRPXcLtAu1RdEkwbiBZ
BbBnL/FB8YAvVWEtC/Lk5Tp99LAeADUQAQAAAEQAAAA8RjYxQjNGMzcyMjExMTE0NkFGNDUyREYy
OUZEQ0NGNUYwMzhEMUJEOEB4Y2hnMDMuYm9saXZhci5rMTIubW8udXM+AB4AORABAAAArAAAADxG
NjFCM0YzNzIyMTExMTQ2QUY0NTJERjI5RkRDQ0Y1RjAzOEQxQkQzQHhjaGcwMy5ib2xpdmFyLmsx
Mi5tby51cz48RjYxQjNGMzcyMjExMTE0NkFGNDUyREYyOUZEQ0NGNUYwMzhEMUJENkB4Y2hnMDMu
Ym9saXZhci5rMTIubW8udXM+IDwyMDA4MDEwNDE5MzgxOS5HQTIwMjFAYmRtY2MtdXMuY29tPgAe
AEcQAQAAAA8AAABtZXNzYWdlL3JmYzgyMgAACwDyEAEAAAAfAPMQAQAAAG4AAABSAEUAJQAzAEEA
IABbAEwASQBOAFUAWAAtAEwAVgBNAF0AIABzAGgAcgBpAG4AawBpAG4AZwAgAGEAIAB2AG8AbAB1
AG0AZQAgAGkAbgBzAGkAZABlACAAYQBuACAATABWAE0ALgBFAE0ATAAAAAAACwD2EAAAAABAAAcw
8owUARJPyAFAAAgwglxmXxNPyAEDAN4/r28AAAMA8T8JBAAAHgD4PwEAAAALAAAAS2VtcCwgTGV2
aQAAAgH5PwEAAABWAAAAAAAAANynQMjAQhAatLkIACsv4YIBAAAAAAAAAC9PPUJPTElWQVIgUi0x
IFNDSE9PTFMvT1U9Qk9MSVZBUi9DTj1SRUNJUElFTlRTL0NOPUxOS0VNUAAAAB4A+j8BAAAAFQAA
AFN5c3RlbSBBZG1pbmlzdHJhdG9yAAAAAAIB+z8BAAAAHgAAAAAAAADcp0DIwEIQGrS5CAArL+GC
AQAAAAAAAAAuAAAAAwD9P+QEAAADABlAAAAAAAMAGkAAAAAAAwAdQAAAAAADAB5AAAAAAB4AMEAB
AAAABwAAAExOS0VNUAAAHgAxQAEAAAAHAAAATE5LRU1QAAAeADJAAQAAAB0AAABsaW51eC1sdm0t
Ym91bmNlc0ByZWRoYXQuY29tAAAAAB4AM0ABAAAAEgAAAGJkbWNAYmRtY2MtdXMuY29tAAAAHgA4
QAEAAAAHAAAATE5LRU1QAAAeADlAAQAAAAIAAAAuAAAAAwB2QP////8LACkAAAAAAAsAIwAAAAAA
AwAGEI8mgN8DAAcQWwkAAAMAEBAAAAAAAwAREAAAAAAeAAgQAQAAAGUAAABNT1NUT0ZUSElTTUFL
RVNTRU5TRUVTUEVDSUFMTFlUSEVQQVJUQUJPVVRVU0lOR0FMSVZFQ0RCVVRJRllPVURPTlRNSU5E
SU1HT05OQVBJQ0tZT1VSQlJBSU5PTlRIRU9USEVSAAAAAAIBfwABAAAARAAAADxGNjFCM0YzNzIy
MTExMTQ2QUY0NTJERjI5RkRDQ0Y1RjAzOEQxQkQ4QHhjaGcwMy5ib2xpdmFyLmsxMi5tby51cz4A
ROc=

------_=_NextPart_001_01C84F13.5F580E78--
