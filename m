Message-ID: <53888E68.4080202@redhat.com>
Date: Fri, 30 May 2014 15:58:00 +0200
From: Zdenek Kabelac <zkabelac@redhat.com>
MIME-Version: 1.0
References: <20140522181334.GE1302@redhat.com>
	<20140529135246.GA31293@redhat.com>
	<20140529203410.GG1954@redhat.com>
	<20140529204719.GD1302@redhat.com>
	<20140529210648.GA3955@redhat.com>
	<20140529211955.GE1302@redhat.com>
	<20140529215815.GA4183@redhat.com>
	<20140530090422.GB31293@redhat.com>
	<20140530133814.GB8830@redhat.com> <53888ABF.8070104@redhat.com>
	<20140530135407.GM1302@redhat.com>
In-Reply-To: <20140530135407.GM1302@redhat.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Testing the new LVM cache feature
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "Richard W.M. Jones" <rjones@redhat.com>, Heinz Mauelshagen <heinzm@redhat.com>
Cc: thornber@redhat.com, Mike Snitzer <snitzer@redhat.com>, LVM general discussion and development <linux-lvm@redhat.com>

Dne 30.5.2014 15:54, Richard W.M. Jones napsal(a):
> I'm attaching 3 tests that I have run so (hopefully) you can see
> what I'm observing, or point out if I'm making a mistake.
>


I'd have asked - is there any difference in the test perfomance if you use
ramdisk device for your cache metadata device.
(So  _cdata stays on  'ssd', just _cmeta is located on i.e. loop0 with backend 
file in your tmpfs ramdisk device ?)

Zdenek
