Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k58CX91T025622
	for <linux-lvm@redhat.com>; Thu, 8 Jun 2006 08:33:09 -0400
Received: from mail6.postech.ac.kr (mail6.postech.ac.kr [141.223.1.112])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k58CX6kw029176
	for <linux-lvm@redhat.com>; Thu, 8 Jun 2006 08:33:07 -0400
Received: from [141.223.1.111] ([141.223.1.111]) 
	by mail6.postech.ac.kr ([141.223.1.112]) 
	with ESMTP id 2006060821:30:41:136279.2453.41008048
	for <linux-lvm@redhat.com>; Thu, 08 Jun 2006 21:30:41 +0900 (KST) 
Received: from [141.223.1.21] ([141.223.1.21]) 
	by mail1.postech.ac.kr ([141.223.1.21]) 
	with ESMTP id 2006060821:33:01:069884.2001.111217584
	for <linux-lvm@redhat.com>; Thu, 08 Jun 2006 21:33:01 +0900 (KST) 
Message-ID: <7121782.1149769981070.JavaMail.root@mail1>
Date: Thu, 8 Jun 2006 21:33:01 +0900 (KST)
From: =?EUC-KR?B?wba/z7HZ?= <jowkju@postech.ac.kr>
Mime-Version: 1.0
Content-Type: multipart/alternative; 
	boundary="----=_Part_46731_351799.1149769981066"
Subject: [linux-lvm] Where is the PE to LE mapping done?
Reply-To: jowkju@postech.ac.kr,
	LVM general discussion and development <linux-lvm@redhat.com>
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

------=_Part_46731_351799.1149769981066
Content-Type: text/plain; charset=EUC-KR
Content-Transfer-Encoding: base64

DQoKDQoKSGVsbG8sIFRoaXMgaXMgbXkgc2Vjb25kIGUtbWFpbC4KDQoKJm5ic3A7Cg0KCldoZXJl
IGRvZXMgdGhlIG1hcHBpbmcgYmV0d2VlbiBQRSBhbmQgTEUgaXMgZG9uZT8gQW5kIFdoZW4gaGFw
cGVuPwoNCgpXaGVuIHRoZSBuZXcgTG9naWNhbCBWb2x1bWUgaXMgY3JlYXRlZCBiYXNlZCBvbiBh
bHJlYWR5IGJ1aWx0IFBWIGFuZCBWRywgDQppcyZuYnNwOyB0aGUgbWFwcGluZyBkb25lPwoNCgom
bmJzcDsKDQoKSW4gdGhlIHNvdXJjZSBjb2RlLCAvbGliL21ldGFkYXRhL21ldGFkYXRhLmgsIHRo
ZXJlIGFyZSZuYnNwOyJsdl9zZWdtZW50IiANCiZhbXA7ICJwdl9zZWdtZW50Ii4mbmJzcDtkb2Vz
IHRoZSZuYnNwOyJzZWdtZW50IiBlcXVhbCB0aGUgImV4dGVudCI/PwoNCgombmJzcDsKDQoKRWFj
aCAicGh5c2ljYWxfdm9sdW1lIiBzdHJ1Y3QgYW5kICJsb2dpY2FsX3ZvbHVtZSIgc3RydWN0IGhh
cyBhIHNlZ21lbnQgbGlzdCANCmxpa2UgInB2X3NlZ21lbnQiIGFuZCAibHZfc2VnbWVudCIuIEJ1
dCB0aGVyZSBhcmUgYWxzbyAicHZfbGlzdCIgYW5kICJsdl9saXN0Ii4gDQpIb3cgdGhlIG1hcHBp
bmcgaXMgZG9uZSB3aXRoIHRoZXNlIHN0cnVjdHVyZXMuLj8/Cg0KCiZuYnNwOwoNCgpPbmUgbW9y
ZSB0aGluZyBpcywgIldoYXQgY29kZSBkbyBJIGhhdmUgdG8gcmVhZCZuYnNwO2luIHRoZSBzb3Vy
Y2VzIHRvIGtub3cgDQpob3cgdGhlIG1hcHBpbmcgaXMgZG9uZT8/IgoNCgombmJzcDsKDQoKVGhh
bmsgeW91IF5eOgoNCg0KDQoKCg==
------=_Part_46731_351799.1149769981066
Content-Type: text/html; charset=EUC-KR
Content-Transfer-Encoding: base64

PHN0eWxlPjwhLS0gDQpCT0RZe0ZPTlQtRkFNSUxZOiCxvLiyO0ZPTlQtU0laRTogMTBwdDt9DQpE
SVYsIFAge0ZPTlQtU0laRTogMTBwdDttYXJnaW4tdG9wOjJweDttYXJnaW4tYm90dG9tOjJweDt9
DQpURCB7Rk9OVC1TSVpFOiAxMHB0fQ0KLy8tLT48L3N0eWxlPg0KPGJvZHkgbGVmdG1hcmdpbj0x
IHRvcG1hcmdpbj0xPg0KPFA+SGVsbG8sIFRoaXMgaXMgbXkgc2Vjb25kIGUtbWFpbC48L1A+DQo8
UD4mbmJzcDs8L1A+DQo8UD5XaGVyZSBkb2VzIHRoZSBtYXBwaW5nIGJldHdlZW4gUEUgYW5kIExF
IGlzIGRvbmU/IEFuZCBXaGVuIGhhcHBlbj88L1A+DQo8UD5XaGVuIHRoZSBuZXcgTG9naWNhbCBW
b2x1bWUgaXMgY3JlYXRlZCBiYXNlZCBvbiBhbHJlYWR5IGJ1aWx0IFBWIGFuZCBWRywgDQppcyZu
YnNwOyB0aGUgbWFwcGluZyBkb25lPzwvUD4NCjxQPiZuYnNwOzwvUD4NCjxQPkluIHRoZSBzb3Vy
Y2UgY29kZSwgL2xpYi9tZXRhZGF0YS9tZXRhZGF0YS5oLCB0aGVyZSBhcmUmbmJzcDsibHZfc2Vn
bWVudCIgDQomYW1wOyAicHZfc2VnbWVudCIuJm5ic3A7ZG9lcyB0aGUmbmJzcDsic2VnbWVudCIg
ZXF1YWwgdGhlICJleHRlbnQiPz88L1A+DQo8UD4mbmJzcDs8L1A+DQo8UD5FYWNoICJwaHlzaWNh
bF92b2x1bWUiIHN0cnVjdCBhbmQgImxvZ2ljYWxfdm9sdW1lIiBzdHJ1Y3QgaGFzIGEgc2VnbWVu
dCBsaXN0IA0KbGlrZSAicHZfc2VnbWVudCIgYW5kICJsdl9zZWdtZW50Ii4gQnV0IHRoZXJlIGFy
ZSBhbHNvICJwdl9saXN0IiBhbmQgImx2X2xpc3QiLiANCkhvdyB0aGUgbWFwcGluZyBpcyBkb25l
IHdpdGggdGhlc2Ugc3RydWN0dXJlcy4uPz88L1A+DQo8UD4mbmJzcDs8L1A+DQo8UD5PbmUgbW9y
ZSB0aGluZyBpcywgIldoYXQgY29kZSBkbyBJIGhhdmUgdG8gcmVhZCZuYnNwO2luIHRoZSBzb3Vy
Y2VzIHRvIGtub3cgDQpob3cgdGhlIG1hcHBpbmcgaXMgZG9uZT8/IjwvUD4NCjxQPiZuYnNwOzwv
UD4NCjxQPlRoYW5rIHlvdSBeXjo8L1A+DQoNCg0KPC9ib2R5Pgo8aW1nIHNyYz0iaHR0cDovL21h
aWwucG9zdGVjaC5hYy5rcjo4MC9yZWNlaXZlTUROUmVzcG9uc2UuZG8/ZnJvbT1qb3dranVAcG9z
dGVjaC5hYy5rciZ0bz1saW51eC1sdm1AcmVkaGF0LmNvbSZtaWQ9MTMxNzY4MS4xMTQ5NzY5OTgx
MDY2LkphdmFNYWlsLnJvb3QlNDBtYWlsMSZzdG9yZT0lMkZzdG9yZTAxJTJGbWluZGV4JTJGODM3
JTJGam93a2p1Jmhvc3Q9bWFpbC5wb3N0ZWNoLmFjLmtyIiBoZWlnaHQ9MSB3aWR0aD0xPg==
------=_Part_46731_351799.1149769981066--
