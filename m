Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n1PAa4PS009545
	for <linux-lvm@redhat.com>; Wed, 25 Feb 2009 05:36:04 -0500
Received: from ti-out-0910.google.com (ti-out-0910.google.com [209.85.142.185])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id n1PAZnnB032550
	for <linux-lvm@redhat.com>; Wed, 25 Feb 2009 05:35:50 -0500
Received: by ti-out-0910.google.com with SMTP id 11so3072037tim.7
	for <linux-lvm@redhat.com>; Wed, 25 Feb 2009 02:35:48 -0800 (PST)
MIME-Version: 1.0
Date: Wed, 25 Feb 2009 18:35:48 +0800
Message-ID: <1cafab770902250235x39c180a4x63b9e5e6d9a761d5@mail.gmail.com>
From: Xinwei Hu <hxinwei@gmail.com>
Content-Type: multipart/mixed; boundary=0016e65138b68a4b990463bbccb5
Subject: [linux-lvm] clvmd-corosync should check lksb.sb_status instead of
	return code ?
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

--0016e65138b68a4b990463bbccb5
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi all,

  In clvmd-corosync, lock_resource calls dlm_ls_lock_wait with flags
set to LKF_NOQUEUE.
  When LKF_NOQUEUE is set, the return code of dlm_ls_lock_wait is
always 0, while the actual errno is in lksb.sb_status.

  This causes problem when using vgchange -aey or something like.

  I attached a patch to try to fix this issue.

  Please help to review. Thanks.

--0016e65138b68a4b990463bbccb5
Content-Type: text/x-patch; charset=US-ASCII; name="clvmd-corosync.diff"
Content-Disposition: attachment; filename="clvmd-corosync.diff"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_frlvadcv0

SW5kZXg6IExWTTItY29yb3N5bmMtcGF0Y2gvZGFlbW9ucy9jbHZtZC9jbHZtZC1jb3Jvc3luYy5j
Cj09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT0KLS0tIExWTTItY29yb3N5bmMtcGF0Y2gub3JpZy9kYWVtb25zL2Nsdm1kL2Ns
dm1kLWNvcm9zeW5jLmMJMjAwOS0wMi0xMSAxODoxMzoyMC4wMDAwMDAwMDAgKzA4MDAKKysrIExW
TTItY29yb3N5bmMtcGF0Y2gvZGFlbW9ucy9jbHZtZC9jbHZtZC1jb3Jvc3luYy5jCTIwMDktMDIt
MjUgMTg6MzQ6NDkuMDAwMDAwMDAwICswODAwCkBAIC00NzgsNiArNDc4LDExIEBACiAJCURFQlVH
TE9HKCJkbG1fbHNfbG9jayByZXR1cm5lZCAlZFxuIiwgZXJybm8pOwogCQlyZXR1cm4gZXJyOwog
CX0KKwlpZiAobGtzYi5zYl9zdGF0dXMgIT0gMCkKKwl7CisJCURFQlVHTE9HKCJkbG1fbHNfbG9j
ayByZXR1cm5zIGxrc2Iuc2Jfc3RhdHVzICVkXG4iLCBsa3NiLnNiX3N0YXR1cyk7CisJCXJldHVy
biAtbGtzYi5zYl9zdGF0dXM7CisJfQogCiAJREVCVUdMT0coImxvY2tfcmVzb3VyY2UgcmV0dXJu
aW5nICVkLCBsb2NrX2lkPSV4XG4iLCBlcnIsIGxrc2Iuc2JfbGtpZCk7CiAKQEAgLTUwNCw2ICs1
MDksMTIgQEAKIAkJREVCVUdMT0coIlVubG9jayByZXR1cm5lZCAlZFxuIiwgZXJyKTsKIAkJcmV0
dXJuIGVycjsKIAl9CisJaWYgKGxrc2Iuc2Jfc3RhdHVzICE9IDApCisJeworCQlERUJVR0xPRygi
ZGxtX2xzX3VubG9ja193YWl0IHJldHVybnMgbGtzYi5zYl9zdGF0dXM6ICVkXG4iLCBsa3NiLnNi
X3N0YXR1cyk7CisJCXJldHVybiAtbGtzYi5zYl9zdGF0dXM7CisJfSAgIAorCiAKIAlyZXR1cm4g
MDsKIH0K
--0016e65138b68a4b990463bbccb5--
