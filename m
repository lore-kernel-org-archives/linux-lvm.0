Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i8O6I3r18035
	for <linux-lvm@redhat.com>; Fri, 24 Sep 2004 02:18:03 -0400
Received: from percy.comedia.it (percy.comedia.it [212.97.59.71])
	by mx1.redhat.com (8.12.11/8.12.10) with ESMTP id i8O6I19A014964
	for <linux-lvm@redhat.com>; Fri, 24 Sep 2004 02:18:01 -0400
Date: Fri, 24 Sep 2004 08:17:55 +0200
From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] which files, which physical volumes?
Message-ID: <20040924061754.GD13943@percy.comedia.it>
References: <41538691.2040807@myself.gen.nz>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <41538691.2040807@myself.gen.nz>
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Fri, Sep 24, 2004 at 02:29:37PM +1200, Steve Wray wrote:
>Or maybe pvmove is *still* broken, in which case I need to find the 
>files which occupy that physical volume, move them to a different 
>logical volume altogether and then forcibly remove that physical volume 
>without regard to the files that are no longer on it... and hopefuly 
>this won't cause corruption on the filesystem on that logical volume.
this will certainly cause corruption.

-- 
Luca Berra -- bluca@comedia.it
        Communication Media & Services S.r.l.
 /"\
 \ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
 / \
