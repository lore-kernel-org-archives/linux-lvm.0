Received: from mx1.redhat.com (ext-mx05.extmail.prod.ext.phx2.redhat.com
	[10.5.110.29])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 855321001E73
	for <linux-lvm@redhat.com>; Tue,  4 Jun 2019 19:37:23 +0000 (UTC)
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
	[209.85.214.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0627F18DF44
	for <linux-lvm@redhat.com>; Tue,  4 Jun 2019 19:37:14 +0000 (UTC)
Received: by mail-pl1-f195.google.com with SMTP id x7so7751008plr.12
	for <linux-lvm@redhat.com>; Tue, 04 Jun 2019 12:37:13 -0700 (PDT)
Message-ID: <5cf6c869.1c69fb81.5ed2e.84d1@mx.google.com>
MIME-Version: 1.0
In-Reply-To: <20190604182719.15944-1-helen.koike@collabora.com>
References: <20190604182719.15944-1-helen.koike@collabora.com>
From: Stephen Boyd <swboyd@chromium.org>
Date: Tue, 04 Jun 2019 12:37:12 -0700
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] [PATCH] Documentation/dm-init: fix multi device
	example
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
To: Helen Koike <helen.koike@collabora.com>, dm-devel@redhat.com
Cc: wad@chromium.org, keescook@chromium.org, snitzer@redhat.com, linux-doc@vger.kernel.org, richard.weinberger@gmail.com, Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org, linux-lvm@redhat.com, enric.balletbo@collabora.com, kernel@collabora.com, agk@redhat.com

Quoting Helen Koike (2019-06-04 11:27:19)
> The example in the docs regarding multiple device-mappers is invalid (it
> has a wrong number of arguments), it's a left over from previous
> versions of the patch.
> Replace the example with an valid and tested one.
> 
> Signed-off-by: Helen Koike <helen.koike@collabora.com>
> 
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
