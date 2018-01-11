Received: from mx1.redhat.com (ext-mx07.extmail.prod.ext.phx2.redhat.com
	[10.5.110.31])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E06FC619E3
	for <linux-lvm@redhat.com>; Thu, 11 Jan 2018 04:51:20 +0000 (UTC)
Received: from mail-pf0-f178.google.com (mail-pf0-f178.google.com
	[209.85.192.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A5434C047B82
	for <linux-lvm@redhat.com>; Thu, 11 Jan 2018 04:51:19 +0000 (UTC)
Received: by mail-pf0-f178.google.com with SMTP id u19so566247pfa.12
	for <linux-lvm@redhat.com>; Wed, 10 Jan 2018 20:51:19 -0800 (PST)
Received: from hurricane.ee.washington.edu ([172.58.43.161])
	by smtp.gmail.com with ESMTPSA id
	h80sm19756525pfj.12.2018.01.10.20.51.17 for <linux-lvm@redhat.com>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 10 Jan 2018 20:51:18 -0800 (PST)
From: Gordon Messmer <gordon.messmer@gmail.com>
References: <12562310-b26a-8a83-9481-d8b54fda40d5@gmail.com>
	<e70ef50c-08ed-b75b-df30-8eae007fa556@redhat.com>
	<cdefc95e-38bc-d071-c592-838991d488f2@gmail.com>
	<d5495aca-c9db-099a-13f2-f602df311a7f@redhat.com>
	<20180102184334.GA22713@agk-dp.fab.redhat.com>
	<116c5469-6f65-b750-d207-2f1e09f9fe8f@gmail.com>
	<d1eaa3a6-ca8b-c14a-e83c-5bca40dc62d5@gmail.com>
Message-ID: <6d6aa9fe-0b05-5f5e-dcca-55bf67988184@gmail.com>
Date: Wed, 10 Jan 2018 20:51:16 -0800
MIME-Version: 1.0
In-Reply-To: <d1eaa3a6-ca8b-c14a-e83c-5bca40dc62d5@gmail.com>
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
Subject: Re: [linux-lvm] unable to exclude LVs using global_filter
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

On 01/03/2018 01:18 PM, Gordon Messmer wrote:
> Submitted for consideration:=20


Did anyone have any comments on this patch?=C2=A0 Martian said they'd try t=
o=20
reword the documentation, but I don't see any recent changes in git...
