References: <5CD4E950020000F900064DCE@prv1-mh.provo.novell.com>
	<5CDA5F6E020000F9000657F6@prv1-mh.provo.novell.com>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <59ef89f8-9642-4455-cef0-450816eace0d@redhat.com>
Date: Tue, 14 May 2019 10:00:40 +0200
MIME-Version: 1.0
In-Reply-To: <5CDA5F6E020000F9000657F6@prv1-mh.provo.novell.com>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Does LVM2 support building with LTO enablement?
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
To: LVM general discussion and development <linux-lvm@redhat.com>, Gang He <ghe@suse.com>

Dne 14. 05. 19 v 8:25 Gang He napsal(a):
> Hello Guys,
> 
> Anybody touched this area?
> 
> Thanks
> Gang


Hi

I'll take a look - although it looks like the problem is possibly with libaio ?

Is libaio usable with -flto ?

ATM libaio is mandatory for building lvm2.

BTW - why do you need to use this option - lvm2 isn't really CPU cycle bounded 
  - if there is something slow it's typically some design issue - -flto will not
really improve things here...

Zdenek
