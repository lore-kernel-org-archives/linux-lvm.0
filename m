Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m3N9aiST002908
	for <linux-lvm@redhat.com>; Wed, 23 Apr 2008 05:36:44 -0400
Received: from ti-out-0910.google.com (ti-out-0910.google.com [209.85.142.190])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id m3N9PkUB015566
	for <linux-lvm@redhat.com>; Wed, 23 Apr 2008 05:32:27 -0400
Received: by ti-out-0910.google.com with SMTP id 11so1006418tim.7
	for <linux-lvm@redhat.com>; Wed, 23 Apr 2008 02:25:17 -0700 (PDT)
Message-ID: <1cafab770804230225l6dabdd65na69df87466a81ed6@mail.gmail.com>
Date: Wed, 23 Apr 2008 17:25:17 +0800
From: "Xinwei Hu" <hxinwei@gmail.com>
Subject: Re: [linux-lvm] clvmd on openais
In-Reply-To: <480EFD72.5010809@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_17157_8733456.1208942717845"
References: <1cafab770804230025q585c565awc8a70c8b9b2d2345@mail.gmail.com>
	<480EE876.6050400@redhat.com>
	<1cafab770804230110n4370eb37ga0dc41ee255ecffb@mail.gmail.com>
	<480EFD72.5010809@redhat.com>
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

------=_Part_17157_8733456.1208942717845
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

2008/4/23, Christine Caulfield <ccaulfie@redhat.com>:
> Xinwei Hu wrote:
>  > 2008/4/23, Christine Caulfield <ccaulfie@redhat.com>:
>  >> Xinwei Hu wrote:
>  >>  > Hi all,
>  >>  >   clvmd-openais.c uses saLckResourceLockAsync and
>  >>  > saLckResourceUnlockAsync. But they then pthread_cond_wait the lock
>  >>  > operation to finished.
>  >>  >
>  >>  >   Since we have to wait, why not switch to use saLckResourceLock and
>  >>  > saLckResourceUnlock directly ? Are there any reasons behind this ?
>  >>  >
>  >>
>  >>
>  >> It's mainly because the code was copied and editted from the other
>  >>  cluster systems, I think :-)
>  > Then I propose this patch to switch over. ;)
>
>
>
> Thanks, but that patch seems to have got corrupted or something, it
>  doesn't apply to head of CVS. can you send it again please ?
>
>
>  Hunk #3 FAILED at 295.
>  Hunk #4 succeeded at 315 (offset -8 lines).
>  Hunk #6 succeeded at 478 (offset -8 lines).
>  patch: **** malformed patch at line 161: @@ -590,15 +536,13 @@
>
Take 2.
Against CVS head now. Please help to review ;)
>
>  Chrissie
>
>  _______________________________________________
>  linux-lvm mailing list
>  linux-lvm@redhat.com
>  https://www.redhat.com/mailman/listinfo/linux-lvm
>  read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>

------=_Part_17157_8733456.1208942717845
Content-Type: text/x-patch; name=clvmd-openais.patch
Content-Transfer-Encoding: base64
X-Attachment-Id: f_ffdpca9i
Content-Disposition: attachment; filename=clvmd-openais.patch

LS0tIExWTTIvZGFlbW9ucy9jbHZtZC9jbHZtZC1vcGVuYWlzLmMJMjAwNy0wNy0xMSAyMDowNzoz
OS4wMDAwMDAwMDAgKzA4MDAKKysrIGNsdm1kLW9wZW5haXMuYwkyMDA4LTA0LTIzIDE3OjI1OjMw
LjAwMDAwMDAwMCArMDgwMApAQCAtNTAsMTEgKzUwLDYgQEAKIC8qIFRpbWVvdXQgdmFsdWUgZm9y
IHNldmVyYWwgb3BlbmFpcyBjYWxscyAqLwogI2RlZmluZSBUSU1FT1VUIDEwCiAKLXN0YXRpYyB2
b2lkIGxja19sb2NrX2NhbGxiYWNrKFNhSW52b2NhdGlvblQgaW52b2NhdGlvbiwKLQkJCSAgICAg
IFNhTGNrTG9ja1N0YXR1c1QgbG9ja1N0YXR1cywKLQkJCSAgICAgIFNhQWlzRXJyb3JUIGVycm9y
KTsKLXN0YXRpYyB2b2lkIGxja191bmxvY2tfY2FsbGJhY2soU2FJbnZvY2F0aW9uVCBpbnZvY2F0
aW9uLAotCQkJCVNhQWlzRXJyb3JUIGVycm9yKTsKIHN0YXRpYyB2b2lkIGNwZ19kZWxpdmVyX2Nh
bGxiYWNrIChjcGdfaGFuZGxlX3QgaGFuZGxlLAogCQkJCSAgc3RydWN0IGNwZ19uYW1lICpncm91
cE5hbWUsCiAJCQkJICB1aW50MzJfdCBub2RlaWQsCkBAIC05MiwxMSArODcsNiBAQAogCS5jcGdf
Y29uZmNoZ19mbiA9ICAgICAgICAgICAgY3BnX2NvbmZjaGdfY2FsbGJhY2ssCiB9OwogCi1TYUxj
a0NhbGxiYWNrc1QgbGNrX2NhbGxiYWNrcyA9IHsKLSAgICAgICAgLnNhTGNrTG9ja0dyYW50Q2Fs
bGJhY2sgICAgICA9IGxja19sb2NrX2NhbGxiYWNrLAotICAgICAgICAuc2FMY2tSZXNvdXJjZVVu
bG9ja0NhbGxiYWNrID0gbGNrX3VubG9ja19jYWxsYmFjawotfTsKLQogc3RydWN0IG5vZGVfaW5m
bwogewogCWVudW0ge05PREVfVU5LTk9XTiwgTk9ERV9ET1dOLCBOT0RFX1VQLCBOT0RFX0NMVk1E
fSBzdGF0ZTsKQEAgLTMwNSwzMiArMjk1LDYgQEAKIAludW1fbm9kZXMgPSBqb2luZWRfbGlzdF9l
bnRyaWVzOwogfQogCi1zdGF0aWMgdm9pZCBsY2tfbG9ja19jYWxsYmFjayhTYUludm9jYXRpb25U
IGludm9jYXRpb24sCi0JCQkgICAgICBTYUxja0xvY2tTdGF0dXNUIGxvY2tTdGF0dXMsCi0JCQkg
ICAgICBTYUFpc0Vycm9yVCBlcnJvcikKLXsKLQlzdHJ1Y3QgbG9ja193YWl0ICpsd2FpdCA9IChz
dHJ1Y3QgbG9ja193YWl0ICopKGxvbmcpaW52b2NhdGlvbjsKLQotCURFQlVHTE9HKCJsY2tfbG9j
a19jYWxsYmFjaywgZXJyb3IgPSAlZFxuIiwgZXJyb3IpOwotCi0JbHdhaXQtPnN0YXR1cyA9IGVy
cm9yOwotCXB0aHJlYWRfbXV0ZXhfbG9jaygmbHdhaXQtPm11dGV4KTsKLQlwdGhyZWFkX2NvbmRf
c2lnbmFsKCZsd2FpdC0+Y29uZCk7Ci0JcHRocmVhZF9tdXRleF91bmxvY2soJmx3YWl0LT5tdXRl
eCk7Ci19Ci0KLXN0YXRpYyB2b2lkIGxja191bmxvY2tfY2FsbGJhY2soU2FJbnZvY2F0aW9uVCBp
bnZvY2F0aW9uLAotCQkJCVNhQWlzRXJyb3JUIGVycm9yKQotewotCXN0cnVjdCBsb2NrX3dhaXQg
Kmx3YWl0ID0gKHN0cnVjdCBsb2NrX3dhaXQgKikobG9uZylpbnZvY2F0aW9uOwotCi0JREVCVUdM
T0coImxja191bmxvY2tfY2FsbGJhY2tcbiIpOwotCi0JbHdhaXQtPnN0YXR1cyA9IFNBX0FJU19P
SzsKLQlwdGhyZWFkX211dGV4X2xvY2soJmx3YWl0LT5tdXRleCk7Ci0JcHRocmVhZF9jb25kX3Np
Z25hbCgmbHdhaXQtPmNvbmQpOwotCXB0aHJlYWRfbXV0ZXhfdW5sb2NrKCZsd2FpdC0+bXV0ZXgp
OwotfQogCiBzdGF0aWMgaW50IGxja19kaXNwYXRjaChzdHJ1Y3QgbG9jYWxfY2xpZW50ICpjbGll
bnQsIGNoYXIgKmJ1ZiwgaW50IGxlbiwKIAkJCWNvbnN0IGNoYXIgKmNzaWQsIHN0cnVjdCBsb2Nh
bF9jbGllbnQgKipuZXdfY2xpZW50KQpAQCAtMzU5LDcgKzMyMyw3IEBACiAJfQogCiAJZXJyID0g
c2FMY2tJbml0aWFsaXplKCZsY2tfaGFuZGxlLAotCQkJICAgICAgJmxja19jYWxsYmFja3MsCisJ
CQkJCU5VTEwsCiAJCQkgICAgICAmdmVyKTsKIAlpZiAoZXJyICE9IFNBX0FJU19PSykgewogCQlj
cGdfaW5pdGlhbGl6ZSgmY3BnX2hhbmRsZSwgJmNwZ19jYWxsYmFja3MpOwpAQCAtNDk1LDE1ICs0
NTksMTEgQEAKIC8qIFJlYWwgbG9ja2luZyAqLwogc3RhdGljIGludCBfbG9ja19yZXNvdXJjZShj
aGFyICpyZXNvdXJjZSwgaW50IG1vZGUsIGludCBmbGFncywgaW50ICpsb2NraWQpCiB7Ci0Jc3Ry
dWN0IGxvY2tfd2FpdCBsd2FpdDsKIAlzdHJ1Y3QgbG9ja19pbmZvICpsaW5mbzsKIAlTYUxja1Jl
c291cmNlSGFuZGxlVCByZXNfaGFuZGxlOwogCVNhQWlzRXJyb3JUIGVycjsKIAlTYUxja0xvY2tJ
ZFQgbG9ja19pZDsKLQotCXB0aHJlYWRfY29uZF9pbml0KCZsd2FpdC5jb25kLCBOVUxMKTsKLQlw
dGhyZWFkX211dGV4X2luaXQoJmx3YWl0Lm11dGV4LCBOVUxMKTsKLQlwdGhyZWFkX211dGV4X2xv
Y2soJmx3YWl0Lm11dGV4KTsKKwlTYUxja0xvY2tTdGF0dXNUIGxvY2tTdGF0dXM7CiAKIAkvKiBU
aGlzIG5lZWRzIHRvIGJlIGNvbnZlcnRlZCBmcm9tIERMTS9MVk0yIHZhbHVlIGZvciBPcGVuQUlT
IExDSyAqLwogCWlmIChmbGFncyAmIExDS19OT05CTE9DSykgZmxhZ3MgPSBTQV9MQ0tfTE9DS19O
T19RVUVVRTsKQEAgLTUyNiwyNCArNDg2LDI0IEBACiAJCXJldHVybiBhaXNfdG9fZXJybm8oZXJy
KTsKIAl9CiAKLQllcnIgPSBzYUxja1Jlc291cmNlTG9ja0FzeW5jKHJlc19oYW5kbGUsCi0JCQkJ
ICAgICAoU2FJbnZvY2F0aW9uVCkobG9uZykmbHdhaXQsCi0JCQkJICAgICAmbG9ja19pZCwKLQkJ
CQkgICAgIG1vZGUsCi0JCQkJICAgICBmbGFncywKLQkJCQkgICAgIDApOwotCWlmIChlcnIgIT0g
U0FfQUlTX09LKQorCWVyciA9IHNhTGNrUmVzb3VyY2VMb2NrKAorCQkJcmVzX2hhbmRsZSwKKwkJ
CSZsb2NrX2lkLAorCQkJbW9kZSwKKwkJCWZsYWdzLAorCQkJMCwKKwkJCVNBX1RJTUVfRU5ELAor
CQkJJmxvY2tTdGF0dXMpOworCWlmIChlcnIgIT0gU0FfQUlTX09LICYmIGxvY2tTdGF0dXMgIT0g
U0FfTENLX0xPQ0tfR1JBTlRFRCkKIAl7CiAJCWZyZWUobGluZm8pOwogCQlzYUxja1Jlc291cmNl
Q2xvc2UocmVzX2hhbmRsZSk7CiAJCXJldHVybiBhaXNfdG9fZXJybm8oZXJyKTsKIAl9Ci0KKwkJ
CQogCS8qIFdhaXQgZm9yIGl0IHRvIGNvbXBsZXRlICovCi0JcHRocmVhZF9jb25kX3dhaXQoJmx3
YWl0LmNvbmQsICZsd2FpdC5tdXRleCk7Ci0JcHRocmVhZF9tdXRleF91bmxvY2soJmx3YWl0Lm11
dGV4KTsKIAotCURFQlVHTE9HKCJsb2NrX3Jlc291cmNlIHJldHVybmluZyAlZCwgbG9ja19pZD0l
bGx4XG4iLCBsd2FpdC5zdGF0dXMsCisJREVCVUdMT0coImxvY2tfcmVzb3VyY2UgcmV0dXJuaW5n
ICVkLCBsb2NrX2lkPSVsbHhcbiIsIGVyciwKIAkJIGxvY2tfaWQpOwogCiAJbGluZm8tPmxvY2tf
aWQgPSBsb2NrX2lkOwpAQCAtNTUxLDQzICs1MTEsMzQgQEAKIAogCWRtX2hhc2hfaW5zZXJ0KGxv
Y2tfaGFzaCwgcmVzb3VyY2UsIGxpbmZvKTsKIAotCXJldHVybiBhaXNfdG9fZXJybm8obHdhaXQu
c3RhdHVzKTsKKwlyZXR1cm4gYWlzX3RvX2Vycm5vKGVycik7CiB9CiAKIAogc3RhdGljIGludCBf
dW5sb2NrX3Jlc291cmNlKGNoYXIgKnJlc291cmNlLCBpbnQgbG9ja2lkKQogewotCXN0cnVjdCBs
b2NrX3dhaXQgbHdhaXQ7CiAJU2FBaXNFcnJvclQgZXJyOwogCXN0cnVjdCBsb2NrX2luZm8gKmxp
bmZvOwogCi0JcHRocmVhZF9jb25kX2luaXQoJmx3YWl0LmNvbmQsIE5VTEwpOwotCXB0aHJlYWRf
bXV0ZXhfaW5pdCgmbHdhaXQubXV0ZXgsIE5VTEwpOwotCXB0aHJlYWRfbXV0ZXhfbG9jaygmbHdh
aXQubXV0ZXgpOwotCiAJREVCVUdMT0coInVubG9ja19yZXNvdXJjZSAlc1xuIiwgcmVzb3VyY2Up
OwogCWxpbmZvID0gZG1faGFzaF9sb29rdXAobG9ja19oYXNoLCByZXNvdXJjZSk7CiAJaWYgKCFs
aW5mbykKIAkJcmV0dXJuIDA7CiAKIAlERUJVR0xPRygidW5sb2NrX3Jlc291cmNlOiBsb2NraWQ6
ICVsbHhcbiIsIGxpbmZvLT5sb2NrX2lkKTsKLQllcnIgPSBzYUxja1Jlc291cmNlVW5sb2NrQXN5
bmMoKFNhSW52b2NhdGlvblQpKGxvbmcpJmx3YWl0LCBsaW5mby0+bG9ja19pZCk7CisJZXJyID0g
c2FMY2tSZXNvdXJjZVVubG9jayhsaW5mby0+bG9ja19pZCwgU0FfVElNRV9FTkQpOwogCWlmIChl
cnIgIT0gU0FfQUlTX09LKQogCXsKIAkJREVCVUdMT0coIlVubG9jayByZXR1cm5lZCAlZFxuIiwg
ZXJyKTsKIAkJcmV0dXJuIGFpc190b19lcnJubyhlcnIpOwogCX0KIAotCS8qIFdhaXQgZm9yIGl0
IHRvIGNvbXBsZXRlICovCi0JcHRocmVhZF9jb25kX3dhaXQoJmx3YWl0LmNvbmQsICZsd2FpdC5t
dXRleCk7Ci0JcHRocmVhZF9tdXRleF91bmxvY2soJmx3YWl0Lm11dGV4KTsKLQogCS8qIFJlbGVh
c2UgdGhlIHJlc291cmNlICovCiAJZG1faGFzaF9yZW1vdmUobG9ja19oYXNoLCByZXNvdXJjZSk7
CiAJc2FMY2tSZXNvdXJjZUNsb3NlKGxpbmZvLT5yZXNfaGFuZGxlKTsKIAlmcmVlKGxpbmZvKTsK
IAotCXJldHVybiBhaXNfdG9fZXJybm8obHdhaXQuc3RhdHVzKTsKKwlyZXR1cm4gYWlzX3RvX2Vy
cm5vKGVycik7CiB9CiAKIHN0YXRpYyBpbnQgX3N5bmNfbG9jayhjb25zdCBjaGFyICpyZXNvdXJj
ZSwgaW50IG1vZGUsIGludCBmbGFncywgaW50ICpsb2NraWQpCg==
------=_Part_17157_8733456.1208942717845--
