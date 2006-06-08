Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k585qke9023129
	for <linux-lvm@redhat.com>; Thu, 8 Jun 2006 01:52:46 -0400
Received: from percy.comedia.it (percy.comedia.it [212.97.59.71])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k585qdMY010125
	for <linux-lvm@redhat.com>; Thu, 8 Jun 2006 01:52:39 -0400
Date: Thu, 8 Jun 2006 07:52:33 +0200
From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] lvm and duplicates...
Message-ID: <20060608055232.GD18061@percy.comedia.it>
References: <5485940d0606071038h7c823b7do58e95a486618d643@mail.gmail.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5485940d0606071038h7c823b7do58e95a486618d643@mail.gmail.com>
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
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

On Wed, Jun 07, 2006 at 06:38:49PM +0100, C'est Pierre wrote:
>Greetings,
>
>I'm trying to setup a cluster with ServiceGuard but I am going through
>a lot of hassles doing so. I did a mistake initially by trying to
>pvcreate the 2 luns of the same physical disk from our storage (fiber
>channel) and now, while trying to create a new logical volume, I get
>this weird error, for the record the sda and sdb are the 2 luns coming
>from different paths (cards):
>
you posted before about multipathing,
and you got one answer.
what did you do for the multipathing issue you had?

L.

-- 
Luca Berra -- bluca@comedia.it
        Communication Media & Services S.r.l.
 /"\
 \ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
 / \
