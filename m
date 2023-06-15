Return-Path: <linux-lvm-bounces@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BB06EB64D7
	for <linux-lvm@archiver.kernel.org>; Fri, 16 Jun 2023 05:22:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1686892971;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=NRhvhSoawavsz0kR1iEXCPCtibGp2BfviPGrxKZVSmw=;
	b=Oeh7v1tfJqZM1eVo1SgoRb/+LVw5NGnB6GVMLV1M+BDTdls0J6nqE0jVoANuAJgO24KBh7
	hvoCI6BbTBNmPd+AIT5a2L8hlxZpoqJltxtd1qr/AzYp9zhSttycaxIZcYmTdLtHOcyBsl
	86GHtaCP9sZ2FzbYT2dqSu/7UWelRrs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-568-quBm6nWVN2uis4tAa_WPlA-1; Fri, 16 Jun 2023 01:22:47 -0400
X-MC-Unique: quBm6nWVN2uis4tAa_WPlA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2B303811E78;
	Fri, 16 Jun 2023 05:22:44 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E61B2178B4;
	Fri, 16 Jun 2023 05:22:36 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 99C7E1946597;
	Fri, 16 Jun 2023 05:22:36 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 0ED091946594
 for <linux-lvm@listman.corp.redhat.com>; Thu, 15 Jun 2023 17:52:50 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 0C31D492C38; Thu, 15 Jun 2023 17:52:50 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
 (mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 05529492C1B
 for <linux-lvm@redhat.com>; Thu, 15 Jun 2023 17:52:49 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DB82785A58A
 for <linux-lvm@redhat.com>; Thu, 15 Jun 2023 17:52:49 +0000 (UTC)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com
 [209.85.208.179]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-665-N_e0fUCDMiyPzd64TFYZAQ-1; Thu, 15 Jun 2023 13:52:48 -0400
X-MC-Unique: N_e0fUCDMiyPzd64TFYZAQ-1
Received: by mail-lj1-f179.google.com with SMTP id
 38308e7fff4ca-2b34e133f5aso28724941fa.3
 for <linux-lvm@redhat.com>; Thu, 15 Jun 2023 10:52:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686851566; x=1689443566;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Ff0hR4ZYu+8kzRXpnNBnhT3dqrdk+iVX+qqobPcQB0Y=;
 b=hq+Yzx+qy6pyJETt+9srDumV+9Q7Z16IJSXBtz+uExVi7vXllvIsu9lALbOnrcM49H
 nY7e/CG7JTJYMmL9oApDH+MadroiS6KPCmTuwYzjwN7XQesXY3H0R9PDXK4CuDUQHyPw
 gVrBVteGeglL26B9E5kRyg3Hv9U4oK+l+ZE7Y/r3PLpPhmouAIiU2dUU+2l4wR0YEoTs
 SYAxwadEQW3vtRdA0OMOgn2h9DQUq5A9GIZ6cbeKn1Oweq6YzrE7hQ/aR/grKy1fyK8B
 2XFQa1JPOGR+ZpPpbkLfSx9sHqbOnMdQSxqCOKvzsptfo3tkcmkvbF0sqtta45ac3X0e
 rHcw==
X-Gm-Message-State: AC+VfDzuincltEjn4DRMlKIRBRFZvpFlsOaigN5iUv5sEb2Xff9RIOH+
 3dp1uDISvpsSC8Onk/68ldAC8WCVNsr415BOhchvpSdXXp3R1A==
X-Google-Smtp-Source: ACHHUZ66EvVhS3jKRnONDJm/GWcINtyPfPk4PdfJ/X3NZtIEQPuLGQyHfG1fX8tGgy7U63PLT6O0AvrMeIeNx2IcaHQ=
X-Received: by 2002:a2e:a175:0:b0:2b1:fda8:e653 with SMTP id
 u21-20020a2ea175000000b002b1fda8e653mr129412ljl.27.1686851566026; Thu, 15 Jun
 2023 10:52:46 -0700 (PDT)
MIME-Version: 1.0
From: Scott Moser <ssmoser@gmail.com>
Date: Thu, 15 Jun 2023 13:52:34 -0400
Message-ID: <CAKxE60xTJ2pybn+Z8=h1sPd3WHeqAaEJ3r9Ry2Y6cGP-OFzTNQ@mail.gmail.com>
To: linux-lvm@redhat.com
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mailman-Approved-At: Fri, 16 Jun 2023 05:22:35 +0000
Subject: [linux-lvm] lvm2-testsuite stability
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi,

I'm looking to enable the lvm2 testsuite as an autopkgtest [1] to run
in debian and ubuntu. I have a merge request up at [2].  The general
idea is just to a.) package 'lvm2-testsuite' as an installable package
b.) run the testsuite as part of the autopkgtest.

The version I'm testing on Ubuntu 22.04 is 2.03.16-3 from debian
(rebuilt for 22.04). I'm running udev-vanilla  in a 2 cpu/4GB VM, and
stopping/masking  the following services: dm-event lvm2-lvmpolld
lvm2-monitor lvm2-lvmdbusd .

I'm seeing some failures when running the test.  Some seem expected
due to size limitations, some seem to fail every time, and some see
transient failures.

Here is the list of tests that I'm seeing fail and my initial
categorization.  I've seen this across say half a dozen runs:

expected-fail  api/dbustest.sh
expected-fail  shell/lvconvert-repair-thin.sh
space-req      shell/lvcreate-large-raid.sh
space-req      shell/lvcreate-thin-limits.sh
expected-fail  shell/lvm-conf-error.sh
expected-fail  shell/lvresize-full.sh
timeout        shell/pvmove-abort-all.sh
space-req      shell/pvmove-basic.sh
expected-fail  shell/pvscan-autoactivation-polling.sh
expected-fail  shell/snapshot-merge.sh
space-req      shell/thin-large.sh
racy           shell/writecache-cache-blocksize.sh

expected-fail fails most every time. timeout seems to work sometimes,
space-req i think is just space requirement issue (i'll just skip
those tests).

The full output from the test run can be seen at [3] in the
testsuite-stdout.txt and testsuite-stderr.txt files.

Do others run this test-suite in automation and get reliable results ?

Thanks in advance for any help.

--
[1] https://wiki.ubuntu.com/ProposedMigration#autopkgtests
[2] https://salsa.debian.org/lvm-team/lvm2/-/merge_requests/6
[3] https://gist.github.com/smoser/3107dafec490c0f4d9bf9faf02327f04

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

