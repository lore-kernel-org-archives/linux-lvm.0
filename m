Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j0RJEJO09773
	for <linux-lvm@redhat.com>; Thu, 27 Jan 2005 14:14:19 -0500
Received: from percy.comedia.it (percy.comedia.it [212.97.59.71])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j0RJEHqX023436
	for <linux-lvm@redhat.com>; Thu, 27 Jan 2005 14:14:17 -0500
Date: Thu, 27 Jan 2005 20:14:16 +0100
From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] PE Size and Waste
Message-ID: <20050127191416.GC21230@percy.comedia.it>
References: <3b24531c050127035217717af5@mail.gmail.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3b24531c050127035217717af5@mail.gmail.com>
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

On Thu, Jan 27, 2005 at 05:52:57AM -0600, Myrddin Emrys wrote:
>It appears that one PE can only hold a single file. Since my PE size
>is 16MB, that means that the files on my LVM array are... well, less
>than efficiently packed. What puzzles me is that this fact is never
this is not true, there is no relation between PE size and filesystem.
i wonder were you got this impression.

Regards,
L.

-- 
Luca Berra -- bluca@comedia.it
        Communication Media & Services S.r.l.
 /"\
 \ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
 / \
