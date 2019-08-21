References: <5c0bded03fb05d7320afa10e025b4061@cs.uni-dortmund.de>
	<e730aa67-00da-4c9d-6e0b-4000dacdd15f@redhat.com>
	<d665ffeb83394a4bf24835f901311db0@cs.uni-dortmund.de>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <0d19c968-e9ff-599e-60fd-c83a96c2ea07@redhat.com>
Date: Wed, 21 Aug 2019 14:08:38 +0200
MIME-Version: 1.0
In-Reply-To: <d665ffeb83394a4bf24835f901311db0@cs.uni-dortmund.de>
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

Dne 21. 08. 19 v 13:14 Christoph Pleger napsal(a):
> Hello,
> 
>> The 'new' idea was to use/provide 'DBus' API - however it's also not a
>> lot of 'traction' :( and it's also missing lot of features and
>> design...
> 
> Surely you are not saying that the dbus interface will also disappear - 
> because I am using that in another, less complicated application, though not 
> directly, but with libblockdev.


It's rather the issue of maintenance and keeping it 'up-to-date' with current 
lvm2 - since there are already quite a few missing 'parts' to be encoded into 
dbus...


Zdenek
