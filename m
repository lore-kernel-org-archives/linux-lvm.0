Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.19])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p8JJmRXE004367
	for <linux-lvm@redhat.com>; Mon, 19 Sep 2011 15:48:27 -0400
Received: from mail-ey0-f174.google.com (mail-ey0-f174.google.com
	[209.85.215.174])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p8JJmLCu014043
	for <linux-lvm@redhat.com>; Mon, 19 Sep 2011 15:48:22 -0400
Received: by eya28 with SMTP id 28so2541283eya.33
	for <linux-lvm@redhat.com>; Mon, 19 Sep 2011 12:48:21 -0700 (PDT)
Sender: Gijs Boer <blizzeye@gmail.com>
Message-ID: <4E779C7F.9010507@bsnw.nl>
Date: Mon, 19 Sep 2011 21:48:15 +0200
From: Gijs <info@bsnw.nl>
MIME-Version: 1.0
References: <4E75F91D.4000601@bsnw.nl>
	<8f3368df-7c8b-4741-b859-d10e3eb56a24@email.android.com>
	<4E777DED.4090302@bsnw.nl> <20110919134814.72bd8c3d@bettercgi.com>
In-Reply-To: <20110919134814.72bd8c3d@bettercgi.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] LVM pretends it has more space than it actually has
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

Ah like that. Ok, I can't imagine I typed such a command, but I guess I 
can never really know. But let's say I did, would it be possible to 
somehow retrieve the data from that volume? By increasing the underlying 
raid-5 maybe? Or is it forever lost?

On 19-9-2011 20:48, Ray Morris wrote:
> The symptoms you are presenting, the "missing" 1MB are similar
> to if someone did this in the past:
>
> mdadm --create /dev/md1 /dev/sd[ab]1
> pvcreate /dev/md1
>
> Then later someone did this:
> mdadm --assemble /dev/md1 /dev/volgroup/firstLV
>
> The VG, or the reported size of the PV, is 1MB smaller than
> the device the PV is on, due to the metadata. If the RAID array,
> or rather any raid array, were created on /dev/sda1, for
> example, but then later activated using /dev/volgroup/LV,
> mdadm would report that the device was 1MB too small, which is
> exactly the message you are getting.
