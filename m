Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.16])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s7FHX8mO004390
	for <linux-lvm@redhat.com>; Fri, 15 Aug 2014 13:33:08 -0400
Received: from mail-qc0-f176.google.com (mail-qc0-f176.google.com
	[209.85.216.176])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s7FHX60x032425
	(version=TLSv1/SSLv3 cipher=RC4-SHA bits=128 verify=FAIL)
	for <linux-lvm@redhat.com>; Fri, 15 Aug 2014 13:33:07 -0400
Received: by mail-qc0-f176.google.com with SMTP id m20so2601471qcx.21
	for <linux-lvm@redhat.com>; Fri, 15 Aug 2014 10:33:06 -0700 (PDT)
MIME-Version: 1.0
Date: Fri, 15 Aug 2014 10:33:06 -0700
Message-ID: <CAA8m+Y1Y_rQC4BX9eaoOj9Xc_8QDsLjZwuV8e+SC4gwYYhVsyQ@mail.gmail.com>
From: Pirate Fibonacci <pirate112358@gmail.com>
Content-Type: multipart/alternative; boundary=001a113500a8022c230500ae6ab9
Subject: [linux-lvm] lvmetad hang...
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@redhat.com

--001a113500a8022c230500ae6ab9
Content-Type: text/plain; charset=UTF-8

Greeting All...

I've been using the lvm2py lib. after a predictable number usages of my
application, it appears that lvmetad halts. below is the relevant line from
top. upon kill the hung instance, my application will continue.


20807 root      20   0 23.934g  29356   3952 R  98.8  0.0  57:13.67 lvmetad

^^^^r^       ^^^^^^^^^^
                                                                    % cpu
usage

any useful comments on what this maybe?

where may I find the source code for lvmetad ?

thanks

Jeffrey

--001a113500a8022c230500ae6ab9
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: base64

PGRpdiBkaXI9Imx0ciI+PGI+PGJyPjwvYj48ZGl2PjxkaXY+R3JlZXRpbmcgQWxsLi4uPGJyPjxi
cj5JJiMzOTt2ZSBiZWVuIHVzaW5nIHRoZSBsdm0ycHkgbGliLiBhZnRlciBhIHByZWRpY3RhYmxl
IG51bWJlciB1c2FnZXMgb2YgbXkgYXBwbGljYXRpb24sIGl0IGFwcGVhcnMgdGhhdCBsdm1ldGFk
IGhhbHRzLiBiZWxvdyBpcyB0aGUgcmVsZXZhbnQgbGluZSBmcm9tIHRvcC4gdXBvbiBraWxsIHRo
ZSBodW5nIGluc3RhbmNlLCBteSBhcHBsaWNhdGlvbiB3aWxsIGNvbnRpbnVlLjxicj4NCjxicj48
YnI+MjA4MDcgcm9vdMKgwqDCoMKgwqAgMjDCoMKgIDAgMjMuOTM0Z8KgIDI5MzU2wqDCoCAzOTUy
IFLCoCA5OC44wqAgMC4wwqAgNTc6MTMuNjcgbHZtZXRhZDxicj48L2Rpdj48ZGl2PsKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIF5eXl5yXsKgwqDCoMKgwqDCoCBeXl5eXl5eXl5ePGJyPjwvZGl2PjxkaXY+
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgJSBjcHUgdXNhZ2UgPGJyPg0KPGJyPjwvZGl2PjxkaXY+YW55
IHVzZWZ1bCBjb21tZW50cyBvbiB3aGF0IHRoaXMgbWF5YmU/PGJyPjxicj48L2Rpdj48ZGl2Pndo
ZXJlIG1heSBJIGZpbmQgdGhlIHNvdXJjZSBjb2RlIGZvciBsdm1ldGFkID88YnI+PC9kaXY+PGRp
dj48YnI+PC9kaXY+PGRpdj50aGFua3M8YnI+PGJyPjwvZGl2PjxkaXY+SmVmZnJleTxicj48L2Rp
dj48ZGl2Pjxicj48L2Rpdj48L2Rpdj48L2Rpdj4NCg==
--001a113500a8022c230500ae6ab9--
