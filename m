References: <1117624956.13982625.1557612463407.JavaMail.zimbra@karlsbakk.net>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <7e07a7b4-c4c3-bb43-6305-3949c1d1a849@redhat.com>
Date: Mon, 13 May 2019 10:26:09 +0200
MIME-Version: 1.0
In-Reply-To: <1117624956.13982625.1557612463407.JavaMail.zimbra@karlsbakk.net>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] LVM and HSM?
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
To: LVM general discussion and development <linux-lvm@redhat.com>, Roy Sigurd Karlsbakk <roy@karlsbakk.net>

Dne 12. 05. 19 v 0:07 Roy Sigurd Karlsbakk napsal(a):
> Hi
> 
> With lvmcache and all, is there anything in the works of making an HSM (Hierarchical storage management aka tiered storage) with LVM as with less-used data on slow, spinning rust and more-used data on higher tiers?
> 

Hi

There is no technical problem to enable caching of cached volume (aka  convert 
cache_cdata LV into another 'cached' volume.
And as long as there are not errors anywhere - it works.
Difficulty comes with solving error cases - and that's the main reason it's 
not enable so far.
So I don't see big issue with enabling usage on 'user's own risk'.


Regards

Zdenek
