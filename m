Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.19])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id q7NFNHFx002972
	for <linux-lvm@redhat.com>; Thu, 23 Aug 2012 11:23:17 -0400
Received: from hobgoblin.beer.org.uk (beer.org.uk [91.84.48.107])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q7NFNC1O001097
	for <linux-lvm@redhat.com>; Thu, 23 Aug 2012 11:23:13 -0400
Received: from hobgoblin.beer.org.uk (hobgoblin [127.0.0.1] (may be forged))
	by hobgoblin.beer.org.uk (8.13.1/8.13.1) with ESMTP id q7NFNCD8020504
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Thu, 23 Aug 2012 16:23:12 +0100
Message-ID: <57766.78.154.109.125.1345735392.squirrel@yellowside.org.uk>
In-Reply-To: <CAGQjrKbLD0bwedMGQP58BzdyFsnACdXLiziHLbw=tStAhX4BsA@mail.gmail.com>
References: <CAGQjrKZju5zQA9_cGtO+n0WRe2t6ZSJB+SKfr23+JJ3YzntgUQ@mail.gmail.com>
	<CAGQjrKYZw27r=xgB2DaBtap-jQ1oi-7_Ydw=3z+2kw4s_03hAA@mail.gmail.com>
	<39598.78.154.109.125.1345731038.squirrel@yellowside.org.uk>
	<CAGQjrKbLD0bwedMGQP58BzdyFsnACdXLiziHLbw=tStAhX4BsA@mail.gmail.com>
Date: Thu, 23 Aug 2012 16:23:12 +0100 (BST)
From: "Vic" <lvm@beer.org.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] lvextend NEVER works but screws up
Reply-To: lvm@beer.org.uk,
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
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>


>  lvresize to extend an lvm ? how

lvresize -L +size /dev/vg_whatever/lv_thingie
resize2fs /dev/vg_whatever/lv_thingie

> lvm has NEVER been consistent in my case .

LVM has always been consistent in my case, except for the time I tried to
mirror a VG, when it wouldn't start without both halves of the mirror :-(

Vic.
