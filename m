Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i1O7Q5i11955
	for <linux-lvm@redhat.com>; Tue, 24 Feb 2004 02:26:05 -0500
Received: from percy.comedia.it (percy.comedia.it [212.97.59.71])
	by mx1.redhat.com (8.11.6/8.11.6) with SMTP id i1O7Q4b12340
	for <linux-lvm@redhat.com>; Tue, 24 Feb 2004 02:26:05 -0500
From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] upgrade from kernel 2.4 to 2.6
Message-ID: <20040224072602.GB23439@percy.comedia.it>
References: <20040224031633.GA7431@dman13.dyndns.org>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20040224031633.GA7431@dman13.dyndns.org>
Sender: linux-lvm-admin@redhat.com
Errors-To: linux-lvm-admin@redhat.com
Reply-To: linux-lvm@redhat.com
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Post: <mailto:linux-lvm@redhat.com>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm/>
Date: Tue Feb 24 02:24:03 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

On Mon, Feb 23, 2004 at 10:16:33PM -0500, Derrick 'dman' Hudson wrote:
>The FAQ doesn't mention this hurdle.  I found that upgrading from
>kernel 2.4.23+lvm1 to 2.4.23+lvm2 is really quite trivial
>(particularly with debian - I didn't have to do anything).  However,
>the 2.6 kernel won't boot because lvm can't find any volume groups.
>I've tried 2.6.0, 2.6.2 and most recently 2.6.3.  In each case, the
>device mapper (dm-mod) is loaded and /dev/mapper/control exists
>(I'm using devfsd).  What did I miss?
>
logs.



-- 
Luca Berra -- bluca@comedia.it
        Communication Media & Services S.r.l.
 /"\
 \ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
 / \
