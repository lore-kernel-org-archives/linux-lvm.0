Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m5GLNFxE029136
	for <linux-lvm@redhat.com>; Mon, 16 Jun 2008 17:23:15 -0400
Received: from yw-out-2324.google.com (yw-out-2324.google.com [74.125.46.28])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m5GLLcmT009776
	for <linux-lvm@redhat.com>; Mon, 16 Jun 2008 17:23:00 -0400
Received: by yw-out-2324.google.com with SMTP id 5so2841982ywb.81
	for <linux-lvm@redhat.com>; Mon, 16 Jun 2008 14:22:56 -0700 (PDT)
Message-ID: <a71bd89a0806161422ge21e858r2eca01e11bf8f69a@mail.gmail.com>
Date: Mon, 16 Jun 2008 14:22:55 -0700
From: "Dan Kegel" <dank@kegel.com>
Sender: daniel.r.kegel@gmail.com
Subject: Re: [linux-lvm] Server hangs when writing to LVM volume due to LVM
	Snapshots
In-Reply-To: <20080616211844.GL3765@campbell-lange.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <20080616135319.GA29234@campbell-lange.net>
	<4856715A.6050107@wpkg.org> <20080616141907.GH3765@campbell-lange.net>
	<48567DF8.7080600@wpkg.org> <20080616151014.GJ3765@campbell-lange.net>
	<4856BC88.4060602@wpkg.org> <20080616211844.GL3765@campbell-lange.net>
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>

On Mon, Jun 16, 2008 at 2:18 PM, Veselin Kantsev
<veselin@campbell-lange.net> wrote:
> I think I've misunderstood the concept of snapshots.

No, only how lvm works under the hood.

> So If I have 7 snapshots of the same volume (created at different times)
> and a file is changed, would the change affect all 7 snapshots or
> just the latest one created?

If the file had not changed since the beginning of time,
then when you change it, each block needs to be
written to each snapshot because of the way COW
is implemented in LVM snapshots.

> If the former, then I imagine changing a 1GB+ file, in my
> situation will result in an unpleasant experience with the LVM snapshots.

Correct.  That's why people have been asking for that common
snapshot store for a long time.  Zumastor is more or less a
preview of this long-sought lvm feature.
- Dan
