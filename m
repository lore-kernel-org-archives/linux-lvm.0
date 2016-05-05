Received: from [10.10.55.165] (vpn-55-165.rdu2.redhat.com [10.10.55.165])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u45MVPs7031133
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Thu, 5 May 2016 18:31:26 -0400
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
From: Brassow Jonathan <jbrassow@redhat.com>
In-Reply-To: <5728628E.5090404@redhat.com>
Date: Thu, 5 May 2016 17:31:25 -0500
Message-Id: <5B6E92E7-34F0-4F3A-896D-3AB5EC046868@redhat.com>
References: <8B2E34D671F53945B041A44D66D79E6EAABD77@P-EXMB5-DC21.corp.sgi.com>
	<57273419.3000102@suse.com> <5728628E.5090404@redhat.com>
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] LVM feature parity with MD
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
Content-Type: text/plain; charset="utf-8"
To: LVM general discussion and development <linux-lvm@redhat.com>


> On May 3, 2016, at 3:34 AM, Zdenek Kabelac <zkabelac@redhat.com> wrote:
> 
> On 2.5.2016 13:03, Fabian Herschel wrote:
>> Can LVM doing a delta sync and does LVM have something like a bitamp to show
>> which parts are in sync and which needs a sync?
>> 
> 
> Hi
> 
> lvm uses small metadata LV with each raid1 leg - which holds the bitmap about individual regionsize areas in sync.
> 
> So when there is 'crash' only async areas are synced again after array restart.

In fact, it works very much the same way as MD, because it uses the same kernel module to perform it.  You can also check-out ‘lvconvert —splitmirror —trackchanges …’.  This would allow you to temporarily split off a RAID1 leg and then reintroduce it later while only updating the portions that have changed.

When you use the ‘raid1’ segment type (the default upstream and in RHEL7) and not the ‘mirror’ segment type, a transient failure can be recovered while only resyncing the changes.

 brassow
