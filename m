Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id k1AGtd117888
	for <linux-lvm@redhat.com>; Fri, 10 Feb 2006 11:55:39 -0500
Received: from percy.comedia.it (percy.comedia.it [212.97.59.71])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id k1AGtakb016377
	for <linux-lvm@redhat.com>; Fri, 10 Feb 2006 11:55:36 -0500
Date: Fri, 10 Feb 2006 17:55:29 +0100
From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] Symbolic Link Related Query
Message-ID: <20060210165529.GA23608@percy.comedia.it>
References: <DBFC31836FE4044AAC43F361228CA2F801A0427A@blr-m1-msg.wipro.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <DBFC31836FE4044AAC43F361228CA2F801A0427A@blr-m1-msg.wipro.com>
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

On Fri, Feb 10, 2006 at 07:07:39PM +0530, deepak.barua@wipro.com wrote:
>$ touch h
>$ ln h j
>$ ln -s h k
>$ ls -i h j k
> 176016 h   176016 j   176016 k
>$

ever considered a possible bug in ls?

L.

-- 
Luca Berra -- bluca@comedia.it
        Communication Media & Services S.r.l.
 /"\
 \ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
 / \
