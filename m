Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id mAJGRxt4000911
	for <linux-lvm@redhat.com>; Wed, 19 Nov 2008 11:27:59 -0500
Received: from mail-relay.seakr.com (mx2.seakr.com [64.207.50.19])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id mAJGRfmn030539
	for <linux-lvm@redhat.com>; Wed, 19 Nov 2008 11:27:42 -0500
Received: from mx-inside.seakr.com (mx-inside.seakr.com [192.168.100.31])
	by mail-relay.seakr.com (8.12.10/8.12.10) with ESMTP id mAJGMKip007113
	for <linux-lvm@redhat.com>; Wed, 19 Nov 2008 09:22:20 -0700
Received: from collaborate.seakr.com (collaborate.seakr.com [192.168.100.28])
	by mx-inside.seakr.com (Postfix) with ESMTP id 9280C44808
	for <linux-lvm@redhat.com>; Wed, 19 Nov 2008 09:27:40 -0700 (MST)
Message-Id: <4923DC07020000990003134C@collaborate.seakr.com>
Date: Wed, 19 Nov 2008 09:27:35 -0700
From: "Nick Couchman" <Nick.Couchman@seakr.com>
Subject: Re: [linux-lvm] PVResize
References: <4923C4DE0200008A000062B9@collaborate.seakr.com>
	<4923DC07020000990003134C@collaborate.seakr.com>
In-Reply-To: <4923DC07020000990003134C@collaborate.seakr.com>
Mime-Version: 1.0
Content-Type: multipart/alternative; boundary="=__Part5C743C67.0__="
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

--=__Part5C743C67.0__=
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-NAIMIME-Disclaimer: 1
X-NAIMIME-Modified: 1

Yes, you'll need to resize the partition, first.  The only way I've come
up with to do this is to use fdisk to delete the partition and then
recreate it at the exact same start location with the expanded end
location (I always make sure I have backups of the contents before I do
this - still makes me nervous even though I've done it a few dozen
times).  Save the new layout, then use pvresize to make LVM see the
expanded size.

-Nick


-----Original Message-----
From: Chris Edwards <cedwards@smartechcorp.net>
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
To: LVM general discussion and development <linux-lvm@redhat.com>
Subject: [linux-lvm] PVResize
Date: Wed, 19 Nov 2008 09:47:24 -0500

I just added some space to my iscsi storage and I am trying to get my LV
to use it.  I was wondering if anyone had some advice on how to expand
that partition.  I thought maybe pvresize would do it but it looks like
I need to resize the partition first then run pvresize?

=20

Thanks!

=20

---

=20

Chris Edwards



=20


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

--=__Part5C743C67.0__=
Content-Type: text/HTML;
  charset="utf-8"
Content-Transfer-Encoding: base64
Content-Description: HTML
X-NAIMIME-Disclaimer: 1
X-NAIMIME-Modified: 1

PCFET0NUWVBFIEhUTUwgUFVCTElDICItLy9XM0MvL0RURCBIVE1MIDQuMCBUUkFOU0lUSU9OQUwv
L0VOIj4KPEhUTUw+CjxIRUFEPgogIDxNRVRBIEhUVFAtRVFVSVY9IkNvbnRlbnQtVHlwZSIgQ09O
VEVOVD0idGV4dC9odG1sOyBDSEFSU0VUPVVURi04Ij4KICA8TUVUQSBOQU1FPSJHRU5FUkFUT1Ii
IENPTlRFTlQ9Ikd0a0hUTUwvMy4xOC4xIj4KPC9IRUFEPgo8Qk9EWSBMSU5LPSIjMDAwMGZmIj4K
WWVzLCB5b3UnbGwgbmVlZCB0byByZXNpemUgdGhlIHBhcnRpdGlvbiwgZmlyc3QuJm5ic3A7IFRo
ZSBvbmx5IHdheSBJJ3ZlIGNvbWUgdXAgd2l0aCB0byBkbyB0aGlzIGlzIHRvIHVzZSBmZGlzayB0
byBkZWxldGUgdGhlIHBhcnRpdGlvbiBhbmQgdGhlbiByZWNyZWF0ZSBpdCBhdCB0aGUgZXhhY3Qg
c2FtZSBzdGFydCBsb2NhdGlvbiB3aXRoIHRoZSBleHBhbmRlZCBlbmQgbG9jYXRpb24gKEkgYWx3
YXlzIG1ha2Ugc3VyZSBJIGhhdmUgYmFja3VwcyBvZiB0aGUgY29udGVudHMgYmVmb3JlIEkgZG8g
dGhpcyAtIHN0aWxsIG1ha2VzIG1lIG5lcnZvdXMgZXZlbiB0aG91Z2ggSSd2ZSBkb25lIGl0IGEg
ZmV3IGRvemVuIHRpbWVzKS4mbmJzcDsgU2F2ZSB0aGUgbmV3IGxheW91dCwgdGhlbiB1c2UgcHZy
ZXNpemUgdG8gbWFrZSBMVk0gc2VlIHRoZSBleHBhbmRlZCBzaXplLjxCUj4KPEJSPgotTmljazxC
Uj4KPEJSPgo8QlI+Ci0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tPEJSPgo8Qj5Gcm9tPC9CPjog
Q2hyaXMgRWR3YXJkcyAmbHQ7PEEgSFJFRj0ibWFpbHRvOkNocmlzJTIwRWR3YXJkcyUyMCUzY2Nl
ZHdhcmRzQHNtYXJ0ZWNoY29ycC5uZXQlM2UiPmNlZHdhcmRzQHNtYXJ0ZWNoY29ycC5uZXQ8L0E+
Jmd0OzxCUj4KPEI+UmVwbHktVG88L0I+OiBMVk0gZ2VuZXJhbCBkaXNjdXNzaW9uIGFuZCBkZXZl
bG9wbWVudCAmbHQ7PEEgSFJFRj0ibWFpbHRvOkxWTSUyMGdlbmVyYWwlMjBkaXNjdXNzaW9uJTIw
YW5kJTIwZGV2ZWxvcG1lbnQlMjAlM2NsaW51eC1sdm1AcmVkaGF0LmNvbSUzZSI+bGludXgtbHZt
QHJlZGhhdC5jb208L0E+Jmd0OzxCUj4KPEI+VG88L0I+OiBMVk0gZ2VuZXJhbCBkaXNjdXNzaW9u
IGFuZCBkZXZlbG9wbWVudCAmbHQ7PEEgSFJFRj0ibWFpbHRvOkxWTSUyMGdlbmVyYWwlMjBkaXNj
dXNzaW9uJTIwYW5kJTIwZGV2ZWxvcG1lbnQlMjAlM2NsaW51eC1sdm1AcmVkaGF0LmNvbSUzZSI+
bGludXgtbHZtQHJlZGhhdC5jb208L0E+Jmd0OzxCUj4KPEI+U3ViamVjdDwvQj46IFtsaW51eC1s
dm1dIFBWUmVzaXplPEJSPgo8Qj5EYXRlPC9CPjogV2VkLCAxOSBOb3YgMjAwOCAwOTo0NzoyNCAt
MDUwMDxCUj4KPEJSPgpJIGp1c3QgYWRkZWQgc29tZSBzcGFjZSB0byBteSBpc2NzaSBzdG9yYWdl
IGFuZCBJIGFtIHRyeWluZyB0byBnZXQgbXkgTFYgdG8gdXNlIGl0LiZuYnNwOyBJIHdhcyB3b25k
ZXJpbmcgaWYgYW55b25lIGhhZCBzb21lIGFkdmljZSBvbiBob3cgdG8gZXhwYW5kIHRoYXQgcGFy
dGl0aW9uLiZuYnNwOyBJIHRob3VnaHQgbWF5YmUgcHZyZXNpemUgd291bGQgZG8gaXQgYnV0IGl0
IGxvb2tzIGxpa2UgSSBuZWVkIHRvIHJlc2l6ZSB0aGUgcGFydGl0aW9uIGZpcnN0IHRoZW4gcnVu
IHB2cmVzaXplPzxCUj4KPEJSPgombmJzcDs8QlI+CjxCUj4KVGhhbmtzITxCUj4KPEJSPgombmJz
cDs8QlI+CjxCUj4KLS0tPEJSPgo8QlI+CiZuYnNwOzxCUj4KPEJSPgpDaHJpcyBFZHdhcmRzPEJS
Pgo8QlI+CjxCUj4KPEJSPgombmJzcDs8QlI+CjxCUj4KPEJSPgo8UFJFPgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1sdm0gbWFpbGluZyBsaXN0
CjxBIEhSRUY9Im1haWx0bzpsaW51eC1sdm1AcmVkaGF0LmNvbSI+bGludXgtbHZtQHJlZGhhdC5j
b208L0E+CjxBIEhSRUY9Imh0dHBzOi8vd3d3LnJlZGhhdC5jb20vbWFpbG1hbi9saXN0aW5mby9s
aW51eC1sdm0iPmh0dHBzOi8vd3d3LnJlZGhhdC5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1s
dm08L0E+CnJlYWQgdGhlIExWTSBIT1ctVE8gYXQgPEEgSFJFRj0iaHR0cDovL3RsZHAub3JnL0hP
V1RPL0xWTS1IT1dUTy8iPmh0dHA6Ly90bGRwLm9yZy9IT1dUTy9MVk0tSE9XVE8vPC9BPgo8L1BS
RT4KCjxESVY+PFA+PEhSPgpUaGlzIGUtbWFpbCBtYXkgY29udGFpbiBjb25maWRlbnRpYWwgYW5k
IHByaXZpbGVnZWQgbWF0ZXJpYWwgZm9yIHRoZSBzb2xlIHVzZSBvZiB0aGUgaW50ZW5kZWQgcmVj
aXBpZW50LiAgSWYgdGhpcyBlbWFpbCBpcyBub3QgaW50ZW5kZWQgZm9yIHlvdSwgb3IgeW91IGFy
ZSBub3QgcmVzcG9uc2libGUgZm9yIHRoZSBkZWxpdmVyeSBvZiB0aGlzIG1lc3NhZ2UgdG8gdGhl
IGludGVuZGVkIHJlY2lwaWVudCwgcGxlYXNlIG5vdGUgdGhhdCB0aGlzIG1lc3NhZ2UgbWF5IGNv
bnRhaW4gU0VBS1IgRW5naW5lZXJpbmcgKFNFQUtSKSBQcml2aWxlZ2VkL1Byb3ByaWV0YXJ5IElu
Zm9ybWF0aW9uLiAgSW4gc3VjaCBhIGNhc2UsIHlvdSBhcmUgc3RyaWN0bHkgcHJvaGliaXRlZCBm
cm9tIGRvd25sb2FkaW5nLCBwaG90b2NvcHlpbmcsIGRpc3RyaWJ1dGluZyBvciBvdGhlcndpc2Ug
dXNpbmcgdGhpcyBtZXNzYWdlLCBpdHMgY29udGVudHMgb3IgYXR0YWNobWVudHMgaW4gYW55IHdh
eS4gIElmIHlvdSBoYXZlIHJlY2VpdmVkIHRoaXMgbWVzc2FnZSBpbiBlcnJvciwgcGxlYXNlIG5v
dGlmeSB1cyBpbW1lZGlhdGVseSBieSByZXBseWluZyB0byB0aGlzIGUtbWFpbCBhbmQgZGVsZXRl
IHRoZSBtZXNzYWdlIGZyb20geW91ciBtYWlsYm94LiAgSW5mb3JtYXRpb24gY29udGFpbmVkIGlu
IHRoaXMgbWVzc2FnZSB0aGF0IGRvZXMgbm90IHJlbGF0ZSB0byB0aGUgYnVzaW5lc3Mgb2YgU0VB
S1IgaXMgbmVpdGhlciBlbmRvcnNlZCBieSBub3IgYXR0cmlidXRhYmxlIHRvIFNFQUtSLgo8L1A+
PC9ESVY+CjwvQk9EWT4KPC9IVE1MPgo=

--=__Part5C743C67.0__=--
