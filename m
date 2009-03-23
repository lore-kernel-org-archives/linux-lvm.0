Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n2NH5lMi026091
	for <linux-lvm@redhat.com>; Mon, 23 Mar 2009 13:05:47 -0400
Received: from ti-out-0910.google.com (ti-out-0910.google.com [209.85.142.187])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id n2NH5T61000746
	for <linux-lvm@redhat.com>; Mon, 23 Mar 2009 13:05:29 -0400
Received: by ti-out-0910.google.com with SMTP id d10so1740778tib.7
	for <linux-lvm@redhat.com>; Mon, 23 Mar 2009 10:05:28 -0700 (PDT)
MIME-Version: 1.0
Date: Tue, 24 Mar 2009 01:05:28 +0800
Message-ID: <1cafab770903231005x4bb8b64cmc0919cac9190d8bc@mail.gmail.com>
From: Xinwei Hu <hxinwei@gmail.com>
Content-Type: multipart/mixed; boundary=0016e651fad0f30f890465cc4518
Subject: [linux-lvm] Signal handling in clvmd
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

--0016e651fad0f30f890465cc4518
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi all,

  I'm running into a problem that clvmd sometimes take a long time to shutdown.
The clvmd itself is waiting for select to timeout in main_loop. But
since the SIGINT
(or SIGTERM) is handled in other threads, select is not interrupted as expected.

  The attached patch tries to mask SIGINT and SIGTERM in all other threads,
to make sure the signal is properly handled in the main_loop. This
helps to reduce
the chance that we are waiting meaninglessly.

  Would you please kindly review the patch ?

--0016e651fad0f30f890465cc4518
Content-Type: text/x-patch; charset=US-ASCII;
	name="sigterm_in_main_thread.diff"
Content-Disposition: attachment; filename="sigterm_in_main_thread.diff"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_fsnes1mh0

SW5kZXg6IExWTTIuMi4wMi4zOS9kYWVtb25zL2Nsdm1kL2Nsdm1kLmMKPT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQotLS0g
TFZNMi4yLjAyLjM5Lm9yaWcvZGFlbW9ucy9jbHZtZC9jbHZtZC5jCTIwMDktMDMtMjIgMjM6MDM6
NTMuMDAwMDAwMDAwICswODAwCisrKyBMVk0yLjIuMDIuMzkvZGFlbW9ucy9jbHZtZC9jbHZtZC5j
CTIwMDktMDMtMjMgMDQ6MjY6MzYuMDAwMDAwMDAwICswODAwCkBAIC0zNDgsOSArMzQ4LDExIEBA
CiAJc2lnbmFsKFNJR0hVUCwgIHNpZ2h1cF9oYW5kbGVyKTsKIAlzaWduYWwoU0lHUElQRSwgU0lH
X0lHTik7CiAKLQkvKiBCbG9jayBTSUdVU1IyIGluIHRoZSBtYWluIHByb2Nlc3MgKi8KKwkvKiBC
bG9jayBTSUdVU1IyL1NJR0lOVC9TSUdURVJNIGluIHByb2Nlc3MgKi8KIAlzaWdlbXB0eXNldCgm
c3MpOwogCXNpZ2FkZHNldCgmc3MsIFNJR1VTUjIpOworCXNpZ2FkZHNldCgmc3MsIFNJR0lOVCk7
CisJc2lnYWRkc2V0KCZzcywgU0lHVEVSTSk7CiAJc2lncHJvY21hc2soU0lHX0JMT0NLLCAmc3Ms
IE5VTEwpOwogCiAJLyogSW5pdGlhbGlzZSB0aGUgTFZNIHRocmVhZCB2YXJpYWJsZXMgKi8KQEAg
LTYzMyw2ICs2MzUsMTEgQEAKIHsKIAlERUJVR0xPRygiVXNpbmcgdGltZW91dCBvZiAlZCBzZWNv
bmRzXG4iLCBjbWRfdGltZW91dCk7CiAKKwlzaWdzZXRfdCBzczsKKwlzaWdlbXB0eXNldCgmc3Mp
OworCXNpZ2FkZHNldCgmc3MsIFNJR0lOVCk7CisJc2lnYWRkc2V0KCZzcywgU0lHVEVSTSk7CisJ
cHRocmVhZF9zaWdtYXNrKFNJR19VTkJMT0NLLCAmc3MsIE5VTEwpOwogCS8qIE1haW4gbG9vcCAq
LwogCXdoaWxlICghcXVpdCkgewogCQlmZF9zZXQgaW47Cg==
--0016e651fad0f30f890465cc4518--
