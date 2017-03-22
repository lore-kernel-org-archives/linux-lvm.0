Received: from mx1.redhat.com (ext-mx10.extmail.prod.ext.phx2.redhat.com
	[10.5.110.39])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 43FAD800DF
	for <linux-lvm@redhat.com>; Wed, 22 Mar 2017 23:22:51 +0000 (UTC)
Received: from mail-vk0-f45.google.com (mail-vk0-f45.google.com
	[209.85.213.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7C4FE2B57BF
	for <linux-lvm@redhat.com>; Wed, 22 Mar 2017 23:22:50 +0000 (UTC)
Received: by mail-vk0-f45.google.com with SMTP id r69so28255828vke.2
	for <linux-lvm@redhat.com>; Wed, 22 Mar 2017 16:22:49 -0700 (PDT)
MIME-Version: 1.0
From: Neutron Sharc <neutronsharc@gmail.com>
Date: Wed, 22 Mar 2017 16:22:08 -0700
Message-ID: <CAB-bdyS2YzqruqsAGpe4risnqFEqLnNxB8y-uFLjq2zm3ATXdw@mail.gmail.com>
Subject: Re: [linux-lvm] lvm operation hangs at semop()
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

If I launch lvm command manually everything works fine.

However if I run several lvm commands back to back (to create multiple
volume groups etc) in a script,  very frequently I see  some lvm
commands hang.

Does this mean I should make some delay inbetween back-to-back lvm commands?
