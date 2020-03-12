Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8729520316E0
	for <linux-lvm@redhat.com>; Thu, 12 Mar 2020 18:12:22 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7F2EF802BF0
	for <linux-lvm@redhat.com>; Thu, 12 Mar 2020 18:12:22 +0000 (UTC)
Received: by mail-io1-f47.google.com with SMTP id c25so6038437ioi.5
	for <linux-lvm@redhat.com>; Thu, 12 Mar 2020 11:12:19 -0700 (PDT)
MIME-Version: 1.0
References: <20200310202535.Horde.eID8hNJGj7q-b0zb4iXm6A3@webmail.df.eu>
In-Reply-To: <20200310202535.Horde.eID8hNJGj7q-b0zb4iXm6A3@webmail.df.eu>
From: Ming-Hung Tsai <mingnus@gmail.com>
Date: Fri, 13 Mar 2020 02:11:41 +0800
Message-ID: <CAAYit8RAwszwqP+c+4Dp9iTNiWYaici_nKEm1zdZeHD_Cb3dCQ@mail.gmail.com>
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] probable lvm thin_pool exhaustion
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
To: LVM general discussion and development <linux-lvm@redhat.com>

According to step3, it sounds like the mapping tree is health, thus
the metadata could be simply repaired by lvconvert/thin_repair. The
error message might caused by the following reasons:
1. There are too many snapshots, which exhausted the capacity of
metadata spare. Expanding the metadata spare might work.
2. Bugs in thin_repair. What's the version of thin-provisioning-tools
you are using?

Also, before running lvconvert, I suggest to run thin_check first, to
check if the metadata is suitable for automatically repair or not.

$ lvchange -ay qubes_dom0/pool00_tmeta
$ thin_check /dev/mapper/qubes_dom0-pool00_tmeta
$ lvchange -an qubes_dom0/pool00_tmeta

(Maybe "lvconvert --repair" could provide options for setting repair
levels, to prevent novice users from discarding missing mappings.)

If you're not sure about the detail steps, you can upload compressed
metadata for further analysis:
$ lvchange -ay qubes_dom0/pool00_tmeta
$ dd if=/dev/mapper/qubes_dom0-pool00_tmeta of=tmeta.bin
$ tar -czf tmeta.tar.gz tmeta.bin

Finally, the options in step2 are for dmeventd to expand online
thin-pools. They make no help for expanding offline, broken
thin-pools, although that the VG is not full.

On Thu, Mar 12, 2020 at 4:14 PM <maiski@maiski.net> wrote:
>
> step 1:
> lvm vgscan vgchange -ay
> lvm lvconvert --repair qubes_dom0/pool00
> Result:
> using default stripesize 64.00 KiB.
> Terminate called after throwing an instance of 'std::runtime_error'
> what(): transaction_manager::new_block() couldn't allocate new block
> Child 7212 exited abnormally
> Repair of thin metadata volume of thin pool qubes_dom0/pool00 failed (status:1). Manual repair required!
>
> step 2:
> since i suspect that my lvm is full (though it does mark 15 g as free)
> i tried the following changes in the /etc/lvm/lvm.conf
...
> and tried step 1 again, did not work, got the same result as above with qubes_swap as active only
>
> step 3 tried
> lvextend -L+1G qubes_dom0/pool00_tmeta
> Result:
> metadata reference count differ for block xxxxxx, expected 0, but got 1 ...
> Check for pool qubes-dom/pool00 failed (status:1). Manual repair required!
