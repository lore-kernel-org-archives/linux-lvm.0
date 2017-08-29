Received: from mx1.redhat.com (ext-mx10.extmail.prod.ext.phx2.redhat.com
	[10.5.110.39])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3EEDB53C6C
	for <linux-lvm@redhat.com>; Tue, 29 Aug 2017 07:10:53 +0000 (UTC)
Received: from vm04-mail01.alteeve.ca (mail.alteeve.ca [65.39.153.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C864B5D698
	for <linux-lvm@redhat.com>; Tue, 29 Aug 2017 07:10:51 +0000 (UTC)
References: <CABWX_dqg3za8oGq9-ohoCvDiJbmLs36Jgqy2a6NSa82Gxrr8tg@mail.gmail.com>
From: Digimer <lists@alteeve.ca>
Message-ID: <d6f76aa4-0c6c-9a4a-05fb-3b0df3c1d124@alteeve.ca>
Date: Tue, 29 Aug 2017 03:05:17 -0400
MIME-Version: 1.0
In-Reply-To: <CABWX_dqg3za8oGq9-ohoCvDiJbmLs36Jgqy2a6NSa82Gxrr8tg@mail.gmail.com>
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
Subject: Re: [linux-lvm] Distributed Locking of LVM
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
Content-Type: text/plain; charset="windows-1252"
To: LVM general discussion and development <linux-lvm@redhat.com>, Kalyana sundaram <kalyanceg@gmail.com>

On 2017-08-28 08:41 AM, Kalyana sundaram wrote:
> We have a shared iscsi disk at all our boxes, with one vg. We are using
> clvm to manage locks to create extend activate delete list.
> CLVM is tedious to manage especially especially due to reboot if locking
> is struck somewhere. Instead we are thinking of modifying file_locking.c
> to get lock with distributed store like zookeeper or redis and on
> success run the above command, on failure backoff and try again
> The external ocking code will sit at _file_lock_resource, case LCK_VG.=20
> Do you think its risky. Is there some other way people handle it?

I think you're trying to work around a problem, instead of solving it.
The only time locking blocks with DLM is if a node entered an unknown
state and fencing wasn't setup or failed (in which case hanging is the
least bad option available).

A lot of thought and design went into DLM / clvmd. I would be cautious
trying to reinvent a wheel this complex. Instead, do you have any
indication why blocking occurs? Do you have fencing setup and working?
What cluster stack/version/OS are you using?

You might want to post on the clusterlabs list, too.

Users: .... http://lists.clusterlabs.org/mailman/listinfo/users
Developers: http://lists.clusterlabs.org/mailman/listinfo/developers

--=20
Digimer
Papers and Projects: https://alteeve.com/w/
"I am, somehow, less interested in the weight and convolutions of
Einstein=E2=80=99s brain than in the near certainty that people of equal ta=
lent
have lived and died in cotton fields and sweatshops." - Stephen Jay Gould
