Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i82Dqk322601
	for <linux-lvm@redhat.com>; Thu, 2 Sep 2004 09:52:46 -0400
Received: from mail1.speakeasy.net (mail1.speakeasy.net [216.254.0.201])
	by mx3.redhat.com (8.12.11/8.12.10) with ESMTP id i82DqeCd005749
	for <linux-lvm@redhat.com>; Thu, 2 Sep 2004 09:52:40 -0400
Received: from dsl081-147-030.chi1.dsl.speakeasy.net (HELO
	mozart.theboulets.net) (spboulet@[64.81.147.30])
	(envelope-sender <stephen@theboulets.net>)
	by mail1.speakeasy.net (qmail-ldap-1.03) with SMTP
	for <linux-lvm@redhat.com>; 2 Sep 2004 13:52:40 -0000
From: Stephen Boulet <stephen@theboulets.net>
Subject: Re: [linux-lvm] Re: partition strategy
Date: Thu, 2 Sep 2004 08:52:39 -0500
References: <412CE781.9000409@m-cam.com> <41363AA0.5030107@m-cam.com>
In-Reply-To: <41363AA0.5030107@m-cam.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200409020852.39928.stephen@theboulets.net>
Reply-To: stephen@theboulets.net,
	LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@redhat.com

On Wednesday 01 September 2004 04:09 pm, Arshavir Grigorian wrote:

> Arshavir Grigorian wrote:


> > Is it better to create 3 partitions 2 x230G + 1G - create a striped LV
> > over the first 2, then add the third to the volume group, then extend
> > the LV over to the new 1G extension (since LVM2 allows extending
> > striped lv-s). And if so, does the non-striped area get used as a last
> > resort (after the striped area is completely full)?

I don't have the expertise to know for sure but that makes sense to me. I 
would just make 3 partitions -- you can always just save the 1GB partition 
for something else -- swap or a backup partition. 

-- 

Stephen      

If your desktop gets out of control easily,
you probably have too much stuff on it that
doesn't need to be there.
         Donna Smallin, "Unclutter Your Home"
