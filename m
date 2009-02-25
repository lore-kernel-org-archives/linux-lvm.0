Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n1PDZ0K6009600
	for <linux-lvm@redhat.com>; Wed, 25 Feb 2009 08:35:00 -0500
Received: from ti-out-0910.google.com (ti-out-0910.google.com [209.85.142.185])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n1PDYfYD005313
	for <linux-lvm@redhat.com>; Wed, 25 Feb 2009 08:34:42 -0500
Received: by ti-out-0910.google.com with SMTP id 11so29319tim.7
	for <linux-lvm@redhat.com>; Wed, 25 Feb 2009 05:34:40 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <49A547EB.6020106@redhat.com>
References: <1cafab770902250235x39c180a4x63b9e5e6d9a761d5@mail.gmail.com>
	<49A547EB.6020106@redhat.com>
Date: Wed, 25 Feb 2009 21:34:40 +0800
Message-ID: <1cafab770902250534m38e712cepc2f0c3e80ad93257@mail.gmail.com>
Subject: Re: [linux-lvm] clvmd-corosync should check lksb.sb_status instead of
	return code ?
From: Xinwei Hu <hxinwei@gmail.com>
Content-Type: multipart/mixed; boundary=0016e652f4e83d2def0463be4c31
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

--0016e652f4e83d2def0463be4c31
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Chrissie,

  You are right. It should be returned in errno. Also, it seems errno
should positive as lksb.sb_status too.

  I modified the patch a little bit further.

  Any comments ?

2009/2/25 Chrissie Caulfield <ccaulfie@redhat.com>:
> Xinwei Hu wrote:
>> Hi all,
>>
>> =C2=A0 In clvmd-corosync, lock_resource calls dlm_ls_lock_wait with flag=
s
>> set to LKF_NOQUEUE.
>> =C2=A0 When LKF_NOQUEUE is set, the return code of dlm_ls_lock_wait is
>> always 0, while the actual errno is in lksb.sb_status.
>>
>> =C2=A0 This causes problem when using vgchange -aey or something like.
>>
>> =C2=A0 I attached a patch to try to fix this issue.
>>
>> =C2=A0 Please help to review. Thanks.
>
> Hi
>
> You are correct, the functions do need to check the LKSB. Your patch
> isn't quite right I don't think though - the lksb status should be
> returned in errno as shown below:
>
> --
>
> Chrissie
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>

--0016e652f4e83d2def0463be4c31
Content-Type: text/x-patch; charset=US-ASCII; name="clvmd-corosync2.diff"
Content-Disposition: attachment; filename="clvmd-corosync2.diff"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_frm1s5sj1

SW5kZXg6IGNsdm1kLWNvcm9zeW5jLmMKPT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQpSQ1MgZmlsZTogL2N2cy9sdm0yL0xW
TTIvZGFlbW9ucy9jbHZtZC9jbHZtZC1jb3Jvc3luYy5jLHYKcmV0cmlldmluZyByZXZpc2lvbiAx
LjUKZGlmZiAtdSAtcCAtcjEuNSBjbHZtZC1jb3Jvc3luYy5jCi0tLSBjbHZtZC1jb3Jvc3luYy5j
CTExIEZlYiAyMDA5IDEwOjEzOjIwIC0wMDAwCTEuNQorKysgY2x2bWQtY29yb3N5bmMuYwkyNSBG
ZWIgMjAwOSAxMzoyODozNCAtMDAwMApAQCAtNDc4LDYgKzQ3OCwxMiBAQCBzdGF0aWMgaW50IF9s
b2NrX3Jlc291cmNlKGNvbnN0IGNoYXIgKnJlCiAJCURFQlVHTE9HKCJkbG1fbHNfbG9jayByZXR1
cm5lZCAlZFxuIiwgZXJybm8pOwogCQlyZXR1cm4gZXJyOwogCX0KKwlpZiAobGtzYi5zYl9zdGF0
dXMgIT0gMCkKKwl7CisJCURFQlVHTE9HKCJkbG1fbHNfbG9jayByZXR1cm5zIGxrc2Iuc2Jfc3Rh
dHVzICVkXG4iLCBsa3NiLnNiX3N0YXR1cyk7CisJCWVycm5vID0gbGtzYi5zYl9zdGF0dXM7CisJ
CXJldHVybiAtMTsKKwl9CiAKIAlERUJVR0xPRygibG9ja19yZXNvdXJjZSByZXR1cm5pbmcgJWQs
IGxvY2tfaWQ9JXhcbiIsIGVyciwgbGtzYi5zYl9sa2lkKTsKIApAQCAtNTA0LDYgKzUxMCwxMyBA
QCBzdGF0aWMgaW50IF91bmxvY2tfcmVzb3VyY2UoY29uc3QgY2hhciAqCiAJCURFQlVHTE9HKCJV
bmxvY2sgcmV0dXJuZWQgJWRcbiIsIGVycik7CiAJCXJldHVybiBlcnI7CiAJfQorCWlmIChsa3Ni
LnNiX3N0YXR1cyAhPSAwKQorCXsKKwkJREVCVUdMT0coImRsbV9sc191bmxvY2tfd2FpdCByZXR1
cm5zIGxrc2Iuc2Jfc3RhdHVzOiAlZFxuIiwgbGtzYi5zYl9zdGF0dXMpOworCQllcnJubyA9IGxr
c2Iuc2Jfc3RhdHVzOworCQlyZXR1cm4gLTE7CisJfSAgIAorCiAKIAlyZXR1cm4gMDsKIH0K
--0016e652f4e83d2def0463be4c31--
