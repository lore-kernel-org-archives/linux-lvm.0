Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j755jdV14000
	for <linux-lvm@redhat.com>; Fri, 5 Aug 2005 01:45:39 -0400
Received: from percy.comedia.it (percy.comedia.it [212.97.59.71])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id j755jR09012557
	for <linux-lvm@redhat.com>; Fri, 5 Aug 2005 01:45:33 -0400
Date: Fri, 5 Aug 2005 07:45:11 +0200
From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] LVM breaks due to partion types when moving versions.
Message-ID: <20050805054511.GA10671@percy.comedia.it>
References: <42F2C76E.6000309@ruckusnetwork.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <42F2C76E.6000309@ruckusnetwork.com>
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

On Thu, Aug 04, 2005 at 09:57:02PM -0400, Lance Reed wrote:
># vgscan
>  Reading all physical volumes.  This may take a while...
>  Found volume group "livestore2_copy_vg" using metadata type lvm2
>  Couldn't find device with uuid 'bbrTkY-2HDP-2z2D-ehDB-8tnP-jI4b-xl6vHi'.
>  Couldn't find all physical volumes for volume group devstore2_vg.
>  Couldn't find device with uuid 'bbrTkY-2HDP-2z2D-ehDB-8tnP-jI4b-xl6vHi'.
>  Couldn't find all physical volumes for volume group devstore2_vg.
>  Volume group "devstore2_vg" not found
>
>But I do have backup copies of /etc/lvm.
>
why don't you enable debugging in the log {} section of
/etc/lvm/lvm.conf and check why the pv is rejected?

L.

-- 
Luca Berra -- bluca@comedia.it
        Communication Media & Services S.r.l.
 /"\
 \ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
 / \
