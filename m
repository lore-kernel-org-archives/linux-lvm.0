Mime-Version: 1.0 (Apple Message framework v1085)
From: Brassow Jonathan <jbrassow@redhat.com>
In-Reply-To: <1410506681.13625.60.camel@kurenai.local>
Date: Tue, 23 Sep 2014 23:17:42 -0500
Message-Id: <20867636-9D00-471E-BDE2-EE9533D52E7F@redhat.com>
References: <1408896497.27190.12.camel@kurenai.local>
	<5211F372-B9BB-43A8-B569-AC1E3B077D15@redhat.com>
	<1409828800.6181.19.camel@kurenai.local>
	<0C032AC6-0346-4E28-BC0A-240EC76C44E2@redhat.com>
	<1410202048.13625.27.camel@kurenai.local>
	<47B3B0F3-0BC9-41D9-AB5C-FC1027E7B00F@redhat.com>
	<1410506681.13625.60.camel@kurenai.local>
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] Does LVM RAID1 have TRIM support?
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
Cc: oranenj+lvm@iki.fi


On Sep 12, 2014, at 2:24 AM, Jarkko Oranen wrote:

> On Thu, 2014-09-11 at 18:31 -0500, Brassow Jonathan wrote:
> 
>> dm-raid.c does not have that - dm-raid1.c does.  dm-raid1.c is a mirroring implementation specific to device-mapper.  It is used by LVM for pvmove functionality (and is otherwise being slowly phased out).  dm-raid.c is the device-mapper wrapper around the MD RAID personalities.  It does not have discard support.
>> 
>> I will ask Neil what the current state of discard support is in MD.  I see that "support" was added in Oct of 2012 (starting at commit 2ff8cc2), but I remember them having problems with discards + any resync operations.  If Neil says it is ok, I will turn it on.
>> 
> 
> In the code that I'm looking at dm-raid.c definitely sets
> num_discard_bios to 1 on something... As does dm-raid1.c. However,
> Thanks for looking into it!

Heinz Mauelshagen is looking to get this included upstream now.  Thanks for the poke!  :)

Initial status query:
http://marc.info/?l=linux-raid&m=141047869821032&w=2

Patch posted for consideration:
https://www.redhat.com/archives/dm-devel/2014-September/msg00126.html

 brassow
