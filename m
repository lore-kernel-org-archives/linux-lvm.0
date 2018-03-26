Received: from mx1.redhat.com (ext-mx07.extmail.prod.ext.phx2.redhat.com
	[10.5.110.31])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 95D2660A97
	for <linux-lvm@redhat.com>; Mon, 26 Mar 2018 10:24:13 +0000 (UTC)
Received: from mail-lf0-f53.google.com (mail-lf0-f53.google.com
	[209.85.215.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C88BFC0524EE
	for <linux-lvm@redhat.com>; Mon, 26 Mar 2018 10:24:12 +0000 (UTC)
Received: by mail-lf0-f53.google.com with SMTP id o102-v6so27296345lfg.8
	for <linux-lvm@redhat.com>; Mon, 26 Mar 2018 03:24:12 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <5AB8FDE7020000F9000B19DD@prv-mh.provo.novell.com>
References: <5AB52B8D020000F9000B14B9@prv-mh.provo.novell.com>
	<229d22d1217a7fa96874df0fb6d53e0c@xenhideout.nl>
	<5AB8FDE7020000F9000B19DD@prv-mh.provo.novell.com>
From: Fran Garcia <franchu.garcia@gmail.com>
Date: Mon, 26 Mar 2018 12:23:40 +0200
Message-ID: <CAD+pdNdPKmHb7BQfT4DUj2M+=yy1P3JYtXO4GjNRXn2QA_cwwA@mail.gmail.com>
Subject: Re: [linux-lvm] Can't work normally after attaching disk volumes
 originally in a VG on another machine
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
To: LVM general discussion and development <linux-lvm@redhat.com>

On 26 March 2018 at 08:04, Gang He <ghe@suse.com> wrote:
> It looks like each PV includes a copy meta data for VG, but if some PV has changed (e.g. removed, or moved to another VG),
> the remained PV should have a method to check the integrity when each startup (activated?), to avoid such inconsistent problem automatically.

Your workflow is strange. What are you trying to accomplish here?

Your steps in 5 should be:

vgreduce vg01 /dev/vdc /dev/vdc
pvremove /dev/vdc /dev/vdd

That way you ensure there's no leftover metadata in the PVs (specially
if you need to attach those disks to a different system)

Again a usecase to understand your workflow would be beneficial...

Cheers

fran
