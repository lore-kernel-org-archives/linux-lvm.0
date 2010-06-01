Received: from mx1.redhat.com (ext-mx10.extmail.prod.ext.phx2.redhat.com
	[10.5.110.14])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o51DO0dC002052
	for <linux-lvm@redhat.com>; Tue, 1 Jun 2010 09:24:00 -0400
Received: from mail-gy0-f174.google.com (mail-gy0-f174.google.com
	[209.85.160.174])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o51DNlsV023309
	for <linux-lvm@redhat.com>; Tue, 1 Jun 2010 09:23:48 -0400
Received: by gye5 with SMTP id 5so1093875gye.33
	for <linux-lvm@redhat.com>; Tue, 01 Jun 2010 06:23:47 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1275338712.1423.2@raydesk1.bettercgi.com>
References: <AANLkTikmw8_d91zrpW9HFKz8d5XCkg-b8h_NdD3leR9u@mail.gmail.com>
	<1275338712.1423.2@raydesk1.bettercgi.com>
Date: Tue, 1 Jun 2010 22:23:46 +0900
Message-ID: <AANLkTilQv57djK9CpZH2R52ONoIuBAAYtmLO1B-JtOY_@mail.gmail.com>
From: Romeo Theriault <romeo.theriault@maine.edu>
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] Is it possible to bypass LVM and mount contained
	partition directly?
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
Content-Type: text/plain; charset="utf-8"
To: LVM general discussion and development <linux-lvm@redhat.com>

On Tue, Jun 1, 2010 at 05:45, Ray Morris <support@bettercgi.com> wrote:
>
> �In general, no, though in your specific case it may be
> that all of the extents are stored contigously and it might
> work. You would probably need to use losetup -o and specify
> the offset. �This would be more of a last ditch data recovery
> effort than something you'd design into a production system,
> though.


Alright, was hoping for a life saver here but it doesn't sound like
it's this way and you're right it doesn't sound production worthy.


>
> �You might have better results altering one of these issues
> that is causing you to consider such action:
>
>> �I can't import the pv/vg because they have the same name/uuid
>> as the existing VG (it's really the same system) and I can't change
>> them with something like vgimportclone because the backed up vm image
>> files are read-only.
>
> �In other words, you would back up to one of the following questions:
> How can I change the names and UUIDs of the backups?
> How can I import an LV which has a conflicting UUID?
> How can I use vgimport with a read only source?
>
> �Specifically, you might be able to ignore the meta data on
> the backup volumes with pvmetadatacopies �= 0 and use "dirs"
> in lvm.conf, so you can change the working meta data even
> though they are read only.

Hmm, this sounds interesting I'll have to spend some time trying to
figure out how this might be possible.

Thanks for the ideas.


Romeo
