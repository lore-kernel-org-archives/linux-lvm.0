Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i23HCF815821
	for <linux-lvm@redhat.com>; Wed, 3 Mar 2004 12:12:15 -0500
Received: from ms-smtp-03.rdc-kc.rr.com (ms-smtp-03.rdc-kc.rr.com [24.94.166.129])
	by mx1.redhat.com (8.11.6/8.11.6) with SMTP id i23HCFb05436
	for <linux-lvm@redhat.com>; Wed, 3 Mar 2004 12:12:15 -0500
Message-Id: <200403031712.i23HC8d25573@ecstasy1.winternet.com>
From: Ken Fuchs <kfuchs@winternet.com>
In-reply-to: <20040303091549.GB17625@tykepenguin.com> (message from Patrick
	Caulfield on Wed, 3 Mar 2004 09:15:49 +0000)
Subject: Re: [linux-lvm] Re: Re
References: <20040302152911.GI15556@tangerine.coulon.evette> <20040302154631.GB12779@tykepenguin.com> <200403021719.i22HJk407665@ecstasy1.winternet.com> <20040303085729.GC2532@tangerine.coulon.evette> <20040303091549.GB17625@tykepenguin.com>
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
Date: Wed Mar  3 12:10:04 2004
List-Id: <linux-lvm.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

Patrick Caulfield <pcaulfie@redhat.com> wrote:

>It looks like the initrd is too full to hold the LVM metadata
>backups.  That's one of the problems with adding stuff to initrds - it
>takes up space that might be needed for other things!

If the initrd is too full, just make it bigger.  ;)

A good reason to make the initrd with plenty of empty space to begin
with is so its easy to add additional code without running out of
space.

Sincerely,

Ken Fuchs <kfuchs@winternet.com>
