Received: from mx1.redhat.com (ext-mx09.extmail.prod.ext.phx2.redhat.com
	[10.5.110.13])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id oAF1To6k005284
	for <linux-lvm@redhat.com>; Sun, 14 Nov 2010 20:29:50 -0500
Received: from twist.antaree.com (diego.snet.sk [188.123.97.30])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id oAF1TbCV004379
	for <linux-lvm@redhat.com>; Sun, 14 Nov 2010 20:29:38 -0500
Date: Mon, 15 Nov 2010 02:29:14 +0100
From: Marek Soha <marek@snet.sk>
Message-ID: <339142753.20101115022914@snet.sk>
In-Reply-To: <AANLkTi=TdgXybQ_QREODKdrsyamot_cAHnrywom4bdxu@mail.gmail.com>
References: <606057079.20101114024527@snet.sk>
	<AANLkTi=TdgXybQ_QREODKdrsyamot_cAHnrywom4bdxu@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] LVM volume umask change
Reply-To: Marek Soha <marek@snet.sk>,
	LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="utf-8"
To: Eugene Vilensky <evilensky@gmail.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

ext3

Eugene, d�a 15. novembra 2010 ste nap�sali:
EV> On Sat, Nov 13, 2010 at 7:45 PM, Marek Soha <marek@snet.sk> wrote:
>> When I create file/directory in LVM volume, it is created with
>> permissions (mode) 666. I need to get 644.
>> I changed umask in /etc/lvm/lvm.conf, but it did not helped.
>> Any ideas?

EV> Curious.  What is the filesystem of your logical volume?

EV> _______________________________________________
EV> linux-lvm mailing list
EV> linux-lvm@redhat.com
EV> https://www.redhat.com/mailman/listinfo/linux-lvm
EV> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
