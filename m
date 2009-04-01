Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n312Bkfp029034
	for <linux-lvm@redhat.com>; Tue, 31 Mar 2009 22:11:46 -0400
Received: from ti-out-0910.google.com (ti-out-0910.google.com [209.85.142.191])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id n312B3WF007555
	for <linux-lvm@redhat.com>; Tue, 31 Mar 2009 22:11:03 -0400
Received: by ti-out-0910.google.com with SMTP id d10so2407322tib.7
	for <linux-lvm@redhat.com>; Tue, 31 Mar 2009 19:11:02 -0700 (PDT)
MIME-Version: 1.0
Date: Wed, 1 Apr 2009 10:11:02 +0800
Message-ID: <1cafab770903311911p63f962afybfd39137e61344d1@mail.gmail.com>
From: Xinwei Hu <hxinwei@gmail.com>
Content-Type: multipart/mixed; boundary=001485f33e42cb5727046674d30b
Subject: [linux-lvm] Call dlm_release_lockspace with force=1 in
	clvmd-corosync.c
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

--001485f33e42cb5727046674d30b
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi all,

    All calls to dlm_release_lockspace in clvmd-corosync.c use
force=0. This may cause the problem when
the node is the "lock master" of lockspace, the lockspace won't be
release then, and there'll be no any error
information from libdlm.

    Issues' found and analysied by Lars Marowsky-Bree and David Teigland.

    The patch tries to call dlm_release_lockspace with force = 1 in all cases.

    Please consider it for inclusion.

    Thanks.

--001485f33e42cb5727046674d30b
Content-Type: text/x-patch; charset=US-ASCII;
	name="dlm_release_lockspace_with_force.diff"
Content-Disposition: attachment; 
	filename="dlm_release_lockspace_with_force.diff"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_fszdshie1

SW5kZXg6IGNsdm1kL2Nsdm1kLWNvcm9zeW5jLmMKPT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQotLS0gY2x2bWQub3JpZy9j
bHZtZC1jb3Jvc3luYy5jCTIwMDktMDMtMTAgMTY6NDc6MTUuMDAwMDAwMDAwICswODAwCisrKyBj
bHZtZC9jbHZtZC1jb3Jvc3luYy5jCTIwMDktMDQtMDEgMTA6MTA6MzcuMDAwMDAwMDAwICswODAw
CkBAIC0zMzQsNyArMzM0LDcgQEAKIAlpZiAoZXJyICE9IENTX09LKSB7CiAJCWNwZ19maW5hbGl6
ZShjcGdfaGFuZGxlKTsKIAkJcXVvcnVtX2ZpbmFsaXplKHF1b3J1bV9oYW5kbGUpOwotCQlkbG1f
cmVsZWFzZV9sb2Nrc3BhY2UoTE9DS1NQQUNFX05BTUUsIGxvY2tzcGFjZSwgMCk7CisJCWRsbV9y
ZWxlYXNlX2xvY2tzcGFjZShMT0NLU1BBQ0VfTkFNRSwgbG9ja3NwYWNlLCAxKTsKIAkJc3lzbG9n
KExPR19FUlIsICJDYW5ub3Qgam9pbiBjbHZtZCBwcm9jZXNzIGdyb3VwIik7CiAJCURFQlVHTE9H
KCJDYW5ub3Qgam9pbiBjbHZtZCBwcm9jZXNzIGdyb3VwOiAlZFxuIiwgZXJyKTsKIAkJcmV0dXJu
IGNzX3RvX2Vycm5vKGVycik7CkBAIC0zNDUsNyArMzQ1LDcgQEAKIAlpZiAoZXJyICE9IENTX09L
KSB7CiAJCWNwZ19maW5hbGl6ZShjcGdfaGFuZGxlKTsKIAkJcXVvcnVtX2ZpbmFsaXplKHF1b3J1
bV9oYW5kbGUpOwotCQlkbG1fcmVsZWFzZV9sb2Nrc3BhY2UoTE9DS1NQQUNFX05BTUUsIGxvY2tz
cGFjZSwgMCk7CisJCWRsbV9yZWxlYXNlX2xvY2tzcGFjZShMT0NLU1BBQ0VfTkFNRSwgbG9ja3Nw
YWNlLCAxKTsKIAkJc3lzbG9nKExPR19FUlIsICJDYW5ub3QgZ2V0IGxvY2FsIG5vZGUgaWRcbiIp
OwogCQlyZXR1cm4gY3NfdG9fZXJybm8oZXJyKTsKIAl9CkBAIC0zNjEsNyArMzYxLDExIEBACiAJ
REVCVUdMT0coImNsdXN0ZXJfY2xvc2Vkb3duXG4iKTsKIAl1bmxvY2tfYWxsKCk7CiAKLQlkbG1f
cmVsZWFzZV9sb2Nrc3BhY2UoTE9DS1NQQUNFX05BTUUsIGxvY2tzcGFjZSwgMCk7CisJLyogVGhl
IGZpcnN0IG5vZGUgaXMgdGhlIGxvY2sgbWFzdGVyLgorCSAgIFVubGVzcyBjYWxsIGRsbV9yZWxl
YXNlX2xvY2tzcGFjZSB3aXRoIGZvcmNlPTEsIHRoZSBub2RlCisJICAgbWFzdGVyIGNhbid0IHJl
bGVhc2UgdGhlIGxvY2tzcGFjZSwgYW5kIG5vIGVycm9yIHdpbGwKKwkgICBiZSByZXR1cm5lZCBi
eSBkbG1fcmVsZWFzZV9sb2Nrc3BhY2UgaW4gdGhpcyBjYXNlLiAqLworCWRsbV9yZWxlYXNlX2xv
Y2tzcGFjZShMT0NLU1BBQ0VfTkFNRSwgbG9ja3NwYWNlLCAxKTsKIAljcGdfZmluYWxpemUoY3Bn
X2hhbmRsZSk7CiAJcXVvcnVtX2ZpbmFsaXplKHF1b3J1bV9oYW5kbGUpOwogfQo=
--001485f33e42cb5727046674d30b--
