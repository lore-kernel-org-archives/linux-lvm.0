Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.11.6) with ESMTP id
	k3MIn2lq005451
	for <linux-lvm@redhat.com>; Sat, 22 Apr 2006 14:49:02 -0400
Received: from astro.systems.pipex.net (astro.systems.pipex.net [62.241.163.6])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k3MImtdS025405
	for <linux-lvm@redhat.com>; Sat, 22 Apr 2006 14:48:56 -0400
Message-ID: <2036.192.168.0.15.1145731741.squirrel@192.168.0.15>
In-Reply-To: <1775.192.168.0.15.1145727636.squirrel@192.168.0.15>
References: <2996.192.168.0.15.1145660815.squirrel@192.168.0.15>
	<20060422080622.GB15564@percy.comedia.it>
	<1775.192.168.0.15.1145727636.squirrel@192.168.0.15>
Date: Sat, 22 Apr 2006 19:49:01 +0100 (BST)
Subject: Re: [linux-lvm] restoring my lvm
From: "Jannetta S Steyn" <jannetta@henning.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Reply-To: jannetta@henning.org,
	LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: jannetta@henning.org, LVM general discussion and development <linux-lvm@redhat.com>

Hi Luca

I made an error in my previous post. I wrote:

> /dev/hdb2 has two physical volumes, the first a swap and the second data.

It should be:
/dev/hdb2 has two logical volumes, the first a swap and the second data.

Regards
Jannetta
>


Random Thought:
---------------
Klein bottle for rent -- inquire within.
