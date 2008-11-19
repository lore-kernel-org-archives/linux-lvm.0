Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id mAJK8bbx001524
	for <linux-lvm@redhat.com>; Wed, 19 Nov 2008 15:08:37 -0500
Received: from mail-relay.seakr.com (mx2.seakr.com [64.207.50.19])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id mAJK7S85004558
	for <linux-lvm@redhat.com>; Wed, 19 Nov 2008 15:07:29 -0500
Received: from mx-inside.seakr.com (mx-inside.seakr.com [192.168.100.31])
	by mail-relay.seakr.com (8.12.10/8.12.10) with ESMTP id mAJK25ip012522
	for <linux-lvm@redhat.com>; Wed, 19 Nov 2008 13:02:06 -0700
Received: from collaborate.seakr.com (collaborate.seakr.com [192.168.100.28])
	by mx-inside.seakr.com (Postfix) with ESMTP id 412D244808
	for <linux-lvm@redhat.com>; Wed, 19 Nov 2008 13:07:26 -0700 (MST)
Message-Id: <49240F8A0200009900031373@collaborate.seakr.com>
Date: Wed, 19 Nov 2008 13:07:22 -0700
From: "Nick Couchman" <Nick.Couchman@seakr.com>
Subject: Re: [linux-lvm] automatic IO load balancing in LVM
References: <49240F4C020000EB00005FC3@collaborate.seakr.com>
	<49240F8A0200009900031373@collaborate.seakr.com>
In-Reply-To: <49240F8A0200009900031373@collaborate.seakr.com>
Mime-Version: 1.0
Content-Type: multipart/alternative; boundary="=__Part9EB6FEEA.0__="
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
To: linux-lvm@redhat.com

This is a MIME message. If you are reading this text, you may want to 
consider changing to a mail reader or gateway that understands how to 
properly handle MIME multipart messages.

--=__Part9EB6FEEA.0__=
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-NAIMIME-Disclaimer: 1
X-NAIMIME-Modified: 1

I currently have multi-path set up with round-robin load-balancing.  As
you say, it's remedial, but it is present...

-Nick


-----Original Message-----
From: Jonathan Brassow <jbrassow@redhat.com>
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
To: LVM general discussion and development <linux-lvm@redhat.com>
Subject: Re: [linux-lvm] automatic IO load balancing in LVM
Date: Wed, 19 Nov 2008 14:04:41 -0600

Where would this be appropriate?


Are you asking about read-balancing in Mirroring?  Not yet.


Or are you asking about load-balancing when there are multiple paths to
a device?  If so, that would be handled by dm-multipath, not LVM.
 (dm-multipath does have a remedial form of load balancing, IIRC.)


 brassow

On Nov 19, 2008, at 5:38 AM, sandeep lvm wrote:

> Hi,
> =20
> Do we have automatic IO load balancing in LVM . =20
> =20
> --Sandeep
>=20
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/


_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://www.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/



This e-mail may contain confidential and privileged material for the sole=
 use of the intended recipient.  If this email is not intended for you, o=
r you are not responsible for the delivery of this message to the intende=
d recipient, please note that this message may contain SEAKR Engineering =
(SEAKR) Privileged/Proprietary Information.  In such a case, you are stri=
ctly prohibited from downloading, photocopying, distributing or otherwise=
 using this message, its contents or attachments in any way.  If you have=
 received this message in error, please notify us immediately by replying=
 to this e-mail and delete the message from your mailbox.  Information co=
ntained in this message that does not relate to the business of SEAKR is =
neither endorsed by nor attributable to SEAKR.

--=__Part9EB6FEEA.0__=
Content-Type: text/HTML;
  charset="utf-8"
Content-Transfer-Encoding: base64
Content-Description: HTML
X-NAIMIME-Disclaimer: 1
X-NAIMIME-Modified: 1

PCFET0NUWVBFIEhUTUwgUFVCTElDICItLy9XM0MvL0RURCBIVE1MIDQuMCBUUkFOU0lUSU9OQUwv
L0VOIj4KPEhUTUw+CjxIRUFEPgogIDxNRVRBIEhUVFAtRVFVSVY9IkNvbnRlbnQtVHlwZSIgQ09O
VEVOVD0idGV4dC9odG1sOyBDSEFSU0VUPVVURi04Ij4KICA8TUVUQSBOQU1FPSJHRU5FUkFUT1Ii
IENPTlRFTlQ9Ikd0a0hUTUwvMy4xOC4xIj4KPC9IRUFEPgo8Qk9EWT4KSSBjdXJyZW50bHkgaGF2
ZSBtdWx0aS1wYXRoIHNldCB1cCB3aXRoIHJvdW5kLXJvYmluIGxvYWQtYmFsYW5jaW5nLiZuYnNw
OyBBcyB5b3Ugc2F5LCBpdCdzIHJlbWVkaWFsLCBidXQgaXQgaXMgcHJlc2VudC4uLjxCUj4KPEJS
PgotTmljazxCUj4KPEJSPgo8QlI+Ci0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tPEJSPgo8Qj5G
cm9tPC9CPjogSm9uYXRoYW4gQnJhc3NvdyAmbHQ7PEEgSFJFRj0ibWFpbHRvOkpvbmF0aGFuJTIw
QnJhc3NvdyUyMCUzY2picmFzc293QHJlZGhhdC5jb20lM2UiPmpicmFzc293QHJlZGhhdC5jb208
L0E+Jmd0OzxCUj4KPEI+UmVwbHktVG88L0I+OiBMVk0gZ2VuZXJhbCBkaXNjdXNzaW9uIGFuZCBk
ZXZlbG9wbWVudCAmbHQ7PEEgSFJFRj0ibWFpbHRvOkxWTSUyMGdlbmVyYWwlMjBkaXNjdXNzaW9u
JTIwYW5kJTIwZGV2ZWxvcG1lbnQlMjAlM2NsaW51eC1sdm1AcmVkaGF0LmNvbSUzZSI+bGludXgt
bHZtQHJlZGhhdC5jb208L0E+Jmd0OzxCUj4KPEI+VG88L0I+OiBMVk0gZ2VuZXJhbCBkaXNjdXNz
aW9uIGFuZCBkZXZlbG9wbWVudCAmbHQ7PEEgSFJFRj0ibWFpbHRvOkxWTSUyMGdlbmVyYWwlMjBk
aXNjdXNzaW9uJTIwYW5kJTIwZGV2ZWxvcG1lbnQlMjAlM2NsaW51eC1sdm1AcmVkaGF0LmNvbSUz
ZSI+bGludXgtbHZtQHJlZGhhdC5jb208L0E+Jmd0OzxCUj4KPEI+U3ViamVjdDwvQj46IFJlOiBb
bGludXgtbHZtXSBhdXRvbWF0aWMgSU8gbG9hZCBiYWxhbmNpbmcgaW4gTFZNPEJSPgo8Qj5EYXRl
PC9CPjogV2VkLCAxOSBOb3YgMjAwOCAxNDowNDo0MSAtMDYwMDxCUj4KPEJSPgpXaGVyZSB3b3Vs
ZCB0aGlzIGJlIGFwcHJvcHJpYXRlPwo8QlI+CjxCUj4KQXJlIHlvdSBhc2tpbmcgYWJvdXQgcmVh
ZC1iYWxhbmNpbmcgaW4gTWlycm9yaW5nPyAmbmJzcDtOb3QgeWV0Lgo8QlI+CjxCUj4KT3IgYXJl
IHlvdSBhc2tpbmcgYWJvdXQgbG9hZC1iYWxhbmNpbmcgd2hlbiB0aGVyZSBhcmUgbXVsdGlwbGUg
cGF0aHMgdG8gYSBkZXZpY2U/ICZuYnNwO0lmIHNvLCB0aGF0IHdvdWxkIGJlIGhhbmRsZWQgYnkg
ZG0tbXVsdGlwYXRoLCBub3QgTFZNLiAmbmJzcDsoZG0tbXVsdGlwYXRoIGRvZXMgaGF2ZSBhIHJl
bWVkaWFsIGZvcm0gb2YgbG9hZCBiYWxhbmNpbmcsIElJUkMuKQo8QlI+CjxCUj4KJm5ic3A7YnJh
c3Nvdwo8QlI+Ck9uIE5vdiAxOSwgMjAwOCwgYXQgNTozOCBBTSwgc2FuZGVlcCBsdm0gd3JvdGU6
CjxCUj4KPEJMT0NLUVVPVEUgVFlQRT1DSVRFPgogICAgSGksCjwvQkxPQ0tRVU9URT4KPEJMT0NL
UVVPVEUgVFlQRT1DSVRFPgogICAgJm5ic3A7CjwvQkxPQ0tRVU9URT4KPEJMT0NLUVVPVEUgVFlQ
RT1DSVRFPgogICAgRG8gd2UgaGF2ZSBhdXRvbWF0aWMgSU8gbG9hZCBiYWxhbmNpbmcgaW4gTFZN
IC4mbmJzcDsmbmJzcDsKPC9CTE9DS1FVT1RFPgo8QkxPQ0tRVU9URSBUWVBFPUNJVEU+CiAgICAm
bmJzcDsKPC9CTE9DS1FVT1RFPgo8QkxPQ0tRVU9URSBUWVBFPUNJVEU+CiAgICAtLVNhbmRlZXAK
PC9CTE9DS1FVT1RFPgo8QkxPQ0tRVU9URSBUWVBFPUNJVEU+CiAgICBfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXzxCUj4KICAgIGxpbnV4LWx2bSBtYWlsaW5n
IGxpc3Q8QlI+CiAgICA8QSBIUkVGPSJtYWlsdG86bGludXgtbHZtQHJlZGhhdC5jb20iPmxpbnV4
LWx2bUByZWRoYXQuY29tPC9BPjxCUj4KICAgIGh0dHBzOi8vd3d3LnJlZGhhdC5jb20vbWFpbG1h
bi9saXN0aW5mby9saW51eC1sdm08QlI+CiAgICByZWFkIHRoZSBMVk0gSE9XLVRPIGF0IGh0dHA6
Ly90bGRwLm9yZy9IT1dUTy9MVk0tSE9XVE8vCjwvQkxPQ0tRVU9URT4KPEJSPgo8QlI+CjxQUkU+
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWx2
bSBtYWlsaW5nIGxpc3QKPEEgSFJFRj0ibWFpbHRvOmxpbnV4LWx2bUByZWRoYXQuY29tIj5saW51
eC1sdm1AcmVkaGF0LmNvbTwvQT4KPEEgSFJFRj0iaHR0cHM6Ly93d3cucmVkaGF0LmNvbS9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LWx2bSI+aHR0cHM6Ly93d3cucmVkaGF0LmNvbS9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LWx2bTwvQT4KcmVhZCB0aGUgTFZNIEhPVy1UTyBhdCA8QSBIUkVGPSJodHRw
Oi8vdGxkcC5vcmcvSE9XVE8vTFZNLUhPV1RPLyI+aHR0cDovL3RsZHAub3JnL0hPV1RPL0xWTS1I
T1dUTy88L0E+CjwvUFJFPgoKPERJVj48UD48SFI+ClRoaXMgZS1tYWlsIG1heSBjb250YWluIGNv
bmZpZGVudGlhbCBhbmQgcHJpdmlsZWdlZCBtYXRlcmlhbCBmb3IgdGhlIHNvbGUgdXNlIG9mIHRo
ZSBpbnRlbmRlZCByZWNpcGllbnQuICBJZiB0aGlzIGVtYWlsIGlzIG5vdCBpbnRlbmRlZCBmb3Ig
eW91LCBvciB5b3UgYXJlIG5vdCByZXNwb25zaWJsZSBmb3IgdGhlIGRlbGl2ZXJ5IG9mIHRoaXMg
bWVzc2FnZSB0byB0aGUgaW50ZW5kZWQgcmVjaXBpZW50LCBwbGVhc2Ugbm90ZSB0aGF0IHRoaXMg
bWVzc2FnZSBtYXkgY29udGFpbiBTRUFLUiBFbmdpbmVlcmluZyAoU0VBS1IpIFByaXZpbGVnZWQv
UHJvcHJpZXRhcnkgSW5mb3JtYXRpb24uICBJbiBzdWNoIGEgY2FzZSwgeW91IGFyZSBzdHJpY3Rs
eSBwcm9oaWJpdGVkIGZyb20gZG93bmxvYWRpbmcsIHBob3RvY29weWluZywgZGlzdHJpYnV0aW5n
IG9yIG90aGVyd2lzZSB1c2luZyB0aGlzIG1lc3NhZ2UsIGl0cyBjb250ZW50cyBvciBhdHRhY2ht
ZW50cyBpbiBhbnkgd2F5LiAgSWYgeW91IGhhdmUgcmVjZWl2ZWQgdGhpcyBtZXNzYWdlIGluIGVy
cm9yLCBwbGVhc2Ugbm90aWZ5IHVzIGltbWVkaWF0ZWx5IGJ5IHJlcGx5aW5nIHRvIHRoaXMgZS1t
YWlsIGFuZCBkZWxldGUgdGhlIG1lc3NhZ2UgZnJvbSB5b3VyIG1haWxib3guICBJbmZvcm1hdGlv
biBjb250YWluZWQgaW4gdGhpcyBtZXNzYWdlIHRoYXQgZG9lcyBub3QgcmVsYXRlIHRvIHRoZSBi
dXNpbmVzcyBvZiBTRUFLUiBpcyBuZWl0aGVyIGVuZG9yc2VkIGJ5IG5vciBhdHRyaWJ1dGFibGUg
dG8gU0VBS1IuCjwvUD48L0RJVj4KPC9CT0RZPgo8L0hUTUw+Cg==

--=__Part9EB6FEEA.0__=--
