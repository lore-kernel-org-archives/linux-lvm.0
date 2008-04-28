Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m3SGSBAB013016
	for <linux-lvm@redhat.com>; Mon, 28 Apr 2008 12:28:11 -0400
Received: from ti-out-0910.google.com (ti-out-0910.google.com [209.85.142.190])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m3SGRvGe025837
	for <linux-lvm@redhat.com>; Mon, 28 Apr 2008 12:28:00 -0400
Received: by ti-out-0910.google.com with SMTP id 11so1697552tim.7
	for <linux-lvm@redhat.com>; Mon, 28 Apr 2008 09:27:56 -0700 (PDT)
Message-ID: <1cafab770804280927u69a71c26n7a6857f958efd020@mail.gmail.com>
Date: Tue, 29 Apr 2008 00:27:56 +0800
From: "Xinwei Hu" <hxinwei@gmail.com>
Subject: Re: [linux-lvm] Re: Patch to clvmd-openais.c again
In-Reply-To: <4815918E.5080806@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_9256_30236218.1209400076778"
References: <1cafab770804250311n1c530743h30cbd62e725f345f@mail.gmail.com>
	<1cafab770804250312y7556ceddu3cff6a4c13a06355@mail.gmail.com>
	<4815918E.5080806@redhat.com>
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

------=_Part_9256_30236218.1209400076778
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

> Your patch has now been included in upstream clvmd.

Thanks for the inclusion.

And here are another 2:
. remove_lock_wait.diff remove the definition of "struct lock_wait",
which is not used since the switch away from async version saLck
. num_nodes should equal to member_list_entries, i.e.
joined_list_entires is 0 when a node leaves the group.

Would you help review them ;)

------=_Part_9256_30236218.1209400076778
Content-Type: text/x-patch; name=remove_lock_wait.diff
Content-Transfer-Encoding: base64
X-Attachment-Id: file0
Content-Disposition: attachment; filename=remove_lock_wait.diff

LS0tIGNsdm1kLW9wZW5haXMuYy5vcmlnCTIwMDgtMDQtMjggMjE6NTM6NDYuMDAwMDAwMDAwICsw
ODAwCisrKyBjbHZtZC1vcGVuYWlzLmMJMjAwOC0wNC0yOCAyMTo1Mzo1My4wMDAwMDAwMDAgKzA4
MDAKQEAgLTEwMCwxMyArMTAwLDYgQEAKIAlTYU5hbWVUICAgICAgICAgICAgICBsb2NrX25hbWU7
CiB9OwogCi1zdHJ1Y3QgbG9ja193YWl0Ci17Ci0JcHRocmVhZF9jb25kX3QgY29uZDsKLQlwdGhy
ZWFkX211dGV4X3QgbXV0ZXg7Ci0JaW50IHN0YXR1czsKLX07Ci0KIC8qIFNldCBlcnJubyB0byBz
b21ldGhpbmcgYXBwcm94aW1hdGluZyB0aGUgcmlnaHQgdmFsdWUgYW5kIHJldHVybiAwIG9yIC0x
ICovCiBzdGF0aWMgaW50IGFpc190b19lcnJubyhTYUFpc0Vycm9yVCBlcnIpCiB7Cg==
------=_Part_9256_30236218.1209400076778
Content-Type: text/x-patch; name=num_nodes_fix.diff
Content-Transfer-Encoding: base64
X-Attachment-Id: file2
Content-Disposition: attachment; filename=num_nodes_fix.diff

LS0tIGNsdm1kLW9wZW5haXMuYy5vcmlnCTIwMDgtMDQtMjggMjE6NTM6NTMuMDAwMDAwMDAwICsw
ODAwCisrKyBjbHZtZC1vcGVuYWlzLmMJMjAwOC0wNC0yOCAyMjowMzowNS4wMDAwMDAwMDAgKzA4
MDAKQEAgLTMwNiw3ICszMDYsNyBAQAogCQluaW5mby0+c3RhdGUgPSBOT0RFX0NMVk1EOwogCX0K
IAotCW51bV9ub2RlcyA9IGpvaW5lZF9saXN0X2VudHJpZXM7CisJbnVtX25vZGVzID0gbWVtYmVy
X2xpc3RfZW50cmllczsKIH0KIAogc3RhdGljIGludCBsY2tfZGlzcGF0Y2goc3RydWN0IGxvY2Fs
X2NsaWVudCAqY2xpZW50LCBjaGFyICpidWYsIGludCBsZW4sCg==
------=_Part_9256_30236218.1209400076778--
