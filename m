Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD3C0EB64D7
	for <linux-lvm@archiver.kernel.org>; Tue, 20 Jun 2023 15:06:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1687273618;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=RVpQHmdE/CinMfzXST/f6fgbyWhy5AJOhxkCjV4bDJ0=;
	b=NnSiyPTvbf9kzRu1HTdRFLwJoSWtULjcySh1JIh4CGcve1jUUuLrY+D+cIcmFXcDUNXuH+
	rk7/TGrw4pBNA7jI24La+GMUkOriuMHAUSqyXq7Umw4F2/kxymyY/9tc8j9DZHyZx7epdM
	nPPmntynfD8jjMP7vXZ0pFTaBm8IheE=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-328-jT3fblYHPGO-_4aUxdSaow-1; Tue, 20 Jun 2023 11:04:38 -0400
X-MC-Unique: jT3fblYHPGO-_4aUxdSaow-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 74E563811818;
	Tue, 20 Jun 2023 14:58:05 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8941A2166B26;
	Tue, 20 Jun 2023 14:57:53 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 3295A1946588;
	Tue, 20 Jun 2023 14:57:53 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id CDD641946586
 for <linux-lvm@listman.corp.redhat.com>; Tue, 20 Jun 2023 14:57:51 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 9A5E1492B02; Tue, 20 Jun 2023 14:57:51 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
 (mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 929FB492B01
 for <linux-lvm@redhat.com>; Tue, 20 Jun 2023 14:57:51 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DB06B89C96A
 for <linux-lvm@redhat.com>; Tue, 20 Jun 2023 14:56:39 +0000 (UTC)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com
 [209.85.208.50]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-342-0cCIYFtZMuGQC6D0PBoWDQ-1; Tue, 20 Jun 2023 10:56:08 -0400
X-MC-Unique: 0cCIYFtZMuGQC6D0PBoWDQ-1
Received: by mail-ed1-f50.google.com with SMTP id
 4fb4d7f45d1cf-51a1d539ffaso9134254a12.0
 for <linux-lvm@redhat.com>; Tue, 20 Jun 2023 07:55:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687272954; x=1689864954;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fp505qLiL8uytl7xvfMNIi77L4d74WmWki7O8FvlPdo=;
 b=hkG+6BiQ0J3Z0ZFfLKhY9a9A7gy/+/skOHdgi3QmNOcFSlwv/bOVCPsjN9fLkgq+m4
 7G425KeY1JyPF1PyuaDBINVTYNGc70nWMIlEFtYcwpxMZL5rSpDASZ7G6BFZUD9TwgYY
 uWMIrNXnFKFABKXZJOvFtWTNMcc5rLuTmUYuN53Keq5uJsRx2R1rXLE6Vzx5VEVuDGxK
 rKjq0q+PdbJ9Kc58l7slTEKwKyRimbjewGFjwwfwVeEvw+ixWUgK2voeWJcIA2p0bUNf
 d+ZUbQNqL6shqTQ7tjc7DTnK8pKDE14f8kxMWs2yfDVonD68SQeHgA4LDSqStXFdXELQ
 DLwQ==
X-Gm-Message-State: AC+VfDw+Pfp8tvAvHtXdujznh9CRuO9usbiBoZBsnpYOrB+aVdJM9L7M
 B/B6t25/b4ytTdGzRocd1wa6WMSrjRPM1w==
X-Google-Smtp-Source: ACHHUZ6l1ocz8/ThXL8oBLgPFZfhu1RvlabKvnav5FICgy+nhcRmOppn+1Sevw9x2iHL9kNVhDkXrg==
X-Received: by 2002:aa7:c2d4:0:b0:51a:600e:b30d with SMTP id
 m20-20020aa7c2d4000000b0051a600eb30dmr4929051edp.12.1687272953805; 
 Tue, 20 Jun 2023 07:55:53 -0700 (PDT)
Received: from [192.168.0.177] ([94.142.239.37])
 by smtp.gmail.com with ESMTPSA id
 bo4-20020a0564020b2400b0051a59d81c4dsm1335965edb.3.2023.06.20.07.55.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Jun 2023 07:55:53 -0700 (PDT)
Message-ID: <982f2232-0263-85f7-606e-17afe0173e4f@gmail.com>
Date: Tue, 20 Jun 2023 16:55:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.12.0
To: LVM general discussion and development <linux-lvm@redhat.com>,
 Scott Moser <smoser@brickies.net>
References: <CAKxE60wDS+8d2q5PVZ7SeqN5vMhXK_vK12j_CknZt6rStp5v6g@mail.gmail.com>
 <331beb2b-ec8e-5525-edc5-71fbdfc93c34@gmail.com>
 <CAKxE60xFh5HGjW2JgNd1Ev_gb1N9D6ns4HiCua7QM4Ga_ceZOw@mail.gmail.com>
From: Zdenek Kabelac <zdenek.kabelac@gmail.com>
In-Reply-To: <CAKxE60xFh5HGjW2JgNd1Ev_gb1N9D6ns4HiCua7QM4Ga_ceZOw@mail.gmail.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Subject: Re: [linux-lvm] lvm2-testsuite stability
X-BeenThere: linux-lvm@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/linux-lvm>,
 <mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/linux-lvm/>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/linux-lvm>,
 <mailto:linux-lvm-request@redhat.com?subject=subscribe>
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
Errors-To: linux-lvm-bounces@redhat.com
Sender: "linux-lvm" <linux-lvm-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: gmail.com
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"

Dne 19. 06. 23 v 20:22 Scott Moser napsal(a):
> Hi, thanks for your response.
> 
>> Yep - some tests are failing
>>
>>> expected-fail  api/dbustest.sh
>>
>> We do have them even split to individual tests;
>> api/dbus_test_cache_lv_create.sh
>> api/dbus_test_log_file_option.
> sh
> 
> That is not available upstream, right?
> I just saw the single 'dbustest.sh' in
> [main/test](https://github.com/lvmteam/lvm2/tree/master/test/api).
> Is there another branch I should be looking at?

Correct - that's a local 'mod' for some test machines - but I'd like to get it
merged to upstream - although made in different way.

>> I'd likely need to get access/see  to the logs of such machines
>> (or you would need to provide as some downloadable image of you Qemu machine
>> installation)
> 
> The gist at https://gist.github.com/smoser/3107dafec490c0f4d9bf9faf02327f04
> describes how I am doing this.  It is "standard" package build and autopkgtest
> on debian/ubuntu.  The autopkgtest VM does not use LVM for the system
> so we don't have to worry about interaction with that.
> 
> I could provide a vm image if you were interested.
> 

The tricky part with lvm2 is it's dependency on the proper 'udev' rule 
processing. Unfortunately Debian distro somewhat changes those rules on it's 
upstream package without deeper consultation with upstream and there were few 
more difference that upstream lvm2 doesn't consider as valid modification 
(though haven't checked the recent state)

>>> Do others run this test-suite in automation and get reliabl results ?

Yes our VM machines do give reliable results for properly configured boxes.
Although as said before - there are some 'failing' tests we know about.


> Identifying the set of tests that were allowed to fail in git
> and gating pull requests on successful pass would be wonderful.  Without
> some expected-working list, it is hard for me as a downstream user to
> separate signal from noise.

There are no 'tests' allowed to fail.

There are either 'broken' tests or broken lvm2 code - but it's just not always 
exactly easy to fix some bugs and not enough hands to fix all issues quickly.
So all failing tests do present some real problem from class  a)  or  b) and 
should be fixed - it may have just lower priority with other tasks.

> 
> Would upstream be open to pull requests that added test suite running
>   via github actions?  is there some other preferred mechanism for such a thing?
> 
> The test suite is really well done. I was surprised how well it insulates
> itself from the system and how easy it was to use.  Running it in a
> distro would give the distro developer a *huge* boost in confidence when
> attempting to integrate a new LVM release into the distro.

Basically we are in decision point to move either to github or gitlab and add
this CI capabilities - but definitively some extra hands here might be helpful.

>>
>> We would need to think much harder if the test should be running with
>> some daemons or autoactivation on the system that could see and could
>> interact with our devices generated during the test run (one of the
>> reasons machine for tests need some local modification - we may provide
>> some Ansible-like testing script eventually.
> 
> Autopkgtest will
>   * start a new vm for each run of the tests
>   * install the packages listed as dependencies of the test.
>   * run the test "entrypoint" (debian/test/testsuite).
> 
> I think that I have debian/test/testsuite correctly shutting
> down/masking the necessary system services before invoking the tests. As
> suggested in TESTING.

I'm not sure what's the state of current udev rules - and these may impact 
some tests and possibly add some unexpected randomness

Another aspect of our test suite is the 'try-out' of various 'race' moments,
which may eventually need further tuning on even faster hardware to hit the 
race - but that might be possibly harder to 'set-up' if the VM are without
'ssh' access for a developer to enhance testing (it might be somewhat annoying 
trying to fix this with individual git commits)

> If you are willing to help, I can post a vm image somewhere. I suspect

For at least initial diagnostics should be sufficient to just expose somewhere 
results from failing tests (content of failing tests in this subdir basically).

> you're not working with debian or ubuntu on a daily basis.  If you had
> access to a debian or ubuntu system it would probably be easiest to
> just let autopkgtest do the running. autopkgtest does provide a
> `--shell` and `--shell-fail` parameter to put you into a root shell
> after the tests.
> 
> My ultimate goal is to provide a distro with confidence that the lvm2
> package they're integrating is working correctly.  I'm ok to skip
> tests that provide noisy results.  In this case, having *some*
> reliable test is a huge improvement.

We were kind of trying to get some 'strange' deviation of Debian package fixed 
in past - however it seemed to lead nowhere...
(Ideally all the 'needed' changes should be only set via configure option and 
there should be no need of any extra patch on Debian distro....)

Also note we have some Debian machine VM also part of our testing - although 
some very old version.

Zdenek

PS former Debian member ;)....

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

