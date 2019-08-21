References: <5c0bded03fb05d7320afa10e025b4061@cs.uni-dortmund.de>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <e730aa67-00da-4c9d-6e0b-4000dacdd15f@redhat.com>
Date: Wed, 21 Aug 2019 10:46:33 +0200
MIME-Version: 1.0
In-Reply-To: <5c0bded03fb05d7320afa10e025b4061@cs.uni-dortmund.de>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Programming interface
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
To: LVM general discussion and development <linux-lvm@redhat.com>, Christoph Pleger <christoph.pleger@cs.uni-dortmund.de>

Dne 21. 08. 19 v 9:58 Christoph Pleger napsal(a):
> Hello,
> 
> Some time ago, we wrote an application that uses the lvm2app interface to 
> manage volume groups and logical volumes. Of course, the application does not 
> work anymore, now that lvm2app has been skipped. So, is there anywhere 
> something like a guide how to rewrite code that used the lvm2app interface?

Hi

Unfortunatelly there is no API library anymore - we were simply not able to 
provide such interface - it's complex task and very low number of developers...

The 'new' idea was to use/provide 'DBus' API - however it's also not a lot of 
'traction' :( and it's also missing lot of features and design...

So I'd highly recommend to stick with a call standard lvm2 commands.

String interface is pretty good and easy to construct in all programming 
languages.

Note - lvs has pretty good formatting capabilities for easy parsing (even in 
i.e. BASH)

Regards


Zdenek
