Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i82C15325244
	for <linux-lvm@redhat.com>; Thu, 2 Sep 2004 08:01:05 -0400
Received: from mail6.speakeasy.net (mail6.speakeasy.net [216.254.0.206])
	by mx3.redhat.com (8.12.11/8.12.10) with ESMTP id i82C0rlt017109
	for <linux-lvm@redhat.com>; Thu, 2 Sep 2004 08:00:58 -0400
Received: from dsl081-147-030.chi1.dsl.speakeasy.net (HELO
	mozart.theboulets.net) (spboulet@[64.81.147.30])
	(envelope-sender <stephen@theboulets.net>)
	by mail6.speakeasy.net (qmail-ldap-1.03) with SMTP
	for <linux-lvm@redhat.com>; 2 Sep 2004 12:00:52 -0000
From: Stephen Boulet <stephen@theboulets.net>
Subject: Re: [linux-lvm] Unable to format certain volumes with lvm2 & reiserfs
Date: Thu, 2 Sep 2004 07:00:53 -0500
References: <200409012110.57955.stephen@theboulets.net>
In-Reply-To: <200409012110.57955.stephen@theboulets.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200409020700.53661.stephen@theboulets.net>
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

On Wednesday 01 September 2004 09:10 pm, Stephen Boulet wrote:

> I created some striped LVM2 volumes and I'm unable to format all but the
> first one.
Nevermind. Recreating the volume groups after doing vgremove did the trick. 
Maybe since I first formatted with reiser4?

-- 

Stephen      

If your desktop gets out of control easily,
you probably have too much stuff on it that
doesn't need to be there.
         Donna Smallin, "Unclutter Your Home"
