MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Date: Fri, 23 Aug 2019 15:20:11 +0200
From: Christoph Pleger <christoph.pleger@cs.uni-dortmund.de>
In-Reply-To: <e730aa67-00da-4c9d-6e0b-4000dacdd15f@redhat.com>
References: <5c0bded03fb05d7320afa10e025b4061@cs.uni-dortmund.de>
	<e730aa67-00da-4c9d-6e0b-4000dacdd15f@redhat.com>
Message-ID: <f9fa72fe498c9a2fcc9be7d70f809171@cs.uni-dortmund.de>
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
To: Zdenek Kabelac <zkabelac@redhat.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

Hello,

>> Some time ago, we wrote an application that uses the lvm2app interface 
>> to manage volume groups and logical volumes. Of course, the 
>> application does not work anymore, now that lvm2app has been skipped. 
>> So, is there anywhere something like a guide how to rewrite code that 
>> used the lvm2app interface?

> Unfortunatelly there is no API library anymore - we were simply not
> able to provide such interface - it's complex task and very low number
> of developers...

When, as a quick solution, I install a binary package containing one of 
the last lvm2app versions that was still included in the same lvm2 
upstream version, will that still work, in combination with newer lvm 
programs and libraries?

Regards
   Christoph
