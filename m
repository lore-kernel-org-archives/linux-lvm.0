Received: from [10.34.26.15] (mazybook.brq.redhat.com [10.34.26.15])
	by int-mx05.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o67ELnbn007725
	for <linux-lvm@redhat.com>; Wed, 7 Jul 2010 10:21:50 -0400
Message-ID: <4C348D78.70201@redhat.com>
Date: Wed, 07 Jul 2010 16:21:44 +0200
From: Milan Broz <mbroz@redhat.com>
MIME-Version: 1.0
References: <1278510432.9312.14@raydesk1.bettercgi.com>
In-Reply-To: <1278510432.9312.14@raydesk1.bettercgi.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Only 4MB of space on a 1GB file mounted in loopback
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>

On 07/07/2010 03:47 PM, Ray Morris wrote:
>    Note that if you are using version 1 of LVM, or using
> version 1 style metadata with LVM2, a 4MB extent size limits
> the size of logical volumes you can create to 255GB (256GB?).

just note - please never use version 1 metadata format for new LVM2 config,
you will avoid problems in future, limits is one of them:-)

The only situation where this is really needed is compatibility
with lvm1 (2.4 kernel - RHEL3 for example).
(and after upgrade you can always use vgconvert to upgrade to LVM2 text
metadata format)

Milan
