Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id ED8A72166B27
	for <linux-lvm@redhat.com>; Wed, 26 Feb 2020 14:21:13 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C259F8007B3
	for <linux-lvm@redhat.com>; Wed, 26 Feb 2020 14:21:13 +0000 (UTC)
Date: Wed, 26 Feb 2020 09:03:16 -0500
From: Douglas Paul <doug@bogon.ca>
Message-ID: <20200226140316.GA231654@bogon.ca>
References: <d5dd6c06-1e9f-3737-8712-137f92e351cb@uwaterloo.ca>
	<bcd5bb9d-9ea5-69ba-f041-7b0422b48405@redhat.com>
	<bfd3824a-f360-b4ab-9a08-6a51c8c37a94@uwaterloo.ca>
	<a4708de8-93f9-e663-3184-099a8e40ac3c@redhat.com>
MIME-Version: 1.0
In-Reply-To: <a4708de8-93f9-e663-3184-099a8e40ac3c@redhat.com>
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] faster snapshot creation?
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
Cc: Eric Toombs <ewtoombs@uwaterloo.ca>

On Wed, Feb 26, 2020 at 11:01:26AM +0100, Zdenek Kabelac wrote:
> If you are aspiring of creating tens of snapshot per second - you probably 
> have very unusual workflow/requirement and mostly likely lvm2 is not the right 
> tool for such task ATM.
> [...] 
> So my advice - if you really need to use and create old snaps in very fast way 
> is to developed your very own tool working in you restricted environment where 
> you  might probably not care about meta/data consistencies, deal with speed of 
> udev and gazillion other issues - you can run your small 'ioctl()' stream much 
> more efficiently.

For this workflow, it seems that using qemu-img in conjunction with
qemu-nbd might be a good option.

In this case, you build your reference image in a qcow image (as might
be used for a VM). For a test, you then create a temporary image based
on this reference image (using it as a backing file). Then you can mount
this new image using qemu-nbd to get a block device for it, and mount
the filesystem.

After your test is done, you can unmount, delete the nbd mapping, and
simply delete the temporary image you created.

It should be quite fast and lightweight. You should even be able to run
multiple tests in parallel.

-- 
Douglas Paul
