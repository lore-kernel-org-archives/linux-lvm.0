Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j34M61O03604
	for <linux-lvm@redhat.com>; Mon, 4 Apr 2005 18:06:01 -0400
Received: from percy.comedia.it (percy.comedia.it [212.97.59.71])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id j34M5stL017907
	for <linux-lvm@redhat.com>; Mon, 4 Apr 2005 18:05:55 -0400
Date: Tue, 5 Apr 2005 00:05:51 +0200
From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] Re: putting lvm autodetect into the kernel ala md
Message-ID: <20050404220550.GA23505@percy.comedia.it>
References: <424CA0D1.5060905@nospam.com> <424DA811.4040508@nospam.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <424DA811.4040508@nospam.com>
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

On Sat, Apr 02, 2005 at 03:59:13AM +0800, Andy Sy wrote:
>
>Dispensing with the need for an initrd is but a secondary concern,
>and fact is, I would also say that it brings a lot of flexiblity to
>the table.  So no, having lvm autodetect in the kernel is not
>what I'm looking for.  What we're looking for is good lvm support
>in LILO.

Christophe patches to lilo help a bit, but there still are limitations.
http://www.saout.de/misc/

-- 
Luca Berra -- bluca@comedia.it
        Communication Media & Services S.r.l.
 /"\
 \ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
 / \
