Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id k26EhF132163
	for <linux-lvm@redhat.com>; Mon, 6 Mar 2006 09:43:15 -0500
Received: from zproxy.gmail.com (zproxy.gmail.com [64.233.162.205])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id k26EhEjl022186
	for <linux-lvm@redhat.com>; Mon, 6 Mar 2006 09:43:15 -0500
Received: by zproxy.gmail.com with SMTP id r28so1253964nza
	for <linux-lvm@redhat.com>; Mon, 06 Mar 2006 06:43:14 -0800 (PST)
Message-ID: <6dcf0dbc0603060643y14bf6388ocf90db2d03e597e7@mail.gmail.com>
Date: Mon, 6 Mar 2006 15:43:14 +0100
From: "John Smith" <lbalbalba@gmail.com>
Subject: Re: [linux-lvm] LVM2 intergrated 'native' mirroring support ?
In-Reply-To: <440C40B8.3070906@volved.com>
MIME-Version: 1.0
Content-Disposition: inline
References: <6dcf0dbc0603050853s6f9ec709g8ca57083a8e8c7c5@mail.gmail.com>
	<440B75C9.2000509@volved.com>
	<6dcf0dbc0603060536t2b124fccnd336f5cdeeb5637@mail.gmail.com>
	<440C40B8.3070906@volved.com>
Content-Transfer-Encoding: 8bit
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
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>

On 3/6/06, Barnaby Claydon <bclaydon@volved.com> wrote:
> Apparently there are a couple of new developments regarding the mirror
> LVs you mention.
>
> I found some interesting details from Redhat:
>
> http://developer.osdl.org/dev/clusters/docs/cluster_summit_mirror_paper.pdf
>
Ok, so if I understand correctly: LVM2 *still* requires device-mapper
but the mirroring functionality is integrated into the current CVS
version of LVM2, which not only makes LVM2 aware of the mirrors but
also removes the need for making the mirror copies 'outside' of the
logical volume manager.

Cool.


Sincerely,

John Smith.
