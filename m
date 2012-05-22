Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.17])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id q4MFRwC1024415
	for <linux-lvm@redhat.com>; Tue, 22 May 2012 11:27:58 -0400
Received: from mail-pb0-f46.google.com (mail-pb0-f46.google.com
	[209.85.160.46])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q4MFRsq6000579
	for <linux-lvm@redhat.com>; Tue, 22 May 2012 11:27:58 -0400
Received: by mail-pb0-f46.google.com with SMTP id rp8so11592558pbb.33
	for <linux-lvm@redhat.com>; Tue, 22 May 2012 08:27:57 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <53772.172.16.0.29.1337698212.squirrel@beer.org.uk>
References: <53772.172.16.0.29.1337698212.squirrel@beer.org.uk>
Date: Tue, 22 May 2012 10:27:57 -0500
Message-ID: <CAOAgVpw2_EoEVSKW2hbODsrD517+bXf=KGcbL=P8-n3i9scmqw@mail.gmail.com>
From: Les Mikesell <lesmikesell@gmail.com>
Subject: Re: [linux-lvm] Fun and games with mirroring
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
To: lvm@beer.org.uk, LVM general discussion and development <linux-lvm@redhat.com>

On Tue, May 22, 2012 at 9:50 AM, Vic <lvm@beer.org.uk> wrote:
>
>
> p.s. The reason I want to do this with LVM mirrors rather than MD RAID is
> that this is potentially a very useful way of grabbing a backup snapshot
> of a machine prior to some risky operation - it allows me to "fork" a
> machine onto two sets of media. But if it leaves the result unbootable,
> that's something of a problem...
>

How is it different/better than 'mdadm --fail' ing a member out of an
MD raid1 set as a temporary snapshot?

-- 
  Les Mikesell
    lesmikesell@gmail.com
