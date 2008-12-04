Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id mB4DAQAi023472
	for <linux-lvm@redhat.com>; Thu, 4 Dec 2008 08:10:26 -0500
Received: from mail-relay.seakr.com (mx2.seakr.com [64.207.50.19])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id mB4DA9CB029243
	for <linux-lvm@redhat.com>; Thu, 4 Dec 2008 08:10:09 -0500
Received: from mx-inside.seakr.com (mx-inside.seakr.com [192.168.100.31])
	by mail-relay.seakr.com (8.12.10/8.12.10) with ESMTP id mB4D2nip005997
	for <linux-lvm@redhat.com>; Thu, 4 Dec 2008 06:02:49 -0700
Received: from collaborate.seakr.com (collaborate.seakr.com [192.168.100.28])
	by mx-inside.seakr.com (Postfix) with ESMTP id 9F9FB44812
	for <linux-lvm@redhat.com>; Thu,  4 Dec 2008 06:10:07 -0700 (MST)
Message-Id: <49377434.87A6.0099.1@seakr.com>
Date: Thu, 04 Dec 2008 06:09:56 -0700
From: "Nick Couchman" <Nick.Couchman@seakr.com>
Subject: Re: [linux-lvm] resizing physical volume
References: <4937D295.8010105@gk-software.com>
In-Reply-To: <4937D295.8010105@gk-software.com>
Mime-Version: 1.0
Content-Type: multipart/alternative; boundary="=__Part745C07B4.0__="
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

This is a MIME message. If you are reading this text, you may want to 
consider changing to a mail reader or gateway that understands how to 
properly handle MIME multipart messages.

--=__Part745C07B4.0__=
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-NAIMIME-Disclaimer: 1
X-NAIMIME-Modified: 1

If the disk device has a partition that you're using for LVM, you need to=
 resize that partition using fdisk or the like.  If you didn't partition =
the device and use the whole disk device, you don't have to worry about r=
esizing the partition - you just have to get Linux to see the increased s=
ize of the disk.
=20
If you did partition the disk and need to use fdisk to resize, take LVM o=
ffline, run fdisk on the volume, delete the original partition and recrea=
te the partition with the exact same starting place as before and with th=
e new ending location that represents the increased sized.  Usually a goo=
d idea to make sure you have a backup of your data before you do this - I=
've never personally seen it go bad, but I know there are people out ther=
e who have.
=20
-Nick

>>> Stepan Kadlec <skadlec@gk-software.com> 2008/12/04 05:52 >>>
Hi,
is there a way to resize the physical partition, that hosts the LVM? can=20
it be done just by pvresize or do I have to resize the partition itself=20
first? (by fdisk-like program?) I know I could add the free space as a=20
new PV, but I would prefer directly extending current PV. is that=20
possible? how?
thank you, stepan

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com=20
https://www.redhat.com/mailman/listinfo/linux-lvm=20
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

--=__Part745C07B4.0__=
Content-Type: text/HTML;
  charset="utf-8"
Content-Transfer-Encoding: base64
Content-Description: HTML
X-NAIMIME-Disclaimer: 1
X-NAIMIME-Modified: 1

PEhUTUw+PEhFQUQ+CjxNRVRBIGh0dHAtZXF1aXY9Q29udGVudC1UeXBlIGNvbnRlbnQ9InRleHQv
aHRtbDsgY2hhcnNldD1pc28tODg1OS0xNSI+CjxNRVRBIGNvbnRlbnQ9Ik1TSFRNTCA2LjAwLjYw
MDAuMTY3MzUiIG5hbWU9R0VORVJBVE9SPjwvSEVBRD4KPEJPRFkgc3R5bGU9Ik1BUkdJTjogNHB4
IDRweCAxcHg7IEZPTlQ6IDEwcHQgVGFob21hIj4KPERJVj5JZiB0aGUgZGlzayBkZXZpY2UgaGFz
IGEgcGFydGl0aW9uIHRoYXQgeW91J3JlIHVzaW5nIGZvciBMVk0sIHlvdSBuZWVkIHRvIHJlc2l6
ZSB0aGF0IHBhcnRpdGlvbiB1c2luZyBmZGlzayBvciB0aGUgbGlrZS4mbmJzcDsgSWYgeW91IGRp
ZG4ndCBwYXJ0aXRpb24gdGhlIGRldmljZSBhbmQgdXNlIHRoZSB3aG9sZSBkaXNrIGRldmljZSwg
eW91IGRvbid0IGhhdmUgdG8gd29ycnkgYWJvdXQgcmVzaXppbmcgdGhlIHBhcnRpdGlvbiAtIHlv
dSBqdXN0IGhhdmUgdG8gZ2V0IExpbnV4IHRvIHNlZSB0aGUgaW5jcmVhc2VkIHNpemUgb2YgdGhl
IGRpc2suPC9ESVY+CjxESVY+Jm5ic3A7PC9ESVY+CjxESVY+SWYgeW91IGRpZCBwYXJ0aXRpb24g
dGhlIGRpc2sgYW5kIG5lZWQgdG8gdXNlIGZkaXNrIHRvIHJlc2l6ZSwgdGFrZSBMVk0gb2ZmbGlu
ZSwgcnVuIGZkaXNrIG9uIHRoZSB2b2x1bWUsIGRlbGV0ZSB0aGUgb3JpZ2luYWwgcGFydGl0aW9u
IGFuZCByZWNyZWF0ZSB0aGUgcGFydGl0aW9uIHdpdGggdGhlIGV4YWN0IHNhbWUgc3RhcnRpbmcg
cGxhY2UgYXMgYmVmb3JlIGFuZCB3aXRoIHRoZSBuZXcgZW5kaW5nIGxvY2F0aW9uIHRoYXQgcmVw
cmVzZW50cyB0aGUgaW5jcmVhc2VkIHNpemVkLiZuYnNwOyBVc3VhbGx5IGEgZ29vZCBpZGVhIHRv
IG1ha2Ugc3VyZSB5b3UgaGF2ZSBhIGJhY2t1cCBvZiB5b3VyIGRhdGEgYmVmb3JlIHlvdSBkbyB0
aGlzIC0gSSd2ZSBuZXZlciBwZXJzb25hbGx5IHNlZW4gaXQgZ28gYmFkLCBidXQgSSBrbm93IHRo
ZXJlIGFyZSBwZW9wbGUgb3V0IHRoZXJlIHdobyBoYXZlLjwvRElWPgo8RElWPiZuYnNwOzwvRElW
Pgo8RElWPi1OaWNrPEJSPjxCUj4mZ3Q7Jmd0OyZndDsgU3RlcGFuIEthZGxlYyAmbHQ7c2thZGxl
Y0Bnay1zb2Z0d2FyZS5jb20mZ3Q7IDIwMDgvMTIvMDQgMDU6NTIgJmd0OyZndDsmZ3Q7PEJSPkhp
LDxCUj5pcyB0aGVyZSBhIHdheSB0byByZXNpemUgdGhlIHBoeXNpY2FsIHBhcnRpdGlvbiwgdGhh
dCBob3N0cyB0aGUgTFZNPyBjYW4gPEJSPml0IGJlIGRvbmUganVzdCBieSBwdnJlc2l6ZSBvciBk
byBJIGhhdmUgdG8gcmVzaXplIHRoZSBwYXJ0aXRpb24gaXRzZWxmIDxCUj5maXJzdD8gKGJ5IGZk
aXNrLWxpa2UgcHJvZ3JhbT8pIEkga25vdyBJIGNvdWxkIGFkZCB0aGUgZnJlZSBzcGFjZSBhcyBh
IDxCUj5uZXcgUFYsIGJ1dCBJIHdvdWxkIHByZWZlciBkaXJlY3RseSBleHRlbmRpbmcgY3VycmVu
dCBQVi4gaXMgdGhhdCA8QlI+cG9zc2libGU/IGhvdz88QlI+dGhhbmsgeW91LCBzdGVwYW48QlI+
PEJSPl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fPEJSPmxp
bnV4LWx2bSBtYWlsaW5nIGxpc3Q8QlI+bGludXgtbHZtQHJlZGhhdC5jb208QlI+PEEgaHJlZj0i
aHR0cHM6Ly93d3cucmVkaGF0LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4Ij5odHRwczovL3d3
dy5yZWRoYXQuY29tL21haWxtYW4vbGlzdGluZm8vbGludXg8L0E+LWx2bTxCUj5yZWFkIHRoZSBM
Vk0gSE9XLVRPIGF0IDxBIGhyZWY9Imh0dHA6Ly90bGRwLm9yZy9IT1dUTy9MVk0iPmh0dHA6Ly90
bGRwLm9yZy9IT1dUTy9MVk08L0E+LUhPV1RPLzxCUj48L0RJVj4KPERJVj48UD48SFI+ClRoaXMg
ZS1tYWlsIG1heSBjb250YWluIGNvbmZpZGVudGlhbCBhbmQgcHJpdmlsZWdlZCBtYXRlcmlhbCBm
b3IgdGhlIHNvbGUgdXNlIG9mIHRoZSBpbnRlbmRlZCByZWNpcGllbnQuICBJZiB0aGlzIGVtYWls
IGlzIG5vdCBpbnRlbmRlZCBmb3IgeW91LCBvciB5b3UgYXJlIG5vdCByZXNwb25zaWJsZSBmb3Ig
dGhlIGRlbGl2ZXJ5IG9mIHRoaXMgbWVzc2FnZSB0byB0aGUgaW50ZW5kZWQgcmVjaXBpZW50LCBw
bGVhc2Ugbm90ZSB0aGF0IHRoaXMgbWVzc2FnZSBtYXkgY29udGFpbiBTRUFLUiBFbmdpbmVlcmlu
ZyAoU0VBS1IpIFByaXZpbGVnZWQvUHJvcHJpZXRhcnkgSW5mb3JtYXRpb24uICBJbiBzdWNoIGEg
Y2FzZSwgeW91IGFyZSBzdHJpY3RseSBwcm9oaWJpdGVkIGZyb20gZG93bmxvYWRpbmcsIHBob3Rv
Y29weWluZywgZGlzdHJpYnV0aW5nIG9yIG90aGVyd2lzZSB1c2luZyB0aGlzIG1lc3NhZ2UsIGl0
cyBjb250ZW50cyBvciBhdHRhY2htZW50cyBpbiBhbnkgd2F5LiAgSWYgeW91IGhhdmUgcmVjZWl2
ZWQgdGhpcyBtZXNzYWdlIGluIGVycm9yLCBwbGVhc2Ugbm90aWZ5IHVzIGltbWVkaWF0ZWx5IGJ5
IHJlcGx5aW5nIHRvIHRoaXMgZS1tYWlsIGFuZCBkZWxldGUgdGhlIG1lc3NhZ2UgZnJvbSB5b3Vy
IG1haWxib3guICBJbmZvcm1hdGlvbiBjb250YWluZWQgaW4gdGhpcyBtZXNzYWdlIHRoYXQgZG9l
cyBub3QgcmVsYXRlIHRvIHRoZSBidXNpbmVzcyBvZiBTRUFLUiBpcyBuZWl0aGVyIGVuZG9yc2Vk
IGJ5IG5vciBhdHRyaWJ1dGFibGUgdG8gU0VBS1IuCjwvUD48L0RJVj4KPC9CT0RZPjwvSFRNTD4K


--=__Part745C07B4.0__=--
