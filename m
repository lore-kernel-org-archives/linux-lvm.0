Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k589mltA028987
	for <linux-lvm@redhat.com>; Thu, 8 Jun 2006 05:48:47 -0400
Received: from wr-out-0506.google.com (wr-out-0506.google.com [64.233.184.229])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k589meSn011959
	for <linux-lvm@redhat.com>; Thu, 8 Jun 2006 05:48:40 -0400
Received: by wr-out-0506.google.com with SMTP id i28so364446wra
	for <linux-lvm@redhat.com>; Thu, 08 Jun 2006 02:48:40 -0700 (PDT)
Message-ID: <5485940d0606080248m7302a044n2c3a8440d5dfc28e@mail.gmail.com>
Date: Thu, 8 Jun 2006 10:48:40 +0100
From: "C'est Pierre" <cestpierre@gmail.com>
Subject: Re: [linux-lvm] lvm and duplicates...
In-Reply-To: <20060608055232.GD18061@percy.comedia.it>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <5485940d0606071038h7c823b7do58e95a486618d643@mail.gmail.com>
	<20060608055232.GD18061@percy.comedia.it>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

Hello Luca

On 6/8/06, Luca Berra <bluca@comedia.it> wrote:
> On Wed, Jun 07, 2006 at 06:38:49PM +0100, C'est Pierre wrote:
> >Greetings,
> >
> >I'm trying to setup a cluster with ServiceGuard but I am going through
> >a lot of hassles doing so. I did a mistake initially by trying to
> >pvcreate the 2 luns of the same physical disk from our storage (fiber
> >channel) and now, while trying to create a new logical volume, I get
> >this weird error, for the record the sda and sdb are the 2 luns coming
> >from different paths (cards):
> >
> you posted before about multipathing,
> and you got one answer.
> what did you do for the multipathing issue you had?


You're right about that. We tried the multipathing, but suddenly one
of the nodes fc card, stopped working and we need to make a couple of
tests before our trial version of the clustering software expires, as
such, we need to fix the LVM problem before we get into the multipath
subject, which will only happen once HP replaces our FC card



> L.
>
