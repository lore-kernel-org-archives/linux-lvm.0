Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.40])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 96C365B684
	for <linux-lvm@redhat.com>; Tue,  4 Jun 2019 19:35:12 +0000 (UTC)
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
	[209.85.210.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7307C30BDE59
	for <linux-lvm@redhat.com>; Tue,  4 Jun 2019 19:35:03 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id a23so13308776pff.4
	for <linux-lvm@redhat.com>; Tue, 04 Jun 2019 12:35:03 -0700 (PDT)
Message-ID: <5cf6c7e6.1c69fb81.e1551.8ac4@mx.google.com>
MIME-Version: 1.0
In-Reply-To: <d6b4fb26-9a1b-0acd-ce4a-e48322a17e7d@collabora.com>
References: <20190221203334.24504-1-helen.koike@collabora.com>
	<5cf5a724.1c69fb81.1e8f0.08fb@mx.google.com>
	<d6b4fb26-9a1b-0acd-ce4a-e48322a17e7d@collabora.com>
From: Stephen Boyd <swboyd@chromium.org>
Date: Tue, 04 Jun 2019 12:35:01 -0700
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] [PATCH v12] dm: add support to directly boot to a
	mapped device
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
Cc: wad@chromium.org, keescook@chromium.org, snitzer@redhat.com, linux-doc@vger.kernel.org, richard.weinberger@gmail.com, linux-kernel@vger.kernel.org, linux-lvm@redhat.com, enric.balletbo@collabora.com, kernel@collabora.com, agk@redhat.com

Quoting Helen Koike (2019-06-04 10:38:59)
> On 6/3/19 8:02 PM, Stephen Boyd wrote:
> > 
> > I'm trying to boot a mainline linux kernel on a chromeos device with dm
> > verity and a USB stick but it's not working for me even with this patch.
> > I've had to hack around two problems:
> > 
> >  1) rootwait isn't considered
> > 
> >  2) verity doesn't seem to accept UUID for <hash_dev> or <dev>
> > 
> > For the first problem, it happens every boot for me because I'm trying
> > to boot off of a USB stick and it's behind a hub that takes a few
> > seconds to enumerate. If I hack up the code to call dm_init_init() after
> > the 'rootdelay' cmdline parameter is used then I can make this work. It
> > would be much nicer if the whole mechanism didn't use a late initcall
> > though. If it used a hook from prepare_namespace() and then looped
> > waiting for devices to create when rootwait was specified it would work.
> 
> The patch was implemented with late initcall partially to be contained
> in drivers/md/*, but to support rootwait, adding a hook from
> prepare_namespace seems the way to go indeed.

Alright, great.

> 
> > 
> > The second problem is that in chromeos we have the bootloader fill out
> > the UUID of the kernel partition (%U) and then we have another parameter
> > that indicates the offset from that kernel partition to add to the
> > kernel partition (typically 1, i.e. PARTNROFF=1) to find the root
> > filesystem partition. The way verity seems to work here is that we need
> > to specify a path like /dev/sda3 or the major:minor number of the device
> > on the commandline to make this work. It would be better if we could add
> > in support for the PARTNROFF style that name_to_dev_t() handles so we
> > can specify the root partition like we're currently doing. I suspect we
> > should be able to add support for this into the device mapper layer so
> > that we can specify devices this way.
> 
> hmm, I didn't test this yet but at least from what I can see in the
> code, verity_ctr() calls dm_get_device() that ends up calling
> name_to_dev_t() which should take care of PARTNROFF, this requires a bit
> more investigation.
> 

Ok, thanks for pointing that out. Sorry I totally missed this codepath
and I should have investigated more. It works for me with the PARTNROFF
syntax that we've been using, so the problem is the rootwait stuff.
