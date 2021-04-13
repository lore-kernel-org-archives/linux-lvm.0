Return-Path: <SRS0=ldFN=JK=redhat.com=linux-lvm-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=BAYES_00,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCF40C433B4
	for <linux-lvm@archiver.kernel.org>; Tue, 13 Apr 2021 15:58:37 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 63CBE60C40
	for <linux-lvm@archiver.kernel.org>; Tue, 13 Apr 2021 15:58:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 63CBE60C40
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmx.de
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=linux-lvm-bounces@redhat.com
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-256-ynByFVJWOkK1YJmtMDgD3Q-1; Tue, 13 Apr 2021 11:58:34 -0400
X-MC-Unique: ynByFVJWOkK1YJmtMDgD3Q-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E320779EC5;
	Tue, 13 Apr 2021 15:58:27 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 04D5B3697;
	Tue, 13 Apr 2021 15:58:23 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7E42F44A60;
	Tue, 13 Apr 2021 15:58:09 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 13DFw4ZI014885 for <linux-lvm@listman.util.phx.redhat.com>;
	Tue, 13 Apr 2021 11:58:05 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D04909D48F; Tue, 13 Apr 2021 15:58:04 +0000 (UTC)
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 76A719D484
	for <linux-lvm@redhat.com>; Tue, 13 Apr 2021 15:58:00 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4A5C8100DE7B
	for <linux-lvm@redhat.com>; Tue, 13 Apr 2021 15:58:00 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-536-4zHtPjR2OZCu5C9hYJBPlQ-1;
	Tue, 13 Apr 2021 11:57:57 -0400
X-MC-Unique: 4zHtPjR2OZCu5C9hYJBPlQ-1
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.178.104] ([5.83.191.94]) by mail.gmx.net (mrgmx105
	[212.227.17.168]) with ESMTPSA (Nemesis) id 1MDhhX-1lMgB03x9b-00Ar9U
	for <linux-lvm@redhat.com>; Tue, 13 Apr 2021 17:52:53 +0200
To: linux-lvm@redhat.com
From: Marc Weber <marco-oweber@gmx.de>
Message-ID: <34286f13-5b4c-cceb-09f2-09d8703765f3@gmx.de>
Date: Tue, 13 Apr 2021 17:52:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
	Thunderbird/78.8.1
MIME-Version: 1.0
X-Provags-ID: V03:K1:VYClynj0KKwlodlqwJugiTe6SR4b13bMFHj7lx5B0IpjRVe0j92
	IbPxEEsiLkqnhjUvUZwfcDPJQ6ERJmx/vTX1OMPq7wj6nVw7vznV5MPQIQVd/afBeqOo8BH
	GrXyVrbNuGVFsTT91IIMgXjfwLguWoiJzIhMha4sAhlTusVgLc5aFmM48tyFktQXqZ8cD5w
	KBmq1whyHNxRJQ24Bu9FA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:ucN48nKma9Q=:96V6L/RrN4k6hLcFY6z1lZ
	hErpJtLYlWhPV35SyzHHlFoG0LarJD/2y9/hGSFXFCrwLie4pmtaOJ04qQOITrwcrogvxFAdv
	7bcyVgNUJD9NL6VCA4g+gBEWg3ppTpfYDUrok3RgeAtDqJTGacDJqiv2Rtnx536M/w0YRRXFz
	cMlGdniMkXJsSlg4BsnNjVkRX1GuMbue5hix8VZK2NHgUQ8R+FZMjXnvuuJItNlfLclt8CqRF
	hteEmKccP5/SMfuODT0NdPGjWXatvLFj3UDkIkDAhhtOPkftPCX8VILWp2W8ikw8I9RJ4SAq4
	bkxYiget4lPpJV3sfwLBpdKMI8eHlGU8kk9KaY+z7cI14Y6GyQfBpXbUAMlG+PSsCzEa1JUtc
	A0iJfkSC9r4Y2UjrRzj08us9B6cRwDgph3daABORd8GQkqcQ4aYzfvm6TrwcqIos6qEBeRJRo
	xId6ifCiPmX+PSIt5DqBwxHSWC7oS1Q72x423XtCszqIwuppiJMI162x0zFwE8DHFzWLBIMmf
	gdfJULgMmlKzCTuI8NEwqgAl5u7wd0+Rl+gXXTSyFRyYbfJ+baAhUJ2nbeNiKTxBDnL09PUUG
	XduvGlIb93Un/02abzl0i2VNuF4cdaFeqpyAmKlqPpoTYV5OSXaOfM8hIHdTeIqdM5ErdP4MD
	A3hhxycsTiJ7bG7aJQdQxftLd5K9zmderOm++Y8bOxTU4wulb2YM7dumpNDbKOMxkdJYK7sd+
	ulh95nYg776AI+rwooKRoJE0e72o3TejH8OPLTWAmH+KQkD72BDW6LDiv/sCiQTH1vIEobg7n
	ZLkICBto9qlK71b0rNEybrts1pWWHKBFg/+jf0N6Ge885ZJwKZXAHIRavfkfQ4USZFzdYazCq
	pmEbWs+NDjhEPPSNOCwdl/JgfI//v1OicyWiVllepLrttzKAIFQlQzsO3oeJ3s1fu0vrl5sBE
	RMlpq0YYK12UOphoUcaavateFM4/ySIB15rdPiJIEjuCbnT3BHKms3lYfHXgDaj9uyiYTUekh
	dMauvuaSxTlGA1BSutzwwNXf6m+Ql4qtKytW4QAtkoxP95tXA+Cpsuh3WOVSiYqZHJ/4EUd88
	VEkQzYnjhpq3wibZAZrg99kvJZ7KdZPA3ggcVHFdDd6JlQESq/w7w/oON81/wJO+Z4mYQlJsO
	CWrhfvlsCQZrdfaJTnyH1modiWXEheGgW4xJKPWN6rwl7rRwTL65vbR++SAOxaEwLPO7Q=
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: linux-lvm@redhat.com
Subject: [linux-lvm] RAID1 mirroring behavior when one disk is dead
	sometimes?
X-BeenThere: linux-lvm@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
Sender: linux-lvm-bounces@redhat.com
Errors-To: linux-lvm-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-lvm-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"

I created a test with 2 disks then booted without disk2 then without disk1 (each time adding a file.

Then I booted with both. The result was in kernel logs I found 'mirroring or such' and I only got contents of disk 1.


Is there any option to say if both mirrors get changed don't mount but cause an error because that might be better than

getting newly written data reset randomly ?


Did I miss an option? Would mdadm be better ?


I tried looking at archives were CPU bottleneck for raids was mentioned often and 'work being done' on it.

What's status of that or are the advices given there still valid ?


Marc Weber

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

